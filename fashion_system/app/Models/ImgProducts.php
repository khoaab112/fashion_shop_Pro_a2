<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImgProducts extends Model
{
    use HasFactory;
    protected $table = 'img_products';
    protected $fillable = [
        "product_id",
        "img",
        "display_order",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
