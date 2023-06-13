<?php
namespace App\Repositories\AccountAdminAction;

use App\Repositories\BaseRepositories;
use App\Models\AccountAdminAction;
use App\Repositories\AccountAdminAction\AccountAdminActionReposotpryIntaface;


class AccountAdminActionRepository extends BaseRepositories implements AccountAdminActionReposotpryIntaface{

    protected AccountAdminAction $action;
    public function __construct(AccountAdminAction $action)
    { 
        parent::__construct($action);
    }


 

}