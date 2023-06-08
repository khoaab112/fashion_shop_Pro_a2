<?php
namespace App\Repositories\Branch;

use App\Repositories\BaseRepositories;
use App\Models\Branch;
use App\Repositories\Branch\BranchRepositoryInterface;


class BranchRepository extends BaseRepositories implements BranchRepositoryInterface{

    protected Branch $branch;
    public function __construct(Branch $branch)
    { 
        parent::__construct($branch);
    }


 

}