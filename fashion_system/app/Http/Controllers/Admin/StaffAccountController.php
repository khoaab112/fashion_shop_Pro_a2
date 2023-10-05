<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepository;
use App\Helpers\CodeHttpHelpers;
use Illuminate\Support\Facades\DB;


class StaffAccountController extends Controller
{
    protected $staffAccount;

    public function __construct(StaffAccountRepository $staffAccount)
    {
        $this->staffAccount = $staffAccount;
    }
    public function getByPage(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        try {
            $records = DB::table('staff_account')
                ->leftJoin(
                    'administration',
                    'administration.id',
                    '=',
                    'staff_account.administration_id'
                )
                ->leftJoin(
                    'staff',
                    'staff.id',
                    '=',
                    'staff_account.staff_id'
                )
                ->leftJoin(
                    'branch',
                    'staff.branch_id',
                    '=',
                    'branch.id'
                )
                ->leftJoin(
                    'position',
                    'position.id',
                    '=',
                    'staff.position_id'
                )
                ->select(
                    'staff_account.user_name',
                    'staff_account.status',
                    'administration.name as administration',
                    'staff.code_staff',
                    'staff.name as staff_name',
                    'staff.address as staff_address',
                    'staff.phone_number',
                    'staff.email',
                    'staff.birthday',
                    'staff.sex',
                    'staff.img',
                    'branch.name as branch_name',
                    'branch.address as branch_address',
                    'branch.hotline',
                    'branch.manage',
                    'branch.working_time',
                    'position.name as position_name'
                )
                ->where('administration.status', '=', true)
                ->orderByDesc('staff_account.id')
                ->paginate($recordNumber, ['*'], 'page', $page)->items();
            if ($count) {
                $totalRecord = $this->staffAccount->count();
                $result = [
                    'page' => $records,
                    'total_record' => $totalRecord,
                ];
                return CodeHttpHelpers::returnJson(200, true, $result, 200);
            }
            return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
