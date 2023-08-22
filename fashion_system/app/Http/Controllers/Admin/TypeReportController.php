<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Repositories\TypeReport\TypeReportRepository;

class TypeReportController extends Controller
{
    //
    protected $typeReports;
   public function __construct(TypeReportRepository $typeReports)
    {
        $this->typeReports = $typeReports;
    }
}
