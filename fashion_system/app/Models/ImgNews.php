<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImgNews extends Model
{
    use HasFactory;
    protected $table = 'img_news';
    protected $fillable = [
        "name_img",
        "news_id",
        "img",
        "location",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
