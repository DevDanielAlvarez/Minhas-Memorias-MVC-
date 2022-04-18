<?php
#chamando classes padrão para manipulação de dados
use App\Auth;
use App\Core\Model;
use App\Core\Controller;
use App\components\html_components;
class games extends Controller
{
    public function index() 
    {
       Auth::CheckLogin();
       html_components::nav_bar();
        $this->view("games/index",$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/games_index.css"],null,);
    }
    public function math()
    {
        Auth::CheckLogin();
        $this->view("games/math");
    }
    public function jogo_da_memoria()
    {
        Auth::CheckLogin();
        $this->view("games/jogo_da_memoria",$data=['sty'=>URL_BASE."/css/style.prefix.css"]);
    }
    public function rank()
    {
        Auth::CheckLogin();
        $game=$this->Model('gamesmodel');
        $result= $game->rankview();
        $this->view("games/rank",$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"],$result);
    }
}