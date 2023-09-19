<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminsNotification extends Model
{
    use HasFactory;
    protected $table = 'admins_notification';
    protected $fillable = [
        "type_notification",
        "staff_id",
        "content",
        "watched",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
