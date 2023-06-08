<?php
namespace App\Repositories\ActionAdmin;

use App\Repositories\BaseRepositories;
use App\Models\Action;
use App\Repositories\ActionAdmin\ActionAdminRepositoryInterface;


class ActionRepository extends BaseRepositories implements ActionAdminRepositoryInterface{

    protected Action $action;
    public function __construct(Action $action)
    { 
        parent::__construct($action);
    }


 

}