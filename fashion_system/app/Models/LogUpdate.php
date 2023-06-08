<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LogUpdate extends Model
{
    use HasFactory;
    protected $table = 'log_updates';
    protected $fillable = [
        "type_update_id",
        "content",
        "internal",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
