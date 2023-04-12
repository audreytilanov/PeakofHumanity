<?php

namespace App\Http\Livewire;

use App\Models\Cart;
use App\Models\Negotiation;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class CartLive extends Component
{
    public function render()
    {
        $data = Cart::where('user_id', Auth::guard('web')->user()->id)->with(['products' => function ($q) {
            $q->with(['images','discounts']);
        }],)->get();

        $productArray = Cart::where('user_id', Auth::guard('web')->user()->id)->pluck('product_id')->toArray();

        $negotiationData = Negotiation::with(['details' => function ($q) {
            $q->orderBy('created_at', 'DESC');
        },'products'])->where('user_id', Auth::guard('web')->user()->id)->whereIn('product_id', $productArray)->get();

        // dd($data);
        $total_satuan = array();
        $total_weight = array();
        foreach ($data as $total) {
            // dd($total->products->discounts);
            if(!empty($total->products->discounts)){
                array_push($total_satuan, ($total->products->price - ($total->products->price * $total->products->discounts->percentage/100))* $total->qty);
            } 
            else {
                array_push($total_satuan, $total->products->price * $total->qty);
            }
            array_push($total_weight, $total->products->weight * $total->qty);
        }
        // dd($total_satuan);
        $grand_total = array_sum($total_satuan);
        $grand_sum = array_sum($total_weight);
        
        return view('livewire.cart-live', compact('data', 'grand_total', 'grand_sum', 'negotiationData'));
    }

    public function add($id){
        $data = Cart::find($id);
        if($data->qty + 1 > $data->products->stock){
            $this->dispatchBrowserEvent('swal', [
                'title' => 'Produk melebihi stock tersisa!',
            ]);
        }else{
            $data->update([
                'qty' => $data->qty + 1
            ]);
        }
        
    }

    public function subtract($id){
        $data = Cart::find($id);
        if($data->qty - 1 < 0){
            $this->dispatchBrowserEvent('swal', [
                'title' => 'Produk tidak boleh dibawah nol!',
            ]);
        }else{
            $data->update([
                'qty' => $data->qty - 1
            ]);
        }
        
    }

    public function delete($id){
        $data = Cart::find($id);
        $data->delete();
        
        $this->dispatchBrowserEvent('swal', [
            'title' => 'Item Deleted',
        ]);
    }
}
