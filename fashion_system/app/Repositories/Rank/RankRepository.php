<?php
namespace App\Repositories\Rank;

use App\Repositories\BaseRepositories;
use App\Models\Rank;
use App\Repositories\Rank\RankRepositoryInterface;


class RankRepository extends BaseRepositories implements RankRepositoryInterface{

    protected Rank $rank;
    public function __construct(Rank $rank)
    { 
        parent::__construct($rank);
    }


 

}