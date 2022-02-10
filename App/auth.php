<?php
namespace App;
use App\Core\Model;
class Auth
{
    #realiza o login (método chamado pelo App/Controllers/users.php)
    public static function login($email,$senha)
    {
        $sql="SELECT * FROM tb_paciente where email=? ";
        $stmt= Model::getConn()->prepare($sql);
        $stmt->bindValue(1,$email);
        $stmt->execute();
        $resultado= $stmt->fetch(\PDO::FETCH_ASSOC);
        if($stmt->RowCount()>=1):
            if(password_verify($senha,$resultado['senha'])):
                $_SESSION['logado']=true;
                $_SESSION['nome']=$resultado['nm_nome'];

                echo "true";
            else:echo "senha incorreta";
        endif;



        else: echo  "user nao encontrado";
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