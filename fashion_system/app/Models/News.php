<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use HasFactory;
    protected $table = 'news';
    protected $fillable = [
        "name_news",
        "sub_menu_id",
        "staff_id",
        "img_main",
        "content",
        "tag",
        "views",
        "likes",
        "comments",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
