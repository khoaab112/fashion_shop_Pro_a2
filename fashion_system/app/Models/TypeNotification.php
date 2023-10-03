<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeNotification extends Model
{
    use HasFactory;
    protected $table = 'type_notification';
    protected $fillable = [
        "name",
        "note",
        "status",
        "color",
        "code",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
