<?php
use App\Core\Controller;
use App\Core\Model;

Class user extends Controller
{

    public function cadastroUser()
    {
        try
        {    #cadastro do paciente
            $sql="INSERT into tb_paciente (nm_paciente,nm_senha) VALUES (?,?);";
            $stmt= Model::getConn()->prepare($sql);
            $stmt->bindValue(1,$this->nome_cadastro);
            $stmt->bindValue(2,$this->senha1_cadastro);
            $stmt->execute();
            $id=Model::getConn()->lastInsertid();

           
            $stmt=Model::getConn()->prepare("INSERT INTO tb_contato (cd_contato,tel_contato,nm_email) VALUES (?,?,?)");
            $stmt->bindValue(1,$id);
            $stmt->bindValue(2,$this->telefone_cadastro);
            $stmt->bindValue(3,$this->email_cadastro);
            $stmt->execute();


   
            
 
            

            echo "$id.Sucesso ao cadastrar";
            #senha rash (cadastrar sem o uso do md5 do mysql);
        }
        catch(Exception $error)
        {
            return "Erro ao cadastrar o usuário"; exit();
        }

    }


}


?>