<?php
namespace App\Repositories\ImgNews;

use App\Repositories\BaseRepositories;
use App\Models\ImgNews;
use App\Repositories\ImgNews\ImgNewsRepositoryInterface;


class ImgNewsRepository extends BaseRepositories implements ImgNewsRepositoryInterface{

    protected ImgNews $imgNews;
    public function __construct(ImgNews $imgNews)
    { 
        parent::__construct($imgNews);
    }


 

}