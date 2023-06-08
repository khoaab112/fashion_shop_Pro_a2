<?php
namespace App\Repositories\MenuMain;

use App\Repositories\BaseRepositories;
use App\Models\MenuMain;
use App\Repositories\MenuMain\MenuMainRepositoryInterface;


class MenuMainRepository extends BaseRepositories implements MenuMainRepositoryInterface{

    protected MenuMain $menuMain;
    public function __construct(MenuMain $menuMain)
    { 
        parent::__construct($menuMain);
    }


 

}