<?php
namespace App;
use App\Core\Model;
class Auth
{
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






}