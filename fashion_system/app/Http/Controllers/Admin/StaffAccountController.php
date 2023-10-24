<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepository;
use App\Repositories\Staff\StaffRepository;
use App\Helpers\CodeHttpHelpers;
use Illuminate\Support\Facades\DB;
use App\Events\LogoutAdmin;
use App\Http\Controllers\Admin\NotificationController;
use DateTime;
use Faker\Core\Color;
use Illuminate\Support\Facades\Auth;


class StaffAccountController extends Controller
{
    protected $staffAccount, $staff;

    public function __construct(StaffAccountRepository $staffAccount, StaffRepository $staff)
    {
        $this->staffAccount = $staffAccount;
        $this->staff = $staff;
    }
    public function getByPage(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        $exactAuthentication = $request->input('active', true);
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
                    'staff_account.id',
                    'staff_account.user_name',
                    'staff_account.status',
                    'administration.name as administration',
                    'staff.id as staff_id',
                    'staff.code_staff',
                    'staff.name as staff_name',
                    'staff.address as staff_address',
                    'staff.phone_number',
                    'staff.email',
                    'staff.birthday',
                    'staff.sex',
                    'staff.img',
                    'staff.active',
                    'branch.name as branch_name',
                    'branch.address as branch_address',
                    'branch.hotline',
                    'branch.manage',
                    'branch.working_time',
                    'position.name as position_name'
                )
                ->where('administration.status', '=', true)
                ->where('staff.active', '=', $exactAuthentication)
                ->orderByDesc('staff_account.id')
                ->paginate($recordNumber, ['*'], 'page', $page)->items();
            if ($count) {
                // $totalRecord = $this->staffAccount->count();
                $result = [
                    'page' => $records,
                    'total_record' => count($records),
                ];
                return CodeHttpHelpers::returnJson(200, true, $result, 200);
            }
            return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function lockAccount(Request $request, $id)
    {
        $status = $request->status;
        try {
            $staff = $this->staffAccount->getById($id)->first();
            if (!$staff)  return CodeHttpHelpers::returnJson(204, false, 'Tài khoản không tồn tại , lỗi bất thường', 200);
            if ($staff->status === $status) {
                return CodeHttpHelpers::returnJson(204, false, 'Trạng thái đã bị đổi trước đó, hãy làm mới trang', 200);
            }
            $result = $this->staffAccount->statusChange($id, $status);
            if (!$result) return CodeHttpHelpers::returnJson(400, false, "Thay đổi trạng thái thất bại", 200);
            if ($status) {
                $user = ['id' => $request->idStaff, 'status' => $status];
                event(new LogoutAdmin($user));
                $idAdmin = Auth::user()->id;
                $resultStaffDetail = $this->staffDetail($idAdmin);
                $admin = json_decode($resultStaffDetail->getContent())->results;
                $dataNotification = [
                    'type_notification' => 2,
                    'staff_id' => $request->idStaff,
                    'content' => "Tài khoản của bạn đã bị khóa bởi <strong style=\"color:red\">" . $admin->staff_name . "</strong> (" . $admin->position_name . ")",
                    'code' => 'EVENT'
                ];
                $notificationController = app(NotificationController::class);
                $notificationController->createNotificationByIdStaff($dataNotification);
            }
            return CodeHttpHelpers::returnJson(200, true, "Thay đổi trạng thái thành công", 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function activeStaffAccount($id)
    {
        try {
            $idAdmin = Auth::user()->staff_id;
            $staff = $this->staff->getById($id)->first();
            if (!$staff)  return CodeHttpHelpers::returnJson(204, false, 'Thông tin khách hàng không tồn tại , lỗi bất thường', 200);
            $resultSearchAccount = $this->staffAccount->search('staff_id', $id)->first();
            if (!$resultSearchAccount) return CodeHttpHelpers::returnJson(204, false, "Thông tin Tài khoản không tồn tại", 200);
            $resultActive = $this->staff->updateById(['active' => true], $id);
            $resultActive = $this->staffAccount->updateById([
                'status' => true,
                'active' => true
            ], $resultSearchAccount->id);
            if (!$resultActive) return CodeHttpHelpers::returnJson(400, false, "Thay đổi trạng thái thất bại", 200);
            $dataNotification = [
                'staff_id' => $idAdmin,
                'content' => "Bạn đã xác thực tài khoản cho người dùng <strong style=\"color:red\">" . $staff->name . "</strong>",
                'code' => 'EVENT'
            ];
            $notificationController = app(NotificationController::class);
            $notificationController->createNotificationByIdStaff($dataNotification);
            return CodeHttpHelpers::returnJson(200, true, "Thay đổi trạng thái thành công", 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function staffDetail($id)
    {
        try {
            $staff = $this->staffAccount->getById($id)->first();
            if (!$staff)  return CodeHttpHelpers::returnJson(204, false, 'Nhân viên không tồn tại ', 200);
            $record = DB::table('staff_account')
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
                    'staff_account.id as account_id',
                    'staff_account.user_name',
                    'staff_account.status',
                    'administration.name as administration',
                    'staff.id as staff_id',
                    'staff.code_staff',
                    'staff.name as staff_name',
                    'staff.address as staff_address',
                    'staff.phone_number',
                    'staff.email',
                    'staff.birthday',
                    'staff.sex',
                    'staff.img',
                    'staff.active',
                    'branch.name as branch_name',
                    'branch.address as branch_address',
                    'branch.hotline',
                    'branch.manage',
                    'branch.working_time',
                    'position.name as position_name'
                )
                // ->where('administration.status', '=', true)
                ->where('staff_account.id', '=', $id)
                ->first();
            return CodeHttpHelpers::returnJson(200, true, $record, 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function indirectlyDisconnect($id)
    {
        try {
            $user = ['id' => $id, 'status' => 'false'];
            event(new LogoutAdmin($user));
            $idAdmin = Auth::user()->id;
            $resultStaffDetail = $this->staffDetail($idAdmin);
            $admin = json_decode($resultStaffDetail->getContent())->results;
            $dataNotification = [
                'type_notification' => 2,
                'staff_id' => $id,
                'content' => " <strong style=\"color:red\">" . $admin->staff_name . "</strong> (" . $admin->position_name . ") đã đăng xuất gián tiếp tài khoản của bạn",
                'code' => 'EVENT'
            ];
            $notificationController = app(NotificationController::class);
            $notificationController->createNotificationByIdStaff($dataNotification);
            return CodeHttpHelpers::returnJson(200, true, 'Thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function getInfoUsers($id)
    {
        $record = DB::table('staff_account')
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
                'position',
                'position.id',
                '=',
                'staff.position_id'
            )
            ->select(
                'staff_account.id as account_id',
                'staff_account.user_name',
                'staff_account.status',
                'administration.name as administration',
                'staff.id as staff_id',
                'staff.code_staff',
                'staff.name as staff_name',
                'staff.address as staff_address',
                'staff.phone_number',
                'staff.email',
                'staff.birthday',
                'staff.sex',
                'staff.img',
                'staff.active',
                'position.name as position_name'
            )
            // ->where('administration.status', '=', true)
            ->where('staff_account.id', '=', $id)
            ->first();
    }
    public function editRequest(Request $request, $id)
    {
        if (!$request->time) {
            return CodeHttpHelpers::returnJson(204, false, 'Thời gian yêu cầu không được để trống', 200);
        }
        $dateTime = new DateTime($request->time);
        $formattedDate = $dateTime->format('d/m/Y');
        $content = "";
        if ($request->content) {
            $content = "<br>Nội dung :<p style=\"color:blue\">" . $request->content . "</p>";
        }
        try {
            $dataNotification = [
                'staff_id' => $id,
                'content' => "Quản trị viên yêu cầu bạn cập nhật lại thông tin, hạn : <strong style=\"color:red\";>" . $formattedDate . "</strong>" . $content,
                'code' => 'SYSTEM'
            ];
            $notificationController = app(NotificationController::class);
            $notificationController->createNotificationByIdStaff($dataNotification);
            return CodeHttpHelpers::returnJson(200, true, 'Thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
