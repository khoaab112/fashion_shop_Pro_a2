<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Branch\BranchRepository;
use App\Helpers\CodeHttpHelpers;


class BranchController extends Controller
{
    protected $branch;

    public function __construct(BranchRepository $branch)
    {

        $this->branch = $branch;
    }
    public function getBranchById($id){
        $branchInfo = $this->branch->getById($id)->first();
        if(!$branchInfo)
        {
            return CodeHttpHelpers::returnJson(204,false,null,200);

        }
        return CodeHttpHelpers::returnJson(200,true,$branchInfo,200);
    }

}
