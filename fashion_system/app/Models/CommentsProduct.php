<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentsProduct extends Model
{
    use HasFactory;

    protected $table = 'comments_product';
    protected $fillable = [
        "product_id",
        "customers_id",
        "comments_product_id",
        "vote",
        "comment",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
