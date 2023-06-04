<?php
namespace App\Repositories\UserStaff;

use App\Repositories\BaseRepositories;
use App\Models\Staff;
use App\Repositories\UserStaff\UserStaffRepositoryInterface;


class UserStaffRepository extends BaseRepositories implements UserStaffRepositoryInterface{

    protected Staff $staff;
    public function __construct(Staff $staff)
    { 
        parent::__construct($staff);
    }


 

}