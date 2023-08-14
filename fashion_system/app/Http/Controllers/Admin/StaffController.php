<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\CodeHttpHelpers;
use App\Http\Controllers\Controller;
use App\Repositories\UserStaff\UserStaffRepository;
use Illuminate\Http\Request;

class StaffController extends Controller
{
    //
    protected $staff;

    public function __construct(UserStaffRepository $staff)
    {

        $this->staff = $staff;
    }

    public function getInFoStaff(Request $request, $id)
    {
        $staffInfo = $this->staff->getById($id)->all();

        if (!$staffInfo) {
            return CodeHttpHelpers::returnJson(204,false,null,200);
        }
        return CodeHttpHelpers::returnJson(200,true,$staffInfo,200);

    }
    public function changeAvatarStaffById(Request $request, $id)
    {

    }
}
