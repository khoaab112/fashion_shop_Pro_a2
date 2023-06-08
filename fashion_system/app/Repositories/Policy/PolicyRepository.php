<?php
namespace App\Repositories\Policy;

use App\Repositories\BaseRepositories;
use App\Models\Policy;
use App\Repositories\Policy\PolicyRepositoryInterface;


class PolicyRepository extends BaseRepositories implements PolicyRepositoryInterface{

    protected Policy $policy;
    public function __construct(Policy $policy)
    { 
        parent::__construct($policy);
    }


 

}