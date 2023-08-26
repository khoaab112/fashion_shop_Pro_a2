<?php
namespace App\Repositories;

use Illuminate\Database\Eloquent\Collection;

interface RepositoryInterface {

    public function getAll();
    public function getById(int $id);
    public function create(array $array);
    public function creates(array $array);
    public function updateById(array $array,int $id);
    public function findById(int $id);
    public function statusChange($id,$status);
    public function deleteAll();
    public function deleteById($id);
    public function pagingRecord($numberOfElements);
    public function search($key, $value);
    public function count();
}
