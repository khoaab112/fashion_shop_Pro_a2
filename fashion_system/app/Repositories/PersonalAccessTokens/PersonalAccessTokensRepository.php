<?php
namespace App\Repositories\PersonalAccessTokens;

use App\Repositories\BaseRepositories;
use App\Models\PersonalAccessTokens;
use App\Repositories\PersonalAccessTokens\PersonalAccessTokensRepositoryInterface;


class PersonalAccessTokensRepository extends BaseRepositories implements PersonalAccessTokensRepositoryInterface{

    protected PersonalAccessTokens $personalAccessTokens;
    public function __construct(PersonalAccessTokens $personalAccessTokens)
    { 
        parent::__construct($personalAccessTokens);
    }


 

}