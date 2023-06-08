<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FailedJobs extends Model
{
    use HasFactory;

    protected $table = 'failed_jobs';
    protected $fillable = [
        "uuid",
        "connection",
        "queue",
        "payload",
        "exception",
        "failed_at",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
