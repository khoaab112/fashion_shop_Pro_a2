<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;


// class Customers extends Model
class Customers extends Authenticatable implements JWTSubject
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
        "password",
        "remember_token",
        "refresh_token",
        "issued_at",
        "expired_time",
        "email_token",
        "active",
        "account_service_id",
        "img",
        "image_drive_google",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
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
