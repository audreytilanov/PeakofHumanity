<?php

namespace App\Models;

use App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class NegotiationDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        "negotiation_id",
        "admin_id",
        'harga_penawaran',
        'status',
    ];

    public function admins(){
        return $this->belongsTo(Admin::class, 'admin_id');
    }

    public function negotiations(){
        return $this->belongsTo(Negotiation::class, 'negotiation_id');
    }
}
