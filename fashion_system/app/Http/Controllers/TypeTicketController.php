<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Type_ticket;

class TypeTicketController extends Controller
{
    protected $query;
    //
    public function Text()
    {
        // $users = DB::table('type_ticket')->get();
        $this->query = Type_ticket::query()->get();
        dd($this->query);
       return $this->query;
    }
}
