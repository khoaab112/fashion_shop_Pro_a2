<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DepotTicket extends Model
{
    use HasFactory;
    protected $table = 'depot_ticket';
    protected $fillable = [
        "code_ticket",
        "ticket_id",
        "staff_id_export",
        "staff_id_receive",
        "product_id",
        "product_number",
        "total_money",
        "note",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
