<?php
namespace App\Repositories\ContactSupport;

use App\Repositories\BaseRepositories;
use App\Models\ContactSupport;
use App\Repositories\ContactSupport\ContactSupportRepositoryInterface;


class ContactSupportRepository extends BaseRepositories implements ContactSupportRepositoryInterface{

    protected ContactSupport $contactSupport;
    public function __construct(ContactSupport $contactSupport)
    { 
        parent::__construct($contactSupport);
    }


 

}