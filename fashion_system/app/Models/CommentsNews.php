<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentsNews extends Model
{
    use HasFactory;

    protected $table = 'comments_news';
    protected $fillable = [
        "news_id",
        "customers_id",
        "comment_id",
        "comment",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
