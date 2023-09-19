<?php
namespace App\Repositories\CustomersNotification;

use App\Repositories\BaseRepositories;
use App\Models\CustomersNotification;
use App\Repositories\CustomersNotification\CustomersNotificationRepositoryInterface;


class CustomersNotificationProvidersRepository extends BaseRepositories implements CustomersNotificationRepositoryInterface{

    protected CustomersNotification $customersNotification;
    public function __construct(CustomersNotification $customersNotification)
    {
        parent::__construct($customersNotification);
    }




}
