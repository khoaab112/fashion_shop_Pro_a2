<?php
namespace App\Repositories\TypeNotification;

use App\Repositories\BaseRepositories;
use App\Models\TypeNotification;
use App\Repositories\TypeNotification\TypeNotificationRepositoryInterface;


class TransferProvidersRepository extends BaseRepositories implements TypeNotificationRepositoryInterface{

    protected TypeNotification $typeNotification;
    public function __construct(TypeNotification $typeNotification)
    {
        parent::__construct($typeNotification);
    }




}
