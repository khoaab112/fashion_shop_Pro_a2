<?php
namespace App\Repositories\Reports;

use App\Repositories\BaseRepositories;
use App\Models\Reports;
use App\Repositories\Reports\ReportsRepositoryInterface;


class ReportsRepository extends BaseRepositories implements ReportsRepositoryInterface{

    protected Reports $reports;
    public function __construct(Reports $reports)
    { 
        parent::__construct($reports);
    }


 

}