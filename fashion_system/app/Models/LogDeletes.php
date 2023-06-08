<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LogDeletes extends Model
{
    use HasFactory;
    protected $table = 'log_deletes';
    protected $fillable = [
        "type_delete_id",
        "content",
        "internal",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
