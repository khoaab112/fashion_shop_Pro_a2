<?php
namespace App\Repositories\LogDeletes;

use App\Repositories\BaseRepositories;
use App\Models\LogDeletes;
use App\Repositories\LogDeletes\LogDeletesRepositoryInterface;


class LogDeletesRepository extends BaseRepositories implements LogDeletesRepositoryInterface{

    protected LogDeletes $logDeletes;
    public function __construct(LogDeletes $logDeletes)
    { 
        parent::__construct($logDeletes);
    }


 

}