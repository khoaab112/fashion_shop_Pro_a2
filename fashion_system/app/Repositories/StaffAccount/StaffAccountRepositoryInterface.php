<?php

namespace App\Repositories\StaffAccount;


use App\Repositories\RepositoryInterface;

interface StaffAccountRepositoryInterface extends RepositoryInterface
{
    public function searchUserName($name);

}
