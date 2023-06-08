<?php
namespace App\Repositories\FailedJobs;

use App\Repositories\BaseRepositories;
use App\Models\FailedJobs;
use App\Repositories\FailedJobs\FailedJobsRepositoryInterface;


class FailedJobsRepository extends BaseRepositories implements FailedJobsRepositoryInterface{

    protected FailedJobs $failedJobs;
    public function __construct(FailedJobs $failedJobs)
    { 
        parent::__construct($failedJobs);
    }


 

}