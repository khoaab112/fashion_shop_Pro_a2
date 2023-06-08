<?php
namespace App\Repositories\TransferProviders;

use App\Repositories\BaseRepositories;
use App\Models\TransferProviders;
use App\Repositories\TransferProviders\TransferProvidersRepositoryInterface;


class TransferProvidersRepository extends BaseRepositories implements TransferProvidersRepositoryInterface{

    protected TransferProviders $transferProviders;
    public function __construct(TransferProviders $transferProviders)
    { 
        parent::__construct($transferProviders);
    }


 

}