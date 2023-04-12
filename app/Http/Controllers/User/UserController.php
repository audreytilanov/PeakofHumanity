<?php

namespace App\Http\Controllers\User;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\ProductCategory;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    
    public function index(){
        $data = Product::with(['categories' => function ($q) {
            $q->with(['categories']);
        }, 'images'])->paginate(10);
        // dd($data[6]->categories);
        $category = ProductCategory::all();
        return view('user.home', compact('data', 'category'));
    }
}
