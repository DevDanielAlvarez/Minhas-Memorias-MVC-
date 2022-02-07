<?php
namespace App;
use App\Core\Model;
class Auth
{
    public static function login($email,$senha)
    {
        $sql="SELECT * FROM where email=? ";
        $stmt= Model::getConn()->prepare($sql);
        $stmt->bindValue(1,$email);
        $stmt->execute();
        $resultado= $stmt->fetch(\PDO::FETCH_ASSOC);
        if($resultado->RowCount()==1):
            if(password_verify($senha,$resultado['senha'])):
                $_SESSION['logado']=true;
            else:return "senha incorreta";
        endif;



        else: echo  "user nao encontrado";
    endif;
        
    }






}