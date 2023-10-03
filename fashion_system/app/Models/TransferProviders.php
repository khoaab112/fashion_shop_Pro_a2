<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransferProviders extends Model
{
    use HasFactory;
    protected $table = 'transfer_providers';
    protected $fillable = [
        "name",
        "status",
        "code",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
