<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventAds extends Model
{
    use HasFactory;

    protected $table = 'event_ads';
    protected $fillable = [
        "name_event",
        "staff_id",
        "content",
        "note",
        "start_time",
        "end_time",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
