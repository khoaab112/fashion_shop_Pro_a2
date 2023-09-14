<?php

namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Events\MessageNotification;
use App\Events\AdminConnected;

class TestSockets extends Controller
{
    //
    public function testTing()
    {
        event(new MessageNotification('test'));
    }
    public function testTing2()
    {
        event(new AdminConnected('test'));
    }
}
