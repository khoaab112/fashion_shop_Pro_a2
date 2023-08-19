<?php
namespace App\Repositories;

use Illuminate\Database\Eloquent\Collection;

interface RepositoryInterface {

    public function getAll();
    public function getById(int $id);
    public function create(array $array);
    public function updateById(array $array,int $id);
    public function findById(int $id);
    public function statusChange($id);
    public function deleteAll();
    public function deleteById($id);
    public function paging($numberOfElements);
    public function search($key, $value);
}
