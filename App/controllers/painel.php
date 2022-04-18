<?php
#chamando classes padrão para manipulação de dados
use App\Auth;
use App\Core\Model;
use App\Core\controller;
use App\components\html_components;
use LDAP\Result;

class painel extends Controller
{
    public $nav_bar;

    #Index padrão PAINEL
    public function index()
    {
  
           #verifica se o user está realemnte logado ($_SESSION['logado']==True?)
        Auth::CheckLogin();
        $this->view('painel/home',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/painel_index.css"]);
    }
    public function logout()
    {
        Auth::logout();
    }
    public function perfil()
    {
        Auth::CheckLogin();
        // call components
        $this->nav_bar=html_components::nav_bar(); 
        
        // call model
        $dados=$this->model('user');
        $result=$dados->get_all_info_user();
        
        
        $this->view('painel/perfil',$data=['sty' =>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css", 'sty2'=>URL_BASE."/css/editar.php"],$result,$components=['nav-bar'=>$this->nav_bar]);  
    }
    public function editar()
    {
        $dados=$this->model('user');
        $result=$dados->get_all_info_user();
        $this->view('painel/editar',$data=['sty' =>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/editar.php"],$result);  
    }
    public function editar_save()
    {
        Auth::CheckLogin();
        if(isset($_POST['name']) && !empty($_POST['name']) && !empty($_POST['email']) && !empty($_POST['genero']) && !empty($_POST['resume'])  )
        {
            
            $stmt=$this->model('user');
            $name =$_POST['name'];
            $email=$_POST['email'];
            $genero=$_POST['genero'];
            $resume=$_POST['resume'];

            $stmt->update_user($name,$email,$resume,$genero);
            var_dump($_POST);
           
            
 
        }
        else
        {
           
            echo "Erro ao atualizar";
        }
    }

    public function deletar_acount_action()
    {
        Auth::CheckLogin();
        if (isset($_POST['senha']))
        {
            //logic for call verify password

            //logic for call method  delete()

        }
    }
}
    
    