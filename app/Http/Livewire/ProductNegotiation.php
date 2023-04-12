<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Negotiation;
use App\Models\NegotiationDetails;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class ProductNegotiation extends Component
{
    public $productId;
    public $negotiationPrice;
    public $harga_akhir;

    public function render()
    {
        $negotiationData = Negotiation::with(['details' => function ($q) {
            $q->orderBy('created_at', 'DESC');
        },'products'])->where('user_id', Auth::guard('web')->user()->id)->where('product_id', $this->productId)->first();

        // if(!empty($negotiationData)){
        $checkLastStatus = Negotiation::with(['details' => function ($q) {
            $q->orderBy('created_at', 'DESC');
        },'products'])->where('status', 'on.progress')->where('user_id', Auth::guard('web')->user()->id)->where('product_id', $this->productId)->first();

        if(empty($checkLastStatus)){
            $checkLastStatus = Negotiation::where('status', 'completed')->where('user_id', Auth::guard('web')->user()->id)->where('product_id', $this->productId)->first();

            $checkStatus =NegotiationDetails::where('negotiation_id', $checkLastStatus->id)->orderBy('created_at', 'DESC')->first();
        }

        // }
        // dd($negotiationData);

        $productDetails = Product::find($this->productId);
        
        return view('livewire.product-negotiation', compact('negotiationData', 'productDetails', 'checkLastStatus', 'checkStatus'));
    }

    public function addNegotiation($id){
        // dd($product_id);
        $price = str_replace(',', '', $this->negotiationPrice);
        $checkNegotiationParent = Negotiation::where('product_id', $id)->where('user_id', Auth::guard('web')->user()->id)->where('status', 'on.progress')->first();
        if(empty($checkNegotiationParent)){
            $checkNegotiationParent = Negotiation::create([
                'product_id' => $id,
                'user_id' => Auth::guard('web')->user()->id,
                'status' => 'on.progress',
            ]);
        }
        $treshold = Product::find($id);
        
        $checkPriceTreshold = $treshold->price - ($treshold->price * 0.2);

        if($price < $checkPriceTreshold){
            $this->dispatchBrowserEvent('swal', [
                'title' => 'Harga nego tidak boleh lebih dari 20% dari harga asli!',
            ]);
        }else{
            $checkDetailStatus = NegotiationDetails::where('negotiation_id', $checkNegotiationParent->id)->orderBy('created_at', 'DESC')->first();
            if(!empty($checkDetailStatus) && $checkDetailStatus->status == 'penawaran'){
                $this->dispatchBrowserEvent('swal', [
                    'title' => 'Penawaran hanya bisa dilakukan lagi setelah admin membalas',
                ]);
            }else{
                if(!empty($checkNegotiationParent)){
                    NegotiationDetails::create([
                        "negotiation_id" => $checkNegotiationParent->id,
                        'harga_penawaran' => $price,
                        'status' => 'penawaran'
                    ]);
                    
                }else{
                    $newNegotiationData = Negotiation::create([
                        'product_id' => $this->productId,
                        'user_id' => Auth::guard('web')->user()->id,
                    ]);
        
                    NegotiationDetails::create([
                        "negotiation_id" => $newNegotiationData->id,
                        'harga_penawaran' => $price,
                        'status' => 'penawaran'
                    ]);
                }
                $this->dispatchBrowserEvent('swal', [
                    'title' => 'Negotiation Submitted!',
                ]);
            }
        }

    }

    public function accNegotiations($id){
        $submitFinalNegotiation = Negotiation::where('product_id', $id)->where('user_id', Auth::guard('web')->user()->id)->orderBy('created_at', 'DESC')->where('status', 'completed')->first();

        $detailHargaAkhir = NegotiationDetails::where('negotiation_id', $submitFinalNegotiation->id)->orderBy('created_at', 'DESC')->first();
        
        $submitFinalNegotiation->update([
            'status' => 'accepted',
            'harga_akhir' => $detailHargaAkhir->harga_penawaran,
        ]);

        $this->dispatchBrowserEvent('swal', [
            'title' => 'Negotiation Accepted!',
        ]);
        return redirect()->route('user.cart');

    }

}
