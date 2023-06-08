<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ads extends Model
{
    use HasFactory;
    protected $table = 'ads';
    protected $fillable = [
        "name",
        "event_ads_id",
        "staff_id",
        "sub_menu_id",
        "img",
        "content",
        "priority",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
