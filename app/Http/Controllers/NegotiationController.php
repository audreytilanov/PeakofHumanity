<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Negotiation;
use Illuminate\Http\Request;
use App\Models\NegotiationDetails;
use Illuminate\Support\Facades\Auth;

class NegotiationController extends Controller
{
    public function __construct(){
        $this->middleware('auth:admin');
    }
    
    
    public function index(){
        $data = Negotiation::with('details')->where('status', 'on.progress')->whereHas('details', function($q){
            $q->where('admin_id', '=', null);
            $q->where('status', '=', 'penawaran');
        })->where('admin_id', null)->get();
        // dd($data);
        return view('admin.master.negotiation.index', compact('data'));
    }

    public function detail($id){
        $data = NegotiationDetails::with('negotiations')->where('negotiation_id', $id)->where('admin_id', '=', null)->where('status', '=', 'penawaran')->orderBy('created_at', 'DESC')->first();

        // dd($data);
        return view('admin.master.negotiation.indexDetail', compact('data'));
    }

    public function edit($id){
        $data = NegotiationDetails::with('negotiations')->where('id', $id)->where('admin_id', '=', null)->where('status', '=', 'penawaran')->orderBy('created_at', 'DESC')->first();
        // dd($data);
        return view('admin.master.negotiation.edit', compact('data'));
    }

    public function update(Request $request, $id){
        $request->validate([
            'status' => 'required'
        ]);
        $updateLastNegotiation = NegotiationDetails::where('negotiation_id',$id)->where('admin_id', null)->first();
        $updateLastNegotiation->update([
            "admin_id" => Auth::guard('admin')->user()->id,
        ]);
        $data = NegotiationDetails::create([
            "negotiation_id" => $id,
            "admin_id" => Auth::guard('admin')->user()->id,
            'harga_penawaran' => $request->harga_penawaran ?? 0,
            'status' => $request->status
        ]);

        $statusState = array('accepted','rejected','penawaran.terakhir');

        if(in_array($request->status, $statusState)){
            $dataNego = Negotiation::find($id);
            $dataNego->update([
                'status' => 'completed'
            ]);
        }

        if($data){
            toast('Nego Dikirim','success');
            return redirect()->route('admin.negotiation.index');
        }else{
            toast('Nego gagal Dikirim','error');
            return redirect()->route('admin.negotiation.index');
        }
    }
}
