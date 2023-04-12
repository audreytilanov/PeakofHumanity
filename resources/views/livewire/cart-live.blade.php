<div class="row">
    <div class="col-lg-8 col-md-12">
        <div class="cart-table-wrap">
            <table class="cart-table">
                <thead class="cart-table-head">
                    <tr class="table-head-row">
                        <th class="product-remove"></th>
                        <th class="product-image">Product Image</th>
                        <th class="product-image">Product</th>
                        <th class="product-price">Price</th>
                        <th class="product-quantity">Quantity</th>
                        <th class="product-total">Total</th>
                        {{-- <th class="product-total"></th> --}}
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $datas)
                    <tr class="table-body-row">
                        <td class="product-remove"><a wire:click="delete({{ $datas->id }})" href="javascript:void(0)"><i class="fa fa-times"></i></a></td>
                        <td class="product-image">
                            @if(!empty($datas->products->images->first()->image_name))
                                <img src="{{ URL::asset('admin/product/'.$datas->products->images->first()->image_name) }}" alt=""></a>
                            @endif
                        </td>
                        <td class="product-name">{{ $datas->products->product_name }}</td>
                        <td class="product-price"
                        >
                        @if(!empty($datas->products->discounts)) 
                        Rp. {{ number_format($datas->products->price - ($datas->products->price * $datas->products->discounts->percentage/100)) }}
                        @else 
                        {{ number_format($datas->products->price) }}
                        @endif
                        </td>
                        <td class="product-quantity">
                            <a href="javascript:void(0)" wire:click="subtract({{ $datas->id }})"><i class="fa fa-minus"></i></a>
                            <input type="number" class="text-center" style="max-width: 50px" value="{{ $datas->qty }}" disabled>
                            <a href="javascript:void(0)" wire:click="add({{ $datas->id }})"><i class="fa fa-plus"></i></a>
                        </td>
                        <td class="product-total">
                        @if(!empty($datas->products->discounts)) 
                            Rp. {{ number_format(($datas->products->price - ($datas->products->price * $datas->products->discounts->percentage/100))*$datas->qty) }}
                        @else 
                            {{ number_format($datas->products->price*$datas->qty) }}
                        @endif
                        </td>
                        {{-- <td>
                            <div class="cart-buttons" style="margin-top: 0!important;">
                                <a href="{{ route('user.negotiation.index', $datas->products->id) }}" class="boxed-btn black">Negotiation</a>
                            </div>
                        </td> --}}
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        {{-- <div class="checkout-accordion-wrap">
            <div class="accordion" id="accordionExample">
              <div class="card single-accordion">
                <div class="card-header" id="headingOne">
                  <h5 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Negotiation
                    </button>
                  </h5>
                </div>
                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                  <div class="card-body">
                    <div class="card-details">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="cart-table-wrap">
                                    <table class="cart-table">
                                        <thead class="cart-table-head">
                                            <tr class="table-head-row">
                                                <th>Product</th>
                                                <th>Negotiation Price</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($negotiationData as $nego)
                                            <tr>
                                                <td>{{ $nego->products->product_name }}</td>
                                                <td>{{ $nego->details->first()->harga_penawaran }}</td>
                                                <td><span class="badge badge-pill badge-primary p-2 pl-3 pr-3">{{ Str::title($nego->details->first()->status) }}</span></td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

        </div> --}}
    </div>

    <div class="col-lg-4">
        <div class="total-section">
            <table class="total-table">
                <thead class="total-table-head">
                    <tr class="table-total-row">
                        <th>Total</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="total-data">
                        <td><strong>Total Weight: </strong></td>
                        <td>{{ $grand_sum }} Kg</td>
                    </tr>
                    <tr class="total-data">
                        <td><strong>Grand Total: </strong></td>
                        <td>Rp. {{ number_format($grand_total) }}</td>
                    </tr>
                </tbody>
            </table>
            <div class="cart-buttons">
                <a href="{{ route('user.transaction') }}" class="boxed-btn black">Check Out</a>
            </div>
        </div>
    </div>
</div>
