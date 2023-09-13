<?php

namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Events\MessageNotification;

class TestSockets extends Controller
{
    //
    public function testTing()
    {
        event(new MessageNotification('test'));
    }
}
