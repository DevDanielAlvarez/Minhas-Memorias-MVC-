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
               $telefone_paciente= addslashes($_POST['telefone_paciente']);
               $dt_paciente= addslashes($_POST['dt_paciente']);
               $email_paciente= addslashes($_POST['email_paciente']);
               $patologia_paciente= addslashes($_POST['patologia_paciente']);
               $estado_paciente= addslashes($_POST['estado_paciente']);
               $senha1_paciente= addslashes($_POST['senha1_paciente']);
              
               //familiar
               $nome_familiar= addslashes($_POST['nome_familiar']);
               $telefone_familiar= addslashes($_POST['telefone_familiar']);
               $dt_familiar= addslashes($_POST['dt_familiar']);
               $email_familiar= addslashes($_POST['email_familiar']);
               $parent_familiar= addslashes($_POST['parent_familiar']);
               $estado_familiar= addslashes($_POST['estado_familiar']);
               $senha1_familiar= addslashes($_POST['senha1_familiar']);
              
               if(empty($nome_paciente)||empty($telefone_paciente)||empty($dt_paciente)||empty($email_paciente)||empty($patologia_paciente)||empty($estado_paciente) ||empty($senha1_paciente) /*family-> */|| empty($nome_familiar)|| empty($telefone_familiar) || empty($dt_familiar) || empty($email_familiar) || empty($parent_familiar) || empty($estado_familiar)|| empty($senha1_familiar)):
                echo "n foi";
               else:echo "foi"/*PDO AQUI*/ ;
        
        endif;
         else:$this->view('users/cadastro');

    endif;
        
    }
    public function Logar()
    {

        $this->view('users/login');
    }

}