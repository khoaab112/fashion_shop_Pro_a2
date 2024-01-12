<?php

namespace App\Helpers;

use Exception;
use Yaza\LaravelGoogleDriveStorage\Gdrive;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class DriveGoogleHelpers
{

    public static function saveFile($file, $path, $fileName)
    {
        // $fileName = str_replace("\0", '', $fileName);
        try {
            $result =  Storage::disk('google')->putFileAs($path, $file, $fileName);
            if ($result) {
                return Storage::disk("google")
                ->getAdapter()
                ->getMetadata($result)
                ->extraMetadata()['id'];
            }
            return false;
        } catch (\Exception $e) {
            return false;
        }
    }
    public function getFile($fileName)
    {
        $fullPath =$path."/".$fileName;
        try {
            $data = Gdrive::get('path/filename.png');
            return $data->file;
        } catch (\Exception $e) {
            return false;
        }
    }
    // public function downloadFile($fileName)
    // {
    //     $data = Gdrive::get('path/filename.png');

    // }
    public function deleteFile($fileName)
    {
        try {
            Gdrive::delete('path/filename.png');
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
    public static function getAllFolder($path)
    {
        try{
          return  Gdrive::all('foldername');
        } catch (\Exception $e) {
            return false;
        }
    }
}
