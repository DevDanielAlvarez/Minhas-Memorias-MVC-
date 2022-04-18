<?php
#chamando classes padrão para manipulação de dados
use App\Core\controller;
use App\Core\Model;
use App\Auth;
use App\components_html;
use App\components\html_components;
use LDAP\Result;

class bloco extends controller
{
    public function index()
    {
        
        //logica para trazer as informações do banco
       $model_bloco=$this->model('bloco_model');
      $result= $model_bloco->get_all_notepads_for_user();

        //view
        $this->view('blocos/ver_blocos_de_notas',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result); 
    }
    public function ver_bloco($id='')
    {
        $model_bloco=$this->model('bloco_model');
        $result=$model_bloco->get_single_info_for_notepad($id);
        
        if(empty($result))
        {
           
            
            $this->view('blocos/ver_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result,$components=['nav-bar'=>$this->nav_bar]);
        }
        else{ $this->view('blocos/ver_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result); }
    
    }

    public function editar_bloco()
    {
        $this->view('blocos/editar_bloco',$data=['sty'=>"s",'sty2'=>URL_BASE."/css/notes/jquery.cleditor.php"]);
    }
}