<?php
#chamando classes padrão para manipulação de dados
use App\Auth;
use App\Core\Controller;
class games extends Controller
{
    public function index()
    {
        Auth::CheckLogin();
        $this->view("games/index");
    }
    public function math()
    {
        Auth::CheckLogin();
        $this->view("games/math");
    }
    public function quiz()
    {
        Auth::CheckLogin();
        $this->view("games/quiz");
    }
}