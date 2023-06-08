<?php
namespace App\Repositories\IntermediaryAccountservice;

use App\Repositories\BaseRepositories;
use App\Models\IntermediaryAcountService;
use App\Repositories\IntermediaryAccountservice\IntermediaryAccountserviceRepositoryInterface;


class IntermediaryAccountserviceRepository extends BaseRepositories implements IntermediaryAccountserviceRepositoryInterface{

    protected IntermediaryAcountService $staintermediaryAcountServiceff;
    public function __construct(IntermediaryAcountService $intermediaryAcountService)
    { 
        parent::__construct($intermediaryAcountService);
    }


 

}