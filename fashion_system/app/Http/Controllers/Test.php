<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use App\Models\Staff;
// use App\Repositories\UserStaff\UserStaffRepositoryInterface;
use App\Repositories\TypeTicket\TypeTicketRepositoryInterface;

class Test extends Controller
{
    //
    protected $query;
    public function __construct(TypeTicketRepositoryInterface $query)
    {
        $this->query = $query;
    }
    public function index()
    {
             
        $test = $this->query->getAll();
        return response()->json(['content' => $test]);
    }
}
