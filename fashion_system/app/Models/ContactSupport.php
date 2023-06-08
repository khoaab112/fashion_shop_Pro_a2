<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactSupport extends Model
{
    use HasFactory;

    protected $table = 'contact_support';
    protected $fillable = [
        "logo",
        "link",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
