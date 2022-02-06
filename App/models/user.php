<?php
use App\Core\Controller;
use App\Core\Model;

Class user extends Controller
{

    public function cadastroUser()
    {
        try
        {
            $sql="INSERT into tb_users (nm_nome,tel_telefone,dt_nascimento,email,patologia,estado,senha) VALUES (?,?,?,?,?,?,?);";
            $stmt= Model::getConn()->prepare($sql);
            $stmt->bindValue(1,$this->nome_paciente);
            $stmt->bindValue(2,$this->telefone_paciente);
            $stmt->bindValue(3,$this->dt_paciente);
            $stmt->bindValue(4,$this->email_paciente);
            $stmt->bindValue(5,$this->patologia_paciente);
            $stmt->bindValue(6,$this->estado_paciente);
            $stmt->bindValue(7,"123");
            $stmt->execute();
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