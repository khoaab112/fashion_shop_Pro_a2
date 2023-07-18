<?php

namespace App\Models;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StaffAccount extends Model implements Authenticatable
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
    protected $hidden = [
        'password',
        'remember_token',
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
