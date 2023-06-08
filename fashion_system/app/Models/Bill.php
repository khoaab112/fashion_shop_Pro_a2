<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    use HasFactory;
    protected $table = 'bill';
    protected $fillable = [
        "code_bill",
        "staff_id",
        "customers_id",
        "branch_id",
        "payment_methods_id",
        "shipping_method_id",
        "transfer_providers_id",
        "total_products",
        "initial_amount",
        "actual_amount",
        "giftcode_id",
        "successful_payment",
        "note",
        "impact_number",
        "report_ship",
        "queue_bill",
        "note_report",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
