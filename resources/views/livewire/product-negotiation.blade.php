<div wire:poll>
    <div class="single-product mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- home page slider -->
                    <!-- single home slider -->
                    @if($productDetails->images->count() <= 1)
                        <div class="single-product-img">
                            @if(!empty($productDetails->images->first()->image_name))
                                <img src="{{ URL::asset('admin/product/'.$productDetails->images->first()->image_name) }}" alt="">
                            @endif
                        </div>
                    @else
                        <div class="homepage-slider2">
                        @foreach ($productDetails->images as $item)
                            <div class="single-homepage-slider2" style="background-image: url('{{asset('admin/product/'.$item->image_name)}}');">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12 col-sm-5 col-md-5 text-center">
                                            <div class="hero-text">
                                                <div class="hero-text-tablecell">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div>
                    @endif
                    <!-- end home page slider -->
                </div>
                <div class="col-md-7">
                    <div class="single-product-content">
                        <h3>{{ $productDetails->product_name }}</h3>
                        <p class="single-product-pricing"><span>{{ $productDetails->weight }} Kg</span> 
                            @if(!empty($productDetails->discounts)) 
                            Rp. {{ number_format($productDetails->price - ($productDetails->price * $productDetails->discounts->percentage/100)) }}
                            @else 
                            {{ number_format($productDetails->price) }}
                            @endif</p>
                        <p>{{ $productDetails->description }}</p>
                        <div class="single-product-form">
                            <p><strong>Categories: </strong>
                                @if(!empty($productDetails->categories->categories->category_name))
                                    {{ $productDetails->categories->categories->category_name }}
                                @else
                                    No Category
                                @endif
                            </p>
                        </div>
                    </div>
                </div>
            
            </div>
        </div>
    </div>

    <div class="comments-list-wrap col-lg-12">
        <h3 class="comment-count-title text-center">NEGOTIATIONS</h3>
        <div class="cart-section">
            <div class="container">
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                            <tr class="table-head-row">
                                <th class="product-image"></th>
                                <th class="product-image"></th>
                                <th class="product-price">Negotiation Price</th>
                                <th class="product-quantity"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="bg-info text-white">
                                <td colspan="2">
                                    <h5 class="text-white text-right mr-4" style="margin-bottom: 0!important">Create Negotiations</h5>
                                </td>
                                <td style="width:auto;">
                                    <span>
                                        <label>
                                            <h5 class="text-white" style="margin-bottom: 0!important">Rp.&emsp;</h5>
                                        </label>
                                        <input wire:model="negotiationPrice" style="font-size: 20px; font-weight:800;" type="text" name="negotiationPrice" class="rounded priceDecimal pt-2 pb-2">
                                    </span>
                                </td>
                                <td colspan="1">
                                    @if($checkLastStatus->status == 'on.progress' || $checkStatus == 'completed')
                                        <form wire:submit.prevent="addNegotiation({{ $productId }})" action="{{ route('user.home') }}" method="post">
                                            @csrf
                                            <button type="submit" class="cart-btn"><i class="fas fa-shopping-cart"></i> Submit Negotiation</button>
                                        </form>
                                    @else
                                        <p class="text-white">This product's negotiation has ended</p>
                                    @endif
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>  

    <div class="comments-list-wrap col-lg-12">
        <div class="cart-section mb-150">
            <div class="container">
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                            <tr class="table-head-row">
                                <th class="product-image">Negotiation Price</th>
                                <th class="product-image">Status</th>
                                <th class="product-price">Created At</th>
                                <th class="product-quantity">Answered By</th>
                                <th class="product-quantity"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @if (!empty($negotiationData))
                                @foreach ($negotiationData->details as $nego)
                                <tr class="table-body-row">
                                    <td>
                                        <span class="badge badge-pill badge-danger p-2 pl-3 pr-3">
                                            Rp. {{ number_format($nego->harga_penawaran)}}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-pill badge-primary p-2 pl-3 pr-3">{{ Str::title($nego->status)}}</span>
                                        
                                    </td>
                                    <td>
                                        {{ $nego->created_at}}
                                    </td>
                                    <td>
                                        <span class="badge badge-pill badge-warning p-2 pl-3 pr-3">{{ Str::title($nego->admins->name ?? 'Not Answered Yet')}}</span>
                                    </td>
                                    <td>
                                        @if(in_array($nego->status, ['penawaran.terakhir']))
                                        <form wire:submit.prevent="accNegotiations({{ $productId }})" action="{{ route('user.home') }}" method="post">
                                            @csrf
                                            <button type="submit" class="cart-btn"><i class="fas fa-thumbs-up"></i> Accept Negotiation</button>
                                        </form>
                                        @else
                                            -
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>  
</div>