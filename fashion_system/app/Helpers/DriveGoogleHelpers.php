<?php

namespace App\Helpers;

use Exception;
use Yaza\LaravelGoogleDriveStorage\Gdrive;
use Illuminate\Support\Facades\Storage;

class DriveGoogleHelpers
{

    public static function saveFile($file, $path, $fileName)
    {
        try {
            $result =  Storage::disk('google')->putFileAs($path, $file, $fileName);
            if($result)
            {
                dd("thành cong");
            }
            else{
                dd("thất bại");
            }
            $meta = Storage::disk("google")
                ->getAdapter()
                ->getMetadata($fileName);
            return $meta['extraMetadata']['id'];
        } catch (\Exception $e) {
            return false;
        }
    }
    public static function getFile($fileName)
    {
        try {
            $data = Gdrive::get($fileName);
            return $data->file;
        } catch (\Exception $e) {
            return false;
        }
    }
    // public function downloadFile($fileName)
    // {
    //     $data = Gdrive::get('path/filename.png');

    // }
    public static function deleteFile($fileName)
    {
        try {
            Gdrive::delete($fileName);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
    public static function getAllFolder($path)
    {
        try{
          return  Gdrive::all($path);
        } catch (\Exception $e) {
            return false;
        }
    }
}
