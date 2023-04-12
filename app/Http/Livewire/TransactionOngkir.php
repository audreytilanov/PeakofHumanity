<?php

namespace App\Http\Livewire;

use Midtrans\Snap;
use App\Models\Cart;
use App\Models\City;
use Midtrans\Config;
use App\Models\Admin;
use App\Models\Courier;
use App\Models\Product;
use Livewire\Component;
use App\Models\Province;
use App\Models\Transaction;
use Illuminate\Support\Carbon;
use App\Models\TransactionDetail;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use App\Notifications\AdminNotification;
use Kavist\RajaOngkir\Facades\RajaOngkir;
use Illuminate\Support\Facades\Notification;

class TransactionOngkir extends Component
{
    public $city_destination;
    public $cities = [];
    public $dataId;
    public $province_destination;
    public $courier;
    public $cost = [];
    public $costDetail;
    public $shipping = array();
    public $package;
    public $grand_total;
    public $grand_sum;
    public $address;
    public $singleQty;
    public $tglPemasangan;
    public $tglPembongkaran;

    public $clientKey;
    public $serverKey;
    public $snapToken;

    public function render()
    {
        // Set your Merchant Server Key
        // $this->serverKey = Config::$serverKey = 'SB-Mid-server-gnWNEdyxhjEvizfvvRnLk35O';
        // $this->clientKey = Config::$clientKey = 'SB-Mid-client-YkFCwND4J-WjvHBD';
        // // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
        // Config::$isProduction = false;
        // // Set sanitization on (default)
        // Config::$isSanitized = true;
        // // Set 3DS transaction for credit card to true
        // Config::$is3ds = true;

        // $transaction_details = array(
        //     'order_id' => rand(),
        //     'gross_amount' => 94000, // no decimal allowed for creditcard
        // );
        
        // // Optional
        // $item1_details = array(
        //     'id' => 'a1',
        //     'price' => 18000,
        //     'quantity' => 3,
        //     'name' => "Apple"
        // );
        
        // // Optional
        // $item2_details = array(
        //     'id' => 'a2',
        //     'price' => 20000,
        //     'quantity' => 2,
        //     'name' => "Orange"
        // );
        
        // // Optional
        // $item_details = array ($item1_details, $item2_details);
        
        // // Optional
        // $billing_address = array(
        //     'first_name'    => "Andri",
        //     'last_name'     => "Litani",
        //     'address'       => "Mangga 20",
        //     'city'          => "Jakarta",
        //     'postal_code'   => "16602",
        //     'phone'         => "081122334455",
        //     'country_code'  => 'IDN'
        // );
        
        // // Optional
        // $shipping_address = array(
        //     'first_name'    => "Obet",
        //     'last_name'     => "Supriadi",
        //     'address'       => "Manggis 90",
        //     'city'          => "Jakarta",
        //     'postal_code'   => "16601",
        //     'phone'         => "08113366345",
        //     'country_code'  => 'IDN'
        // );
        
        // // Optional
        // $customer_details = array(
        //     'first_name'    => "Andri",
        //     'last_name'     => "Litani",
        //     'email'         => "andri@litani.com",
        //     'phone'         => "081122334455",
        //     'billing_address'  => $billing_address,
        //     'shipping_address' => $shipping_address
        // );
        
        // // Optional, remove this to display all available payment methods
        // $enable_payments = array('credit_card','cimb_clicks','mandiri_clickpay','echannel');
        
        // // Fill transaction details
        // $transaction = array(
        //     'enabled_payments' => $enable_payments,
        //     'transaction_details' => $transaction_details,
        //     'customer_details' => $customer_details,
        //     'item_details' => $item_details,
        // );
        
        // $snapToken = '';
        // try {
        //     $snapToken = Snap::getSnapToken($transaction);
        // }
        // catch (\Exception $e) {
        //     echo $e->getMessage();
        // }
        
        if(!empty($this->province_destination)) {
            $this->cities = City::where('province_id', $this->province_destination)->get();
            // dd($this->cities);
            // foreach ($this->cities as $key => $value) {
            //     dd($value);
            // }

        }
        if($this->dataId == 0 ||$this->dataId == null){
            $data = Cart::where('user_id', Auth::guard('web')->user()->id)->with(['products' => function ($q) {
                $q->with(['images']);
            }])->get();
            
        
            $total_satuan = array();
            $total_weight = array();
            foreach ($data as $total) {
                if(!empty($total->products->discounts)){
                    array_push($total_satuan, ($total->products->price - ($total->products->price * $total->products->discounts->percentage/100))* $total->qty);
                } 
                else {
                    array_push($total_satuan, $total->products->price * $total->qty);
                }
                array_push($total_weight, $total->products->weight * $total->qty);
            }
            
            $this->grand_total = array_sum($total_satuan);
            $this->grand_sum = array_sum($total_weight)*1000;
        }else{
            $data = Product::with('images')->find($this->dataId);

            $total_satuan = array();
            $total_weight = array();
            if(!empty($data->discounts)){
                array_push($total_satuan, ($data->price - ($data->price * $data->discounts->percentage/100))* $this->singleQty);

            } 
            else {
                array_push($total_satuan, $data->price * $this->singleQty);

            }
            array_push($total_weight, $data->weight * $this->singleQty);
            $this->grand_total = array_sum($total_satuan);
            $this->grand_sum = array_sum($total_weight)*1000;
        }
        // dd($data->images->first());

        // dd($this->grand_sum);


        // if($this->grand_sum < 30000){
        //     if(!empty($this->province_destination) && !empty($this->city_destination) && !empty($this->courier)){
        //         $cost = RajaOngkir::ongkosKirim([
        //             'origin'        => 1, // ID kota/kabupaten asal// ID BALI
        //             'destination'   => $this->city_destination, // ID kota/kabupaten tujuan
        //             'weight'        => $this->grand_sum, // berat barang dalam gram
        //             'courier'       => $this->courier // kode kurir pengiriman: ['jne', 'tiki', 'pos'] untuk starter
        //         ])->get();
        //         // $this->shipping = $cost[0]['costs'][0];
        //         $this->shipping = $cost[0]['costs'];
        //     }

        //     if(!empty($this->package)){
        //         foreach ($this->shipping as $key) {
        //             if($key['service'] == $this->package){
        //                 $this->costDetail = $key['cost'][0]['value'];
        //             }
        //         }
        //     }
        // }else{
        //     $this->dispatchBrowserEvent('swal', [
        //         'title' => 'Weight is over limit! (Limit 30000 Gram)',
        //     ]);
        // }
        $provinces = Province::all();
        $couriers = Courier::all();
        // dd($provinces);
        return view('livewire.transaction-ongkir', compact('provinces', 'couriers', 'data'));
    }

