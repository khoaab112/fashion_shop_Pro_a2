<?php

namespace App\Helpers;

class FileResourcesHelpers
{

    public static function saveFileToResource($file){
        $pathResource = 'resources/public';
        $result = file_put_contents($pathResource, $content);

    }


}
