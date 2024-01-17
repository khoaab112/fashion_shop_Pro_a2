<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuMain extends Model
{
    use HasFactory;
    protected $table = 'menu_main';
    protected $fillable = [
        "name",
        "color",
        "order",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
