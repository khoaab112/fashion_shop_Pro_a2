<?php
namespace App\Repositories\LogUpdates;

use App\Repositories\BaseRepositories;
use App\Models\LogUpdate;
use App\Repositories\LogUpdates\LogUpdatesRepositoryInterface;


class LogUpdatesRepository extends BaseRepositories implements LogUpdatesRepositoryInterface{

    protected LogUpdate $logUpdate;
    public function __construct(LogUpdate $logUpdate)
    { 
        parent::__construct($logUpdate);
    }


 

}