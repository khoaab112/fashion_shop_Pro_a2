<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountService extends Model
{
    use HasFactory;

    protected $table = 'account_service';
    protected $fillable = [
        "code",
        "name",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
