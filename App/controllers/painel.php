<?php
#chamando classes padrão para manipulação de dados
use App\Core\controller;
use App\Core\Model;
use App\Auth;

class painel extends controller
{

    #Index padrão PAINEL
    public function index()
    {
           #verifica se o user está realemnte logado ($_SESSION['logado']==True?)
        Auth::CheckLogin();
        $this->view('painel/home',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/painel_index.php"]);
    }
    public function logout()
    {
        Auth::logout();
    }
}
    
    