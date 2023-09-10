<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Reports\ReportsRepository;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;

class ReportsController extends Controller
{
    //
    protected $reports;
    protected $validationRules = [
        'customers_id' => 'required|exists:customers,id',
        'staff_id' => 'staff:customers,id',
        'type_report_id' => 'required|exists:type_report,id',
        'report_source_id' => 'required|exists:report_source,id',
        'content' => 'required',
    ];
    protected $attributeNames = [
        'customers_id' => 'Mã khách hàng',
        'staff_id' => 'Mã nhân viên',
        'type_report_id' => 'Loại tố cáo',
        'report_source_id' => 'Nguồn tố cáo',
        'content' => 'Nôi dung',
    ];

    public function __construct(ReportsRepository $reports)
    {

        $this->reports = $reports;
    }
    public function addTicketReport(Request $request, $type)
    {   //admin
        //type = -1 : đóng góp ý kiến
        //type  =-2 phản hồi về phần mềm , về chức năng
        //type =-3 yêu cầu hỗ trợ của người dùng
        //client
        //type = 1 đóng góp ý kiến
        //2 phản hồi về trạng thái sản phẩm
        //3 phản hồi về nhân viên
        // 4 phản hồi về lỗi gặp phải ở phía khách hàng // yêu cầu hỗ trợ
        $type = $request->input('type');
        $source = $request->input('source');
        if (!$type)
            return CodeHttpHelpers::returnJson(204, false, 'thiếu loại phiếu', 200);
        if (!$source)
            return CodeHttpHelpers::returnJson(204, false, 'thiếu nguồn phiếu', 200);
        switch ($type) {
            case -3:
                $typeReport = 106;
                break;
            case -2:
                $typeReport = 105;
                break;
            case -1:
                $typeReport = 107;
                break;
            case 1:
                $typeReport = 108;
                break;
            case 2:
                $typeReport = 109;
                break;
            case 3:
                $typeReport = 110;
                break;
            case 4:
                $typeReport = 112;
                break;
            default:
                return CodeHttpHelpers::returnJson(500, false, "Có sự kiện bất thường sảy ra", 500);
        };
        //1 người dùng hệ thống
        //2 người dùng là khách hàng
        //hệ thống zalo
        //hệ thống cửa hàng
        switch ($source) {
            case 1:
                $sourceId = 7;
                break;
            case 2:
                $sourceId = 8;
                break;
            case 3:
                $sourceId = 9;
                break;
            case 4:
                $sourceId = 10;
                break;
            case 5:
                break;
            default:
                return CodeHttpHelpers::returnJson(500, false, "Có sự kiện bất thường sảy ra", 500);
        };
        $data = [
            'customers_id' => $request->post('customers_id'),
            'staff_id' => $request->post('staff_id')||'',
            'sub_report' => $request->post('sub_report'),
            'type_report_id' => $typeReport,
            'is_processed' => $request->post('is_processed'),
            'report_source_id' => $sourceId,
            'content' => $request->post('content'),
            'feed_back_content' => $request->post('feed_back_content'),
        ];
        $result = $this->createTicket($data);
        if ($result)
            return CodeHttpHelpers::returnJson(200, true, $result, 200);
        return CodeHttpHelpers::returnJson(500, false, "Lỗi hệ thống", 500);
    }

    public function createTicket($data)
    {
        try {
            $validator = validationHelpers::validation($data, $this->validationRules, $this->attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(200, false, $errors, 400);
            }
            $result = $this->reports->create($data);
            return $result;
        } catch (\Exception $error) {
            return false;
        }
    }
}
