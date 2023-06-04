<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TypeTicket;

class TypeTicketController extends Controller
{
    protected $query;
    //
    public function Text()
    {
        // $users = DB::table('type_ticket')->get();
        $this->query = TypeTicket::query()->get();
       return $this->query;
    }
}
