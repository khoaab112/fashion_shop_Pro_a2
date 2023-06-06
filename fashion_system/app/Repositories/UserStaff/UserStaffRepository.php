<?php
namespace App\Repositories\UserStaff;

use App\Repositories\BaseRepositories;
use App\Models\TypeTicket;
use App\Repositories\UserStaff\UserStaffRepositoryInterface;


class UserStaffRepository extends BaseRepositories implements UserStaffRepositoryInterface{

    protected TypeTicket $staff;
    public function __construct(TypeTicket $staff)
    { 
        parent::__construct($staff);
    }


 

}