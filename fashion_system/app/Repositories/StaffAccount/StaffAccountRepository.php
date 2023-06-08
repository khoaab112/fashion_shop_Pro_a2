<?php
namespace App\Repositories\StaffAccount;

use App\Repositories\BaseRepositories;
use App\Models\StaffAccount;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;


class StaffAccountRepository extends BaseRepositories implements StaffAccountRepositoryInterface{

    protected StaffAccount $staffAccount;
    public function __construct(StaffAccount $staffAccount)
    { 
        parent::__construct($staffAccount);
    }


 

}