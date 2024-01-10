<?php

namespace App\Helpers;

use Exception;
use Yaza\LaravelGoogleDriveStorage\Gdrive;
use Illuminate\Support\Facades\Storage;

class DriveGoogleHelpers
{

    public static function saveFile($file, $path, $fileName)
    {
        // $fileName = str_replace("\0", '', $fileName);
        try {
            Storage::disk('google')->putFileAs($path, $file, $fileName);
            $meta = Storage::disk("google")
                ->getAdapter()
                ->getMetadata($fileName);
            return $meta['extraMetadata']['id'];
        } catch (\Exception $e) {
            dd($e);
            return false;
        }
    }
    public function getFile($fileName,$path)
    {
        $fullPath =$path."/".$fileName;
        try {
            $data = Gdrive::get($fullPath);
            return $data->file;
        } catch (\Exception $e) {
            return false;
        }
    }
    // public function downloadFile($fileName)
    // {
    //     $data = Gdrive::get('path/filename.png');

    // }
    public static function deleteFile($fullPath)
    {
        try {
            Gdrive::delete($fullPath);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
    public function getAllFolder($path)
    {
        try{
          return  Gdrive::all($path);
        } catch (\Exception $e) {
            return false;
        }
    }
}
