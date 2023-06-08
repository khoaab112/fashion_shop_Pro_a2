<?php
namespace App\Repositories\TypeReport;

use App\Repositories\BaseRepositories;
use App\Models\TypeReport;
use App\Repositories\TypeReport\TypeReportRepositoryInterface;


class TypeReportRepository extends BaseRepositories implements TypeReportRepositoryInterface{

    protected TypeReport $typeReport;
    public function __construct(TypeReport $typeReport)
    { 
        parent::__construct($typeReport);
    }


 

}