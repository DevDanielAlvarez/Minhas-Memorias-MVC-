<?php
#chamando classes padrão para manipulação de dados
use App\Core\Controller;
class games extends Controller
{
    public function index()
    {
        $this->view("games/index");
    }
    public function math()
    {
        $this->view("games/math");
    }
}