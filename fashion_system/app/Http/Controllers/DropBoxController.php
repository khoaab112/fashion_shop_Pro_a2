<?php

namespace App\Http\Controllers;
use App\Helpers\DriveGoogleHelpers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Yaza\LaravelGoogleDriveStorage\Gdrive;

class DropBoxController extends Controller
{
    //
    public function indexAction(Request $request)
    {
        // $a =Gdrive::getMetadata('filename1.png');
        // $fileId = Storage::disk('google')->putFileAs('',  $request->file('file'), 'filename22q12.png');
        // $storagePath = 'system/images/avatar';
        $storagePath = '';
        $fileName="123213123.jpg";
        $resultSaveFile = DriveGoogleHelpers::saveFile($request->file('file'), $storagePath, $fileName);
dd($resultSaveFile);
        $meta = Storage::disk("google")
            ->getAdapter()
            ->getMetadata('filename22q12.png');
            // ->extraMetadata();
        // // Gdrive::put('filename.png', $request->file('file'));
        dd($meta['extraMetadata']['id']);
    }
}
