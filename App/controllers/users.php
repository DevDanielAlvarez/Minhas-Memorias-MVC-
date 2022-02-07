<?php
use App\Core\controller;
use App\Core\Model;
use App\Auth;

class users extends controller
{
   

    public function Cadastrar()
    {
 
        //verifica se o button foi acionado, e se algum campo esta vazio.
        
      if(isset($_POST['nome_paciente']) ):
        $user=$this->Model('user');
               #filtragrem de valores
               $user->nome_paciente= addslashes($_POST['nome_paciente']);
               $user->telefone_paciente= addslashes($_POST['telefone_paciente']);
               $user->dt_paciente= addslashes($_POST['dt_paciente']);
               $user->email_paciente= addslashes($_POST['email_paciente']);
               $user->patologia_paciente= addslashes($_POST['patologia_paciente']);
               $user->estado_paciente= addslashes($_POST['estado_paciente']);
               $user->senha1_paciente= addslashes($_POST['senha1_paciente']);
              
               //familiar
               $user->nome_familiar= addslashes($_POST['nome_familiar']);
               $user->telefone_familiar= addslashes($_POST['telefone_familiar']);
               $user->dt_familiar= addslashes($_POST['dt_familiar']);
               $user->email_familiar= addslashes($_POST['email_familiar']);
               $user->parent_familiar= addslashes($_POST['parent_familiar']);
               $user->estado_familiar= addslashes($_POST['estado_familiar']);
               $user->senha1_familiar= addslashes($_POST['senha1_familiar']);
              
               if(empty($user->nome_paciente)||empty($user->telefone_paciente)||empty($user->dt_paciente)||empty($user->email_paciente)||empty($user->patologia_paciente)||empty($user->estado_paciente) ||empty($user->senha1_paciente) /*family-> */|| empty($user->nome_familiar)|| empty($user->telefone_familiar) || empty($user->dt_familiar) || empty($user->email_familiar) || empty($user->parent_familiar) || empty($user->estado_familiar)|| empty($user->senha1_familiar)):
                echo "Error";
               else:
                
                $senha= password_hash($user->senha1_paciente,PASSWORD_DEFAULT);
                $user->senha1_paciente=$senha;
                $user->cadastroUser();        
        endif;
         else:$this->view('users/cadastro');

    endif;
        
    }
    public function Logar()
    {

  

       if(isset($_POST['email'])):
        $user=$this->model('user');
        $user->email_login=addslashes($_POST['email']);
        $user->senha_login=addslashes($_POST['senha']);
        Auth::login($user->email,$user->senha);
        
        

       else: $this->view('users/login');

       endif;
    }

}