<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Action extends Model
{
    use HasFactory;
    protected $table = 'action';
    protected $fillable = [
        "name",
        "content",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
