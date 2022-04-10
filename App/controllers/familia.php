<?php
#chamando classes padrão para manipulação de dados
use App\Core\controller;
use App\Core\Model;
use App\Auth;
use App\components_html;
use App\components\html_components;
use LDAP\Result;

class familia extends controller
{
    protected $name;
    protected $email;
    protected $date;
    protected $senha;
    public function index()
    {

    }

    public function cadastro()
    {
        $this->view('/users/family_cadastro',$data=['sty'=>URL_BASE."/css/family_cadastro/main.css"]);
        
    }
    public function cadastrar()
    {
        if(isset($_POST['name']))
        {
            $this->name=addslashes($_POST['name']);
            $this->email=addslashes($_POST['email']);
            $this->date=addslashes($_POST['dt']);
            $this->senha=addslashes($_POST['s1']);
            $family_model=$this->model('family_model');
            $family_model->cadastrar_familiar($this->name,$this->email,$this->date,$this->senha);
        }
    }
}