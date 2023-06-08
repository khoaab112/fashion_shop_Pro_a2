<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountAdminAction extends Model
{
    use HasFactory;
    protected $table = 'account_admin_action';
    protected $fillable = [
        "administration_id",
        "action_id",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];

}
