<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IntermediaryAcountService extends Model
{
    use HasFactory;
    protected $table = 'intermediary_account_service';
    protected $fillable = [
        "servive_name",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
