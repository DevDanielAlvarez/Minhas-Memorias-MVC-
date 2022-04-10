<?php
use App\Core\Controller;
use App\Core\Model;

Class family_model extends Controller
{
public function cadastrar_familiar($name,$email,$dt,$senha,$cd_parent)
{
    // verifica se o familiar já existe no sistema
    $stmt=Model::getConn()->prepare('select nm_familiar from tb_familiar fam join tb_contato ctt on ctt.cd_familiar=fam.cd_familiar where ctt.nm_email=?');
    $stmt->bindValue(1,$email);
    $stmt->execute();
    $result_row=$stmt->rowCount();

    if($result_row!=0)
    {
        echo "O email já está em uso";
        
    }
    else{
    // verifica se o familiar ja tem paciente
        $stmt=Model::getConn()->prepare('select fam.cd_familiar from tb_familiar fam where cd_paciente=?;');
        $stmt->bindValue(1,$_SESSION['id_paciente']);
        $stmt->execute();
        $result_row=$stmt->rowCount();

        if($result_row!=0)
        {
            echo "Este paciente já possui um familiar";
        }

        else
        {   //tratamento
            try
            {
                //password hash 
                $senha= password_hash($senha,PASSWORD_DEFAULT);

                // insert into tb_familiar
                $stmt=Model::getConn()->prepare('INSERT into tb_familiar (nm_familiar,nm_senha,dt_nascimento,cd_parentesco,cd_paciente) values (?,?,?,?,?)');
                $stmt->bindValue(1,$name);
                $stmt->bindValue(2,$senha);
                $stmt->bindValue(3,$dt);
                $stmt->bindValue(4,$cd_parent);
                $stmt->bindValue(5,$_SESSION['id_paciente']);
                

                // insert into tb_contato 
                if($stmt->execute())
                {
                    $id=Model::getConn()->lastInsertid();
                    $stmt=Model::getConn()->prepare('INSERT into tb_contato (nm_email,cd_familiar) VALUES (?,?)');
                    $stmt->bindValue(1,$email);
                    $stmt->bindValue(2,$id);
                    $stmt->execute();
                    echo "o familiar foi registrado com sucesso";
                }
            }
            //tratamento
            catch(PDOException $e){echo "erro no servidor, por favor tente novamente mais tarde";}
            
        }
    }             
}


}