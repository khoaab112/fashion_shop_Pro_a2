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
    public function index(Request $request)
    {

            //  dd($request->cookie(env('VITE_KEY_REFRESH_TOKEN')));
        $test = $this->query->getAll();
        return response()->json(['resultcode' => 200 ,'message' => 'success', 'results' => $test]);

    }
}