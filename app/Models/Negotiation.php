<?php

namespace App\Models;

use App\Models\User;
use App\Models\Admin;
use App\Models\Product;
use App\Models\TransactionDetail;
use App\Models\NegotiationDetails;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Negotiation extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'user_id',
        'admin_id',
        "detail_transaction_id",
        'status',
        'harga_akhir',
    ];

    // Relation
    public function products(){
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function users(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function admins(){
        return $this->belongsTo(Admin::class, 'admin_id');
    }

    public function details(){
        return $this->hasMany(NegotiationDetails::class, 'negotiation_id', 'id');
    }

    public function detailTransaction(){
        return $this->belongsTo(TransactionDetail::class, 'detail_transaction_id');
    }
}
