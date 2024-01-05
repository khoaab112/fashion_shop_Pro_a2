<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Dcblogdev\Dropbox\Facades\Dropbox;
use Spatie\Dropbox\Client;

class DropBoxController extends Controller
{
    //
    public function indexAction()
    {
        dd(Dropbox::files()->getMetadata ('Public_data_fashion/system'));
    }
}
