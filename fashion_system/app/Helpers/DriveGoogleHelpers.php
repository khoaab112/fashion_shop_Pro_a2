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
        try {
            $result =  Storage::disk('google')->putFileAs($path, $file, $fileName);
            if ($result) {
                $meta = Storage::disk("google")
                    ->getAdapter()
                    ->getMetadata($fileName);
                // dd($meta['extraMetadata']['id']);
                return $meta['extraMetadata']['id'];
            }
            return true;
        } catch (\Exception $e) {
            Log::error($e->getMessage());
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
        try {
            return  Gdrive::all($path);
        } catch (\Exception $e) {
            return false;
        }
    }
}
