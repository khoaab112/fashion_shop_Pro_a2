<?php
namespace App\Repositories\ListGiftCodes;

use App\Repositories\BaseRepositories;
use App\Models\ListGiftcodes;
use App\Repositories\ListGiftCodes\ListGiftCodesRepositoryInterface;


class ListGiftCodesRepository extends BaseRepositories implements ListGiftCodesRepositoryInterface{

    protected ListGiftcodes $listGiftcodes;
    public function __construct(ListGiftcodes $listGiftcodes)
    { 
        parent::__construct($listGiftcodes);
    }


 

}