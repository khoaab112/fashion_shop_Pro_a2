<?php
namespace App\Repositories\GiftCode;

use App\Repositories\BaseRepositories;
use App\Models\Giftcode;
use App\Repositories\GiftCode\GiftCodeRepositoryInterface;


class GiftCodeRepository extends BaseRepositories implements GiftCodeRepositoryInterface{

    protected Giftcode $giftcode;
    public function __construct(Giftcode $giftcode)
    { 
        parent::__construct($giftcode);
    }


 

}