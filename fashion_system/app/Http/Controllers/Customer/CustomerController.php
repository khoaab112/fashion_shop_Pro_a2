<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Customers\CustomersRepository;
use App\Repositories\Rank\RankRepository;
use App\Helpers\CodeHttpHelpers;
use App\Events\LogoutAdmin;
use Illuminate\Support\Facades\Auth;
use App\Helpers\validationHelpers;
use Illuminate\Support\Facades\DB;


class CustomerController extends Controller
{
    //
    protected $customer;
    protected $rank;
    public function __construct(CustomersRepository $customersRepository, RankRepository $rank)
    {
        $this->customer = $customersRepository;
        $this->rank = $rank;
    }
    public function getCustomers(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        $dataRank = $this->rank->getAll();
        $records = $this->customer->getRecordByPage($recordNumber, $page);
        foreach ($records as &$record) {
            $record['full_name'] = $record['last_name'] . " " . $record["first_name"];
            foreach ($dataRank as $rank) {
                if ($rank['id'] === $record['rank_id']) {
                    $record['rank_name'] = $rank['name'];
                    break;
                }
            }
        }
        if ($count) {
            $totalRecord = $this->customer->count();
            $result = [
                'page' => $records,
                'total_record' => $totalRecord,
            ];
            return CodeHttpHelpers::returnJson(200, true, $result, 200);
        }
        return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
    }
    public function changeAccount(Request $request, $id)
    {
        $status = $request->status;
        try {
            $customer = $this->customer->getById($id)->first();
            if (!$customer)  return CodeHttpHelpers::returnJson(204, false, 'Tài khoản không tồn tại , lỗi bất thường', 200);
            if ($customer->status === $status) {
                return CodeHttpHelpers::returnJson(204, false, 'Trạng thái đã bị đổi trước đó, hãy làm mới trang', 200);
            }
            $result = $this->customer->statusChange($id, $status);
            if (!$result) return CodeHttpHelpers::returnJson(400, false, "Thay đổi trạng thái thất bại", 200);
            // if ($status) {
            //     $user = ['id' => $request->idStaff, 'status' => $status];
            //     event(new LogoutAdmin($user));
            //     $idAdmin = Auth::user()->id;
            //     $resultStaffDetail = $this->staffDetail($idAdmin);
            //     $admin = json_decode($resultStaffDetail->getContent())->results;
            //     $dataNotification = [
            //         'type_notification' => 2,
            //         'staff_id' => $request->idStaff,
            //         'content' => "Tài khoản của bạn đã bị khóa bởi <strong style=\"color:red\">" . $admin->staff_name . "</strong> (" . $admin->position_name . ")",
            //         'code' => 'EVENT'
            //     ];
            //     $notificationController = app(NotificationController::class);
            //     $notificationController->createNotificationByIdStaff($dataNotification);
            // }
            return CodeHttpHelpers::returnJson(200, true, "Thay đổi trạng thái thành công", 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function getCustomer(Request $request, $id)
    {
        $checkExist = $this->customer->findById($id);
        if (!$checkExist)   return CodeHttpHelpers::returnJson(204, false, 'ID người dùng không tông tại', 200);
        $record = DB::table('customers')
            ->leftJoin('rank', 'rank.id', '=', 'customers.rank_id')
            ->select(
                'rank.name as rank_name',
                'customers.first_name',
                'customers.last_name',
                'customers.address',
                "customers.phone_number",
                "customers.email",
                "customers.birthday",
                "customers.sex",
                "customers.accumulated_points",
                "customers.number_ban",
                "customers.potential",
                "customers.status",
                "customers.active",
                "customers.account_service_id"
            )
            ->where('customers.id', '=', $id)
            ->first();
        return CodeHttpHelpers::returnJson(200, true, $record, 200);
    }
    public function createCustomer(Request $request)
    {
        $data = $request->input();
        $validationRules = [
            "first_name" => "required|string",
            "last_name" => "required|string",
            "address" => "string",
            "phone_number" => "max:10|min:10|unique:customers,phone_number",
            "email" => "required|email|unique:customers,email",
        ];

        $attributeNames = [
            "first_name" => "Tên",
            "last_name" => "Họ",
            "address" => "Địa chỉ",
            "phone_number" => "Số điện thoại",
            "email" => "Email",
        ];
        $validator = validationHelpers::validation($data, $validationRules, $attributeNames);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return CodeHttpHelpers::returnJson(400, false, $errors, 200);
        }
        $data["rank_id"] = "1";
        $data["status"] = true;
        $data["active"] = true;
        $result = $this->customer->create($data);
        if ($result)
            return CodeHttpHelpers::returnJson(200, true, $result, 200);
        return CodeHttpHelpers::returnJson(500, false, "Lỗi hệ thống", 500);
    }
}
