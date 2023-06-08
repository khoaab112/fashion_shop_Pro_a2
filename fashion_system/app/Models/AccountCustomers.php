<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountCustomers extends Model
{
    use HasFactory;
    protected $table = 'account_customers';
    protected $fillable = [
        "customers_id",
        "remember_token",
        "user_name",
        "password",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
