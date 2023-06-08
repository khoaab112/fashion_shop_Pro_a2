<?php
namespace App\Repositories\Position;

use App\Repositories\BaseRepositories;
use App\Models\Position;
use App\Repositories\Position\PositionRepositoryInterface;


class PositionRepository extends BaseRepositories implements PositionRepositoryInterface{

    protected Position $position;
    public function __construct(Position $position)
    { 
        parent::__construct($position);
    }


 

}