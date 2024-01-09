<?php

namespace App\Helpers;

use Exception;
use Yaza\LaravelGoogleDriveStorage\Gdrive;
use Illuminate\Support\Facades\Storage;

class DriveGoogleHelpers
{

    public function saveFile($file, $path, $fileName)
    {
        try {
            Storage::disk('google')->putFileAs($path, $file, $fileName);
            $meta = Storage::disk("google")
                ->getAdapter()
                ->getMetadata($fileName);
            return $meta['extraMetadata']['id'];
        } catch (\Exception $e) {
            return false;
        }
    }
    public function getFile($fileName)
    {
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
    public function getAllFolder($path)
    {
        try{
          return  Gdrive::all('foldername');
        } catch (\Exception $e) {
            return false;
        }
    }
}
