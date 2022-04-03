<?php
namespace App\Core;
class Controller
{
    public function model($model)
    {
        require_once '../App/models/'.$model.".php";
        return new $model;

    }

    public function call_conn()
    {
        require_once '../App/core/model.php';
        return new $model;

    }

    public function view($view,$data=[],$data2=[])
    {
        require '../App/views/template.php';
    }

}