<?php
namespace App\Repositories\CommentsNews;

use App\Repositories\BaseRepositories;
use App\Models\CommentsNews;
use App\Repositories\CommentsNews\CommentsNewsRepositoryInterface;


class CommentsNewsRepository extends BaseRepositories implements CommentsNewsRepositoryInterface{

    protected CommentsNews $commentsNews;
    public function __construct(CommentsNews $commentsNews)
    { 
        parent::__construct($commentsNews);
    }


 

}