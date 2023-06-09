<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Administration extends Model
{
    use HasFactory;
    protected $table = 'administration';
    protected $fillable = [
        "name",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
