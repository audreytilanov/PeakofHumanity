<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Mail\TransactionMail;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Notifications\UserNotification;
use Illuminate\Support\Facades\Notification;

class TransactionController extends Controller
{
    public function __construct(){
        $this->middleware('auth:admin');
    }
    
    public function index(){
        $data = Transaction::orderBy('created_at', 'DESC')->get();;
        return view('admin.master.transaction.index', compact('data'));
    }

    public function verify($id){
        $data = Transaction::find($id);

        $data->update([
            'status' => 'admin_verified'
        ]); 
        $user = User::find($data->user_id);
        $message = "Transaksi " . $user->name . ", telah diubah menjadi verified oleh admin";

        Notification::send($user, new UserNotification($message));
        return redirect()->route('admin.transaction.index');
    }

    public function notverified($id){
        $data = Transaction::find($id);

        $data->update([
            'status' => 'admin_notverified'
        ]); 
        $user = User::find($data->user_id);
        $message = "Transaksi " . $user->name . ", telah diubah menjadi not verified oleh admin, ubah bukti pembayaran atau batalkan transaksi";

        Notification::send($user, new UserNotification($message));
        return redirect()->route('admin.transaction.index');
    }

    public function deliver($id){
        $data = Transaction::find($id);

        $email = $data->users->email;

        Mail::to($email)->send(new TransactionMail($email, $data));

        $data->update([
            'status' => 'admin_deliver'
        ]); 
        $user = User::find($data->user_id);
        $message = "Transaksi " . $user->name . ", telah diubah menjadi deliver oleh admin, mohon menunggu barang.";
        

        Notification::send($user, new UserNotification($message));
        return redirect()->route('admin.transaction.index');
    }


    public function create(){
        return view('admin.master.province.create');
    }

    public function store(Request $request){
        $request->validate([
            'province' => 'required|unique:provinces,province'
        ]);

        $create = Province::create([
            'province' => $request->province
        ]);

        if($create){
            toast('Provinsi berhasil ditambahkan','success');
            return redirect()->route('admin.province.index');
        }else{
            toast('Provinsi gagal ditambahkan','error');
            return redirect()->route('admin.province.index');
        }
        
    }

    public function edit($id){
        $data = Transaction::find($id);
        return view('admin.master.transaction.edit', compact('data'));
    }

    public function update(Request $request, $id){
        $request->validate([
            'shipping_cost' => 'required'
        ]);
        $data = Transaction::find($id);

        $edit = $data->update([
            'shipping_cost' => $request->shipping_cost
        ]);

        if($edit){
            toast('Transaksi berhasil diubah','success');
            return redirect()->route('admin.transaction.index');
        }else{
            toast('Transaksi gagal diubah','error');
            return redirect()->route('admin.transaction.index');
        }
    }

}
