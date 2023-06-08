<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
    use HasFactory;
    protected $table = 'customers';
    protected $fillable = [
        "rank_id",
        "first_name",
        "last_name",
        "address",
        "phone_number",
        "email",
        "birthday",
        "sex",
        "accumulated_points",
        "number_ban",
        "potential",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
