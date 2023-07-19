<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable;

//fix 
class AccountCustomers extends Model implements Authenticatable
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
        function getAuthIdentifierName()
    {
    }
    function getAuthIdentifier()
    {
    }
    function getAuthPassword()
    {
        return $this->password;
    }
    function getRememberToken()
    {
    }
    function setRememberToken($value)
    {
    }
    function getRememberTokenName()
    {
    }
}
