<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceByProduct extends Model
{
    use HasFactory;
    protected $table = 'service_by_product';
    protected $fillable = [
        "product_id",
        "policy_id",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