    public function transaction(){
        // $checkCourier = Courier::where('courier', $this->courier)->first();
        $date = Carbon::now();
        $date->setTimezone('Asia/Hong_Kong');
        $date->addDays(1);
        // dd($date);
        Transaction::create([
            'user_id' => Auth::guard('web')->user()->id,
            // 'courier_id' => $checkCourier->id,
            'city_id' => $this->city_destination,
            'province_id' => $this->province_destination,
            'timeout' => $date,
            'address' => $this->address,
            'total' => $this->grand_sum,
            'code' => 0,
            'slug' => 0,
            // 'shipping_cost' => $this->costDetail,
            'sub_total' => $this->grand_total + $this->costDetail,
            'tgl_pemasangan' => $this->tglPemasangan,
            'tgl_pembongkaran' => $this->tglPembongkaran,
            'status' => 'unpaid'
        ]);
        if($this->dataId == 0 ||$this->dataId == null){
            $data = Cart::where('user_id', Auth::guard('web')->user()->id)->with(['products' => function ($q) {
                $q->with(['images']);
            }])->get();
            $idTransactionLast = Transaction::orderBy('id', 'DESC')->first();

            foreach ($data as $value) {
                TransactionDetail::create([
                    'transaction_id' => $idTransactionLast->id,
                    'product_id' => $value->product_id,
                    'qty' => $value->qty,
                    'selling_price' => $value->products->price * $value->qty
                ]);
            }
            $getCart = Cart::where('user_id', Auth::guard('web')->user()->id);
            
            $getCart->delete();
        }else{
            $data = Product::find($this->dataId);
            $idTransactionLast = Transaction::orderBy('id', 'DESC')->first();

            TransactionDetail::create([
                'transaction_id' => $idTransactionLast->id,
                'product_id' => $data->id,
                'qty' => $this->singleQty,
                'selling_price' => $data->price * $this->singleQty
            ]);
        }
        $user = Admin::all();
        $message = "Transaksi Baru dari " . Auth::guard('web')->user()->name . "";
        Notification::send($user, new AdminNotification($message));

        toast('Thank You For Your Review','success');
        // dd($idTransactionLast);
        
        
        $this->dispatchBrowserEvent('swal', [
            'title' => 'Transaction Placed! PAY NOW!',
        ]);
        return redirect()->route('user.history.transaction', $idTransactionLast);
        
    }

    public function addSingle(){
        $this->singleQty +=1;
    }

    public function subtractSingle(){
        if($this->singleQty <= 1){
            $this->dispatchBrowserEvent('swal', [
                'title' => 'Quantity Invalid!',
            ]);
        }else{
            $this->singleQty -=1;

        }
    }
}
