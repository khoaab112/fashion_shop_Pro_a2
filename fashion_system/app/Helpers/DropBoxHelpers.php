<?php

namespace App\Helpers;
use Dcblogdev\Dropbox\Facades\Dropbox;

class DropBoxHelpers
{
    protected $dropbox;
    protected  $FOLDER_INDEX='Public_data_fashion';
    protected $FOLDER_SYSTEM='system';
    protected $FOLDER_CLIENT='client';
    public  function getListFolders(){
       return Dropbox::files()->listContents(self::$FOLDER_INDEX);
    }


}
