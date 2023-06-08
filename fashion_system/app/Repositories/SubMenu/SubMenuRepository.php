<?php
namespace App\Repositories\SubMenu;

use App\Repositories\BaseRepositories;
use App\Models\SubMenu;
use App\Repositories\SubMenu\SubMenuRepositoryInterface;


class SubMenuRepository extends BaseRepositories implements SubMenuRepositoryInterface{

    protected SubMenu $subMenu;
    public function __construct(SubMenu $subMenu)
    { 
        parent::__construct($subMenu);
    }


 

}