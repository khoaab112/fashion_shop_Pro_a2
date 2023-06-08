<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryPayment extends Model
{
    use HasFactory;
    protected $table = 'history_payment';
    protected $fillable = [
        "payment_method_id",
        "customers_id",
        "transfer_amount",
        "cash_amount",
        "note",
        "bill_id",
        "status",
    ];
    protected $attributes = [
        'status' => 'true',
    ];
}
