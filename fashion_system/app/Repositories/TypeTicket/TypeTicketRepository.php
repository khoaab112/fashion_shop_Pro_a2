<?php
namespace App\Repositories\TypeTicket;

use App\Repositories\BaseRepositories;
use App\Models\TypeTicket;
use App\Repositories\TypeTicket\TypeTicketRepositoryInterface;


class TypeTicketRepository extends BaseRepositories implements TypeTicketRepositoryInterface{

    protected TypeTicket $typeTicket;
    public function __construct(TypeTicket $typeTicket)
    { 
        parent::__construct($typeTicket);
    }


 

}