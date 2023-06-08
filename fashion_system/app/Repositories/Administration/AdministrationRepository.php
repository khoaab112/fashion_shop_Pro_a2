<?php
namespace App\Repositories\Administration;

use App\Repositories\BaseRepositories;
use App\Models\Administration;
use App\Repositories\Administration\AdministrationRepositoryInterface;


class AdministrationfRepository extends BaseRepositories implements AdministrationRepositoryInterface{

    protected Administration $administration;
    public function __construct(Administration $administration)
    { 
        parent::__construct($administration);
    }


 

}