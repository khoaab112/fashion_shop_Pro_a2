<?php
namespace App\Repositories\ReportSource;

use App\Repositories\BaseRepositories;
use App\Models\ReportSource;
use App\Repositories\ReportSource\ReportSourceRepositoryInterface;


class ReportSourceRepository extends BaseRepositories implements ReportSourceRepositoryInterface{

    protected ReportSource $reportSource;
    public function __construct(ReportSource $reportSource)
    { 
        parent::__construct($reportSource);
    }


 

}