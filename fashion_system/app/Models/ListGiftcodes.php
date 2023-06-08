<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ListGiftcodes extends Model
{
    use HasFactory;
    protected $table = 'list_giftcodes';
    protected $fillable = [
        "giftcode_id",
        "code",
        "already_received",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
