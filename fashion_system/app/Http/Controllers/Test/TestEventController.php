<?php

namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Events\TestEventSocket;

class TestEventController extends Controller
{
    //
    public function testTing()
    {
        event(new TestEventSocket);
    }
}
