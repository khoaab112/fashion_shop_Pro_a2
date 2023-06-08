<?php
namespace App\Repositories\ListCodesReceived;

use App\Repositories\BaseRepositories;
use App\Models\ListCodesReceived;
use App\Repositories\ListCodesReceived\ListCodesReceivedRepositoryInterface;


class ListCodesReceivedRepository extends BaseRepositories implements ListCodesReceivedRepositoryInterface{

    protected ListCodesReceived $listCodesReceived;
    public function __construct(ListCodesReceived $listCodesReceived)
    { 
        parent::__construct($listCodesReceived);
    }


 

}