<?php
#chamando classes padrão para manipulação de dados
use App\Auth;
use App\Core\Model;
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
    public function jogo_da_memoria()
    {
        
        $this->view("games/jogo_da_memoria",$data=['sty'=>URL_BASE."/css/style.prefix.css"]);
    }
    public function rank()
    {
        $game=$this->Model('gamesmodel');
       $result= $game->rankview();
        $this->view("games/rank",$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"],$result);
    }
}