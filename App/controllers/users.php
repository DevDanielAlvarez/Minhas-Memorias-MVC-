<?php
use App\Core\controller;
class users extends controller
{
    protected $nome;

    public function Cadastrar()
    {
 
        //verifica se o button foi acionado, e se algum campo esta vazio.
        
      if(isset($_POST['nome_paciente']) ):
               #filtragrem de valores
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               //familiar
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               $nome_paciente= addslashes($_POST['nome_paciente']);
               echo 1;
        else:
        $this->view('users/cadastro');
        endif;
        
    }
    public function Logar()
    {

        $this->view('users/login');
    }

}