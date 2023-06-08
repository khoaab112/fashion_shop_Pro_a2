<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StaffAccount extends Model
{
    use HasFactory;
    protected $table = 'staff_account';
    protected $fillable = [
        "staff_id",
        "administration_id",
        "user_name",
        "password",
        "remember_token",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
