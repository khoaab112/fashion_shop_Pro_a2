<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PriceDifference extends Model
{
    use HasFactory;
    protected $table = 'price_difference';
    protected $fillable = [
        "staff_id",
        "product_id",
        "import_price",
        "export_price",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
