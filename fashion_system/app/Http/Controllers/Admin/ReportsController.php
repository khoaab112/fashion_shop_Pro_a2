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
        //type =-3 yêu cầu hỗ trợ
        //client
        //type = 1 đóng góp ý kiến
        //2 phản hồi về trạng thái sản phẩm
        //3 phản hồi về nhân viên
        // 4 phản hồi về lỗi gặp phải ở phía khách hàng

        switch ($type) {
            case -3:
                break;
            case -2:
                break;
            case -1:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            default:
                return CodeHttpHelpers::returnJson(500, false, "Có sự kiện bất thường sảy ra", 500);
        }
    }
}
