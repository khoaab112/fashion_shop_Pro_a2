<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Staff;
use App\Repositories\UserStaff\UserStaffRepositoryInterface;

class Test extends Controller
{
    //
    protected $query;
    public function __construct(UserStaffRepositoryInterface $query)
    {
        $this->query = $query;
    }
    public function index()
    {
             
        $test = $this->query->getAll();
           dd($test);
        return $this->query;
    }
}
