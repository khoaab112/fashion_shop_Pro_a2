<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingMethod extends Model
{
    use HasFactory;
    protected $table = 'shipping_method';
    protected $fillable = [
        "name",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
