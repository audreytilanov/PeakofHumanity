<?php

namespace App\Http\Controllers\User;

use App\Models\Negotiation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class NegotiationController extends Controller
{
    public function index($id){
        $data = Negotiation::with('details')->whereHas('details', function($q){
            $q->where('admin_id', '=', null);
            $q->where('status', '=', 'penawaran');
        })->get();
        // dd($data);
        return view('user.negotiation', compact('data'));
    }
}
