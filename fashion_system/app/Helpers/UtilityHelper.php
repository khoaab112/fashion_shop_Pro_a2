<?php

namespace App\Helpers;

use App\Http\Controllers\Admin\NotificationController;

class UtilityHelper
{
    public static function Notification($staffID, $content, $code)
    {
        $dataNotification = [
            'staff_id' => $staffID,
            'content' => $content,
            'code' => $code
        ];
        $notificationController = app(NotificationController::class);
        $notificationController->createNotificationByIdStaff($dataNotification);
    }
}
