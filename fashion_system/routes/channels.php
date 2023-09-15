<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Log;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});
Broadcast::channel('channel-name', function ($user) {
    // Kiểm tra xác thực và phân quyền ở đây
    Log::info( 'channel-name');

    return true;
});
Broadcast::channel('admin_connect', function ($user) {
    // Kiểm tra xác thực và phân quyền ở đây
    return true;
});
