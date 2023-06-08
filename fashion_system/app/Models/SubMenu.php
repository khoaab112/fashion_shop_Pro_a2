<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubMenu extends Model
{
    use HasFactory;
    protected $table = 'sub_menu';
    protected $fillable = [
        "menu_main_id",
        "name",
        "color",
        "sub",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
