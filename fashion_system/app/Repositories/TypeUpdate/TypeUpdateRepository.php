<?php
namespace App\Repositories\TypeUpdate;

use App\Repositories\BaseRepositories;
use App\Models\TypeUpdate;
use App\Repositories\TypeUpdate\TypeUpdateRepositoryInterface;


class TypeUpdateRepository extends BaseRepositories implements TypeUpdateRepositoryInterface{

    protected TypeUpdate $typeUpdate;
    public function __construct(TypeUpdate $typeUpdate)
    { 
        parent::__construct($typeUpdate);
    }


 

}