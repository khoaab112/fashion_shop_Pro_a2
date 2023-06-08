<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    use HasFactory;
    protected $table = 'promotion';
    protected $fillable = [
        "product_id",
        "type_promotion_id",
        "endtime",
        "starttime",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
