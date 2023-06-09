@extends('layouts.admin')
@section('section')
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1><b>TRANSACTION</b>, <span>Menentukan Harga Ongkir</span></h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Dashboard</a></li>
                                <li class="breadcrumb-item active">Transaction</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-title">
                        <h4><b>Harga Ongkir</b></h4>
                        
                    </div>
                    <div class="card-body">
                        <div class="basic-form">
                            <form action="{{ route('admin.transaction.update', $data->id) }}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label>Alamat</label>
                                    <input type="text" class="form-control" placeholder="Ex. Bali" value="{{ $data->address }}" disabled>
                                    @error('province')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                                <div class="form-group">
                                    <label>Tanggal Pemasangan</label>
                                    <input type="text" class="form-control" placeholder="Ex. Bali" value="{{ $data->tgl_pemasangan }}" disabled>
                                    @error('tgl_pemasangan')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                                <div class="form-group">
                                    <label>Tanggal Pembongkaran</label>
                                    <input type="text" class="form-control" placeholder="Ex. Bali" value="{{ $data->tgl_pembongkaran }}" disabled>
                                    @error('tgl_pembongkaran')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                                <div class="form-group">
                                    <label>Harga Ongkir</label>
                                    <input type="text" class="form-control" placeholder="Ex. 90.000" name="shipping_cost" required>
                                    @error('shipping_cost')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection