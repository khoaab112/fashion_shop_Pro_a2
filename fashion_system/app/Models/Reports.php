<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reports extends Model
{
    use HasFactory;
    protected $table = 'reports';
    protected $fillable = [
        "customers_id",
        "staff_id",
        "sub_report",
        "type_report_id",
        "is_processed",
        "report_source_id",
        "content",
        "feed_back_content",
        "status",
        "sub",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
