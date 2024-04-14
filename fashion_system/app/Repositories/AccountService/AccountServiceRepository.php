<?php
namespace App\Repositories\AccountService;

use App\Repositories\BaseRepositories;
use App\Models\AccountService;
use App\Repositories\AccountService\AccountServiceRepositoryInterface;


class AccountServiceRepository extends BaseRepositories implements AccountServiceRepositoryInterface{

    protected AccountService $accountService;
    public function __construct(AccountService $accountService)
    {
        parent::__construct($accountService);
    }




}
