<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypePromotion extends Model
{
    use HasFactory;
    protected $table = 'type_promotion';
    protected $fillable = [
        "name",
        "content",
        "code_hide",
        "status",
        "code",

    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
