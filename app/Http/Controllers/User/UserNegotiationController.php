<?php

namespace App\Http\Controllers\User;

use App\Models\Product;
use App\Models\Negotiation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserNegotiationController extends Controller
{
    public function index($id){
        $productDetails = Product::with('images', 'categories')->where('id', $id)->first();
        $negotiation = Negotiation::with(['details' => function ($q) {
            $q->orderBy('created_at', 'DESC');
        },'products'])->where('status', 'on.progress')->where('user_id', Auth::guard('web')->user()->id)->where('product_id', $productDetails->id)->first();

        if(empty($negotiation)){
            $negotiation = Negotiation::create([
                'product_id' => $productDetails->id,
                'user_id' => Auth::guard('web')->user()->id,
                'status' => 'on.progress',
            ]); 
        }

        return view('user.negotiation', compact('productDetails'));
    }
}
