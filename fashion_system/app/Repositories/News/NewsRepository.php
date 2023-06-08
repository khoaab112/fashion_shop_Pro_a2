<?php
namespace App\Repositories\News;

use App\Repositories\BaseRepositories;
use App\Models\News;
use App\Repositories\News\NewsRepositoryInterface;


class NewsRepository extends BaseRepositories implements NewsRepositoryInterface{

    protected News $news;
    public function __construct(News $news)
    { 
        parent::__construct($news);
    }


 

}