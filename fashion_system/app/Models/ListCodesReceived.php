<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ListCodesReceived extends Model
{
    use HasFactory;
    protected $table = 'list_codes_received';
    protected $fillable = [
        "customers_id",
        "giftcode_id",
        "is_expired",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
