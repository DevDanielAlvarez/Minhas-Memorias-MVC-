<?php
use App\Core\controller;
use App\Core\Model;
use App\Auth;

class painel extends controller
{
   

    public function index()
    {
        $this->view('painel/home');
    }
}
    
    