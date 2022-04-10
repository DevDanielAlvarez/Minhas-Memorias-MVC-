<?php
use App\Core\Controller;
use App\Core\Model;

Class family_model extends Controller
{
public function cadastrar_familiar($nome,$email,$dt,$senha)
{
    // verifica se o familiar já existe no sistema
    $stmt=Model::getConn()->prepare('select nm_familiar from tb_familiar where nm_email=?');
    $stmt->bindValue(1,$email);
    $stmt->execute();
    $result_row=$stmt->rowCount();

    if($result_row!=0)
    {
        echo "O email já está em uso";
        
    }
}


}