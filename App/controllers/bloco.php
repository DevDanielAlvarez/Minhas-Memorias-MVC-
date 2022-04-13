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
    public function ver_blocos_de_notas()
    {
        
        //logica para trazer as informações do banco
        $this->view('blocos/ver_blocos_de_notas'); 
    }
}