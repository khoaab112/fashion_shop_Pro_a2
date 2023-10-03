<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeTicket extends Model
{
    use HasFactory;
    protected $table = 'type_ticket';
    protected $fillable = [
        "name",
        "note",
        "status",
        "code",

    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
