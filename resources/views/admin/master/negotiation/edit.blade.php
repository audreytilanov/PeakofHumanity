@extends('layouts.admin')
@section('section')
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1><b>USER NEGOTIATION</b></h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Dashboard</a></li>
                                <li class="breadcrumb-item active">Negotiation</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-title">
                        <h4><b>BALAS PENAWARAN</b></h4>
                    </div>
                    <div class="card-body">
                        <div class="basic-form">
                            <form action="{{ route('admin.negotiation.update', $data->negotiations->id) }}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label>Harga Penawaran</label>
                                    <input type="text" disabled class="form-control" value="{{ $data->harga_penawaran }}">
                                    <br>

                                    <label>Harga Balasan</label>
                                    <input type="text" class="form-control" name="harga_penawaran">
                                    <br>

                                    <label>Status Penawaran</label>
                                    <select class="form-control" name="status" id="status" required>
                                        <option value="">Pilih Status</option>
                                        <option class="bg-warning" value="penawaran.admin">Penawaran Admin</option>
                                        <option class="bg-success" value="accepted">Terima</option>
                                        <option class="bg-danger" value="rejected">Tolak</option>
                                        <option class="bg-secondary text-white" value="penawaran.terakhir">Penawaran Terakhir (Last Offer)</option>
                                    </select>
                                    <small class="form-text text-muted">Harga Penawaran dari Admin, bisa dikosongkan.</small>
                                    @error('province')
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