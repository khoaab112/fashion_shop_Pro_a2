<?php
namespace App\Repositories\DepotTicket;

use App\Repositories\BaseRepositories;
use App\Models\DepotTicket;
use App\Repositories\DepotTicket\DepotTicketRepositoryInterface;


class DepotTicketRepository extends BaseRepositories implements DepotTicketRepositoryInterface{

    protected DepotTicket $depotTicket;
    public function __construct(DepotTicket $depotTicket)
    { 
        parent::__construct($depotTicket);
    }


 

}