<?php
use App\Core\controller;
use App\Core\Model;

class users extends controller
{
   

    public function Cadastrar()
    {
 
        //verifica se o button foi acionado, e se algum campo esta vazio.
        
      if(isset($_POST['nome_paciente']) ):
        $user=$this->Model('user');
               #filtragrem de valores
               $this->nome_paciente= addslashes($_POST['nome_paciente']);
               $this->telefone_paciente= addslashes($_POST['telefone_paciente']);
               $this->dt_paciente= addslashes($_POST['dt_paciente']);
               $this->email_paciente= addslashes($_POST['email_paciente']);
               $this->patologia_paciente= addslashes($_POST['patologia_paciente']);
               $this->estado_paciente= addslashes($_POST['estado_paciente']);
               $this->senha1_paciente= addslashes($_POST['senha1_paciente']);
              
               //familiar
               $this->nome_familiar= addslashes($_POST['nome_familiar']);
               $this->telefone_familiar= addslashes($_POST['telefone_familiar']);
               $this->dt_familiar= addslashes($_POST['dt_familiar']);
               $this->email_familiar= addslashes($_POST['email_familiar']);
               $this->parent_familiar= addslashes($_POST['parent_familiar']);
               $this->estado_familiar= addslashes($_POST['estado_familiar']);
               $this->senha1_familiar= addslashes($_POST['senha1_familiar']);
              
               if(empty($this->nome_paciente)||empty($this->telefone_paciente)||empty($this->dt_paciente)||empty($this->email_paciente)||empty($this->patologia_paciente)||empty($this->estado_paciente) ||empty($this->senha1_paciente) /*family-> */|| empty($this->nome_familiar)|| empty($this->telefone_familiar) || empty($this->dt_familiar) || empty($this->email_familiar) || empty($this->parent_familiar) || empty($this->estado_familiar)|| empty($this->senha1_familiar)):
                echo "bvbv";
               else:
                
                $user->nome_paciente=$this->nome_paciente;
                $user->telefone_paciente=$this->telefone_paciente;
                $user->dt_paciente=$this->dt_paciente;
                $user->email_paciente=$this->email_paciente;
                $user->patologia_paciente=$this->patologia_paciente;
                $user->estado_paciente=$this->estado_paciente;
                $user->cadastroUser();        
        endif;
         else:$this->view('users/cadastro');

    endif;
        
    }
    public function Logar()
    {

        $this->view('users/login');

       
    }

}