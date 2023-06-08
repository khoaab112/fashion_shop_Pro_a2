<?php
namespace App\Repositories\Migrations;

use App\Repositories\BaseRepositories;
use App\Models\Migrations;
use App\Repositories\Migrations\MigrationsRepositoryInterface;


class MigrationsRepository extends BaseRepositories implements MigrationsRepositoryInterface{

    protected Migrations $migrations;
    public function __construct(Migrations $migrations)
    { 
        parent::__construct($migrations);
    }


 

}