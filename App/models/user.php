<?php
use App\Core\Controller;
use App\Core\Model;

Class user extends Controller
{

    public function cadastroUser()
    {
        try
        {    #cadastro do paciente
            $sql="INSERT into tb_paciente (nm_nome,tel_telefone,dt_nascimento,email,patologia,estado,senha) VALUES (?,?,?,?,?,?,?);";
            $stmt= Model::getConn()->prepare($sql);
            $stmt->bindValue(1,$this->nome_paciente);
            $stmt->bindValue(2,$this->telefone_paciente);
            $stmt->bindValue(3,$this->dt_paciente);
            $stmt->bindValue(4,$this->email_paciente);
            $stmt->bindValue(5,$this->patologia_paciente);
            $stmt->bindValue(6,$this->estado_paciente);
            $stmt->bindValue(7,$this->senha1_paciente);
            $stmt->execute();
            #se o comando der true, pegar o id do user que acaba de ser cadastrado, afim de linkar este id ao familiar
            if($stmt->execute()):
                $sql='select id from tb_paciente where email=?';
                $stmt= Model::getConn()->prepare($sql);
                $stmt->bindValue(1,$this->email_paciente);
                $stmt->execute();
                $resultado=$stmt->fetch(\PDO::FETCH_ASSOC);
                $id=$resultado['id'];
                echo $id; 
                /*-----------------------------
                #Com o id do user fazer o insert do familiar, junto ao campo ('id_paciente'); 
                -------------------------------*/
                
            endif;

            return "Sucesso ao cadastrar";
            #senha rash (cadastrar sem o uso do md5 do mysql);
        }
        catch(Exception $error)
        {
            return "Erro ao cadastrar o usuário"; exit();
        }

    }


}


?>