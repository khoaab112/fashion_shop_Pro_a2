<?php
namespace App\Repositories\Staff;

use App\Repositories\BaseRepositories;
use App\Models\Staff;
use App\Repositories\Staff\StaffRepositoryInterface;


class StaffRepository extends BaseRepositories implements StaffRepositoryInterface{

    protected Staff $staff;
    public function __construct(Staff $staff)
    { 
        parent::__construct($staff);
    }


 

}