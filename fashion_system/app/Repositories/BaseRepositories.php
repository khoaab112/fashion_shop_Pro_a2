<?php

namespace App\Repositories;

use Illuminate\Database\Eloquent\Model;

/**
 * Summary of BaseRepositories
 */
abstract class BaseRepositories implements RepositoryInterface
{
    protected $model;
    public function __construct(Model $model)
    {

        $this->model = $model;
    }
    //để các lớp kế thừa xây dựng tiếp

    public function getAll()
    {
        return $this->model->all();
    }
    public function getById(int $id)
    {
        return $this->model->where('id', $id)->get();
    }
    public function create(array $array)
    {
        return $this->model->create($array);
    }
    public function updateById(array $array, int $id)
    {
        $object = $this->model->find($id);
        return $object->update($array);
    }
    public function findById(int $id)
    {
        return $this->model->findOrFail($id);
    }
    public function statusChange($id)
    {
        $object = $this->model->find($id);
        return $object->update(['status' => true]);
    }
    public function deleteAll()
    {
    }
    public function deleteById($id)
    {
        $object = $this->model->find($id);
        return $object->delete();
    }
    public function paging($numberOfElements = 10)
    {
        return $this->model->paging($numberOfElements);
    }
    public function search($key , $value)
    {
        return $this->model->where($key,$value)->get();
    }
    // abstract public function getModel();
}
