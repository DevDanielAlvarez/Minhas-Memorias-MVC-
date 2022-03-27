<?php
namespace App;
use App\Core\Model;
class Auth
{
    #realiza o login (método chamado pelo App/Controllers/users.php)
    public static function login($email,$senha)
    {
        $sql="select nm_email,nm_senha,nm_paciente,tb_pac.cd_paciente from tb_contato tb_ctt inner join tb_paciente tb_pac on tb_ctt.cd_paciente=tb_pac.cd_paciente where nm_email= ?";
        $stmt= Model::getConn()->prepare($sql);
        $stmt->bindValue(1,$email);
        $stmt->execute();
        $resultado= $stmt->fetch(\PDO::FETCH_ASSOC);
            if($stmt->RowCount()>=1):
            if(password_verify($senha,$resultado['nm_senha']
            )):
                $_SESSION['logado']=true;
                $_SESSION['nome']=$resultado['nm_paciente'];
                $_SESSION['id_paciente']=$resultado['cd_paciente'];
                echo "true";
            else:echo "senha incorreta";
        endif;



        else: echo "usuário não encontrado";
    endif;
        
    }
    #destroi todas as sessões (desloga o user)
    public static function logout()
    {
        session_destroy();
        header('Location:/home/index');
    }
    #verifica se o usuario está logado
    public static function CheckLogin()
    {
        if(!isset($_SESSION['logado'])):
            header("Location: /users/logar");
        endif;
    }





}