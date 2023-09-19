<?php
namespace App\Repositories\AdminsNotification;

use App\Repositories\BaseRepositories;
use App\Models\AdminsNotification;
use App\Repositories\AdminsNotification\AdminsNotificationRepositoryInterface;


class AdminsNotificationRepository extends BaseRepositories implements AdminsNotificationRepositoryInterface{

    protected AdminsNotification $adminsNotification;
    public function __construct(AdminsNotification $adminsNotification)
    {
        parent::__construct($adminsNotification);
    }




}
