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
    public function index()
    {

    }

    public function cadastro()
    {
        $this->view('/users/family_cadastro',$data=['sty'=>URL_BASE."/css/family_cadastro/main.css"]);
        
    }
}