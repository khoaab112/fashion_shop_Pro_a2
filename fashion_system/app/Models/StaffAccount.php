<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

// class StaffAccount extends Model implements Authenticatable
// {
//     use HasFactory;
//     protected $table = 'staff_account';
//     protected $fillable = [
//         "staff_id",
//         "administration_id",
//         "user_name",
//         "password",
//         "remember_token",
//         "status",
//     ];
//     protected $hidden = [
//         'password',
//         'remember_token',
//     ];
//     protected $attributes = [
//         'status' => 'true',
//     ];
//     function getAuthIdentifierName()
//     {
//     }
//     function getAuthIdentifier()
//     {
//     }
//     function getAuthPassword()
//     {
//         return $this->password;
//     }
//     function getRememberToken()
//     {
//     }
//     function setRememberToken($value)
//     {
//     }
//     function getRememberTokenName()
//     {
//     }
// }


class StaffAccount extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
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

     /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [ ];
    }

}