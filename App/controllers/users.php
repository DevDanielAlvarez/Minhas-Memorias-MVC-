<?php
#chamando classes padrão para manipulação de dados
use App\Core\controller;
use App\Core\Model;
use App\Auth;

class users extends controller
{
   
  #cadastra o usario (Paciente junto ao seu familiar)
    public function Cadastrar()
    {
 
        //verifica se o button foi acionado, e se algum campo esta vazio.
        
      if(isset($_POST['nome_cadastro']) ):
        $user=$this->Model('user');
               #filtragrem de valores Paciente
               $user->nome_cadastro= addslashes($_POST['nome_cadastro']);
               $user->email_cadastro= addslashes($_POST['email_cadastro']);
               $user->telefone_cadastro= addslashes($_POST['telefone_cadastro']);
               $user->date_cadastro= addslashes($_POST['date_cadastro']);
               $user->senha1_cadastro= addslashes($_POST['senha1_cadastro']);

             
              
               //filtragrem de valores familiar
               
              #verificação de espaços vazios
               if(empty($user->nome_cadastro) && empty($user->email_cadastro)&& empty($user->telefone_cadastro) && empty($user->date_cadastro) && empty($user->senha1_cadastro)):
                echo "Error";
               else:
                #criptografia de senha
                $senha= password_hash($user->senha1_cadastro,PASSWORD_DEFAULT);
                
                $user->senha1_cadastro=$senha;
                #chamado do Models/user.php-> cadastro()
                $user->cadastroUser();        
         endif;
         

    endif;
        
    }
    public function Logar()
    {

  

       if(isset($_POST['email'])):
        $user=$this->model('user');
        $user->email_login=addslashes($_POST['email']);
        $user->senha_login=addslashes($_POST['senha']);
        
        
        Auth::login($user->email_login,$user->senha_login);
          
      

       else: $this->view('users/login',$data=['sty'=>URL_BASE."/css/style.css"]);
       
       endif;
    }

}