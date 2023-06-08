<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportSource extends Model
{
    use HasFactory;
    protected $table = 'report_source';
    protected $fillable = [
        "name",
        "note",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
