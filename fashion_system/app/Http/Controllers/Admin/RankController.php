<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\Rank\RankRepository;

class RankController extends Controller
{
    //
    protected $rank;
    protected $validationRules = [
        'name' => 'required|unique:rank,name',
        'detail' => 'string',
        'icon' => 'string',
        'status' => 'boolean',
        'score' => 'numeric',
    ];

    protected   $attributeNames = [
        'name' => 'Tên',
        'detail' => 'Mô tả',
        'icon' => 'Đường dẫn hình ảnh',
        'status' => 'Trạng thái',
        'score' => 'Số điểm giới hạn của rank',
    ];
    public function __construct(RankRepository $rank)
    {
        $this->rank = $rank;
    }
    public function index(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        try {
            $records = $this->rank->getRecordByPage($recordNumber, $page);
            if ($count) {
                $totalRecord = $this->rank->count();
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
    public function statusChange(Request $request)
    {
        $id = $request->input('id');
        $status = $request->input('status');
        $search = $this->rank->getById($id)->first();
        if (!$search) {
            return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
        }
        $status = !($search->status);
        if ($status != $search->status)
            return CodeHttpHelpers::returnJson(204, false, 'Trạng thái đã bị thay đổi trước đó, hãy làm mới trang !', 200);
        $resultChange = $this->rank->statusChange($id, $status);
        if (!$resultChange)  return CodeHttpHelpers::returnJson(400, false, 'Thay đổi trạng thái thất bại', 200);
        return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
    }
    public function remove($id)
    {
        try {
            $search = $this->rank->getById($id)->first();
            if (!$search) {
                return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
            }
            $resultDelete = $this->rank->deleteById($id);
            if (!$resultDelete)  return CodeHttpHelpers::returnJson(400, false, 'Xóa thất bại', 200);
            return CodeHttpHelpers::returnJson(200, true, 'Xóa thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function create(Request $request)
    {
        $validator = validationHelpers::validation($request->all(), $this->validationRules, $this->attributeNames);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return CodeHttpHelpers::returnJson(400, false, $errors, 200);
        }
        $data = $request->all();
        $data['status'] = true;
        $result = $this->rank->create($data);
        return CodeHttpHelpers::returnJson(200, true, "Tạo thành công", 200);
    }
    public function update(Request $request, $id)
    {
        $search = $this->rank->getById($id)->first();
        if (!$search) {
            return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
        }
        $validator = validationHelpers::validation($request->all(), $this->validationRules, $this->attributeNames);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return CodeHttpHelpers::returnJson(400, false, $errors, 200);
        }
        $data = $request->all();
        $resultUpdateAvatar = $this->rank->updateById($data, $id);
        if ($resultUpdateAvatar) {
            return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
        }
        return CodeHttpHelpers::returnJson(500, false, 'Cập nhật thất bại', 500);
    }
}
