<?php
#chamando classes padrão para manipulação de dados .
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
           
            
            $this->view('blocos/ver_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result);
        }
        else{ $this->view('blocos/ver_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result); }
    
    }

    public function editar_bloco($cd_bloco='')
    {
            //start model
        $model_bloco=$this->model('bloco_model');
        // se existe um param
        if($cd_bloco!='')
        {        //se o post existe significa q o button foi acionado
            if(isset($_POST['title']) )
            {

                //virify if exists any change
                 $return=$model_bloco->verify_change_notepad($_POST['title'],$_POST['text'],$cd_bloco);
                 
                 if($return==1){echo '0';}
                 
               else{
                //execute model
                $update['title']= addslashes( $_POST['title']);
                $update['text']=  $_POST['text'];
                $model_bloco->update_notepad($update['title'],$update['text'],$cd_bloco);
                    echo '1';
               }
              
            }
            else{
            $result=$model_bloco->get_single_info_for_notepad($cd_bloco);
            $this->view('blocos/editar_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/notes/jquery.cleditor.php",'sty3'=>URL_BASE."/css/editar.php"],$result);
            }
            
            
        }
        else{ $this->view('blocos/editar_bloco',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/notes/jquery.cleditor.php"]); }
       
    }

    public function criar_bloco()
    {
        //logica para criar um bloco novo
        $model_bloco= $this->model('bloco_model');
        $model_bloco->create_bloco_model($_POST['title'],$_POST['text']);
        echo 'funcionou';
    }

    public function delete_notepad($cd_bloco)
    {
        $model_bloco=$this->model('bloco_model');
      
        $model_bloco->delete_notepad($cd_bloco);
        echo "Sucesso ao deletar o bloco de notas";
        
    }
}