<?php
namespace App\Repositories\LogLogin;

use App\Repositories\BaseRepositories;
use App\Models\LogLogin;
use App\Repositories\LogLogin\LogLoginRepositoryInterface;


class LogLoginRepository extends BaseRepositories implements LogLoginRepositoryInterface{

    protected LogLogin $logLogin;
    public function __construct(LogLogin $logLogin)
    { 
        parent::__construct($logLogin);
    }


 

}