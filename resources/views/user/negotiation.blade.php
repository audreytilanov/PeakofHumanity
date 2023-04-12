@extends('layouts.user')
@section('section')
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Product Negotiation</p>
                    <h3 class="text-white">{{ $productDetails->product_name }}</h3>
                </div>
            </div>
        </div>
    </div>
</div>

@livewire('product-negotiation', ['productId' => $productDetails->id])

@endsection