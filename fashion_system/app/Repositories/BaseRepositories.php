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
    public function creates(array $array)
    {
        return $this->model->insert($array);
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
    public function statusChange($id, $status)
    {
        $object = $this->model->find($id);
        return $object->update(['status' => $status]);
    }
    public function deleteAll()
    {
    }
    public function deleteById($id)
    {
        $object = $this->model->find($id);
        return $object->delete();
    }
    // First 10 records
    public function pagingRecord($numberOfElements)
    {
        return $this->model->paginate($numberOfElements)->sortByDesc('id');
    }
    public function getRecordByPage($recordNumber, $page)
    {
        // return $this->model->paginate($recordNumber, ['*'], 'page', $page)->sortByDesc('id');
        return $this->model->orderBy('id', 'desc')->paginate($recordNumber, ['*'], 'page', $page)->sortByDesc('id');
    }
    public function getRecordByPageConditional($recordNumber, $page, $conditional, $value)
    {
        // return $this->model->paginate($recordNumber, ['*'], 'page', $page)->sortByDesc('id');
        return $this->model->where($conditional, $value)->orderBy('id', 'desc')->paginate($recordNumber, ['*'], 'page', $page)->sortByDesc('id');
    }
    // tìm kiếm theo điều kiện
    public function search($key, $value)
    {
        return $this->model->where($key, $value)->get();
    }
    //lấy data theo điều kiện nào đó
    public function getDataAccordingToConditions($arrCondition)
    {
        /*
        [
          ['status', '=', '1'],
          ['subscribed', '<>', '1'],
        ]
        */
        return $this->model->where($arrCondition)->get();
    }
    public function count()
    {
        return $this->model->count();
    }
    public function countByConditions($conditions)
    {
        return $this->model->where($conditions)->count();

    }
    // abstract public function getModel();
}
