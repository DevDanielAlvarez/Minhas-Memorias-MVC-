<?php
use App\Core\Controller;
use App\Core\Model;

Class userDao extends Controller
{
    protected function cadastroUser($nome_paciente,$telefone_paciente,$dt_paciente,$email_paciente,$patologia_paciente,$estado_paciente,$senha1_paciente)
    {
        $sql="INSERT into tb_users (nm_nome,tel_telefone,dt_nascimento,email,coborbidade,estado) VALUES (?,?,?,?,?,?);";
        $stmt= Model::getConn()->prepare($sql);
        $stmt->bindParam(1,);
        $stmt->bindParam(2,);
        $stmt->bindParam(3,);
        $stmt->bindParam(4,);
        $stmt->bindParam(5,);
        $stmt->bindParam(6,);
        #senha rash (cadastrar sem o uso do md5 do mysql);

    }
}


?>