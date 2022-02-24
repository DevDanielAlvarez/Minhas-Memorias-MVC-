<?php
#chamando classes padrão para manipulação de dados
use App\Core\Controller;
class home extends Controller
{
    #index padrao Home
    public function index()
    {
        $this->view('home/index',$data=['sty'=>URL_BASE."/css/home.php"]);
    }
}