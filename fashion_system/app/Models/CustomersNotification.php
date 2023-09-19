<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomersNotification extends Model
{
    use HasFactory;
    protected $table = 'customers_notification';
    protected $fillable = [
        "type_notification",
        "customer_id",
        "content",
        "watched",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
