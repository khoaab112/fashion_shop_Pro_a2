<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LogLogin extends Model
{
    use HasFactory;
    protected $table = 'log_login';
    protected $fillable = [
        "user_login",
        "type",
        "content",
        "ip",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
