<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;
    protected $table = 'staff';
    protected $fillable = [
        "code_staff",
        "position_id",
        "admin_id",
        "branch_id",
        "name",
        "address",
        "phone_number",
        "email",
        "birthday",
        "sex",
        "img",
        "img_drive_google",
        "background",
        "status",
        "active",
        'created_at',
        'updated_at',
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
