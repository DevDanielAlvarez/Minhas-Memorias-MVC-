<?php
#chamando classes padrão para manipulação de dados
use App\Auth;
use App\Core\Model;
use App\Core\Controller;
use App\components\html_components;
class genius extends controller
{
    public function index() 
    {
       Auth::CheckLogin();
       $this->view("games/genius/index",$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css",'sty2'=>URL_BASE."//Minhas-Memorias-MVC-/public/css/genius/style.css"],null);
    }
}