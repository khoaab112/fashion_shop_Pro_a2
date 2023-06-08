<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    use HasFactory;
    protected $table = 'warehouse';
    protected $fillable = [
        "name",
        "address",
        "hotline",
        "manage",
        "branch_id",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
