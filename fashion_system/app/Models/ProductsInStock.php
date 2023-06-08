<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductsInStock extends Model
{
    use HasFactory;
    protected $table = 'products_in_stock';
    protected $fillable = [
        "product_id",
        "warehouse_id",
        "remaining",
        "import_price",
        "export_price",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
