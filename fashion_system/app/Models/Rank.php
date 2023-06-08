<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rank extends Model
{
    use HasFactory;
    protected $table = 'rank';
    protected $fillable = [
        "name",
        "detail",
        "icon",
        "status",
        "score",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
