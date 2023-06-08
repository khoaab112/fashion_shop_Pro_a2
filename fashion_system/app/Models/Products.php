<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    use HasFactory;
    protected $table = 'products';
    protected $fillable = [
        "sub_menu_id",
        "code_products",
        "name",
        "img_main",
        "origin",
        "color",
        "size",
        "into_money",
        "vote",
        "intro",
        "number_of_products_sold",
        "remaining_products",
        "status",
        "is_promotion",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
