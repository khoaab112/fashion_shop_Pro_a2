<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ListProductsByBill extends Model
{
    use HasFactory;
    protected $table = 'list_products_by_bill';
    protected $fillable = [
        "bill_id",
        "products_id",
        "status",
        "quantity",
        "amount_of_money",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
