<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Giftcode extends Model
{
    use HasFactory;

    protected $table = 'giftcode';
    protected $fillable = [
        "name",
        "event_ads_id",
        "staff_id",
        "content",
        "img",
        "discount",
        "start_time",
        "end_time",
        "number_of_participants",
        "used",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
