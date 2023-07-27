<?php
namespace App\Repositories\StaffAccount;

use App\Repositories\BaseRepositories;
use App\Models\StaffAccount;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;

class StaffAccountRepository extends BaseRepositories implements StaffAccountRepositoryInterface{

    protected StaffAccount $staffAccount;
    public function __construct(StaffAccount $staffAccount)
    { 
        $this->staffAccount = $staffAccount;
        parent::__construct($staffAccount);
    }
    public function searchUserName($name)
    {
        // dd(3);
        return $this->staffAccount->where('user_name', $name)->first();
        // return $this->staffAccount->all();

    }
    public function removeRefreshToken($id)
    {
        return $this->staffAccount->where('id', $id)->update(['refresh_token'=>null,'issued_at'=>null,'expired_time'=>null]);
    }


 

}