<?php
use App\Core\Controller;
use App\Core\Model;

Class user extends Controller
{

    public function cadastroUser()
    {
        try
        {    #cadastro do paciente
            $sql="INSERT into tb_paciente (nm_paciente,nm_senha,dt_nascimento) VALUES (?,?,?);";
            $stmt= Model::getConn()->prepare($sql);
            $stmt->bindValue(1,$this->nome_cadastro);
            $stmt->bindValue(2,$this->senha1_cadastro);
            $stmt->bindValue(3,$this->date_cadastro);
            $stmt->execute();
            $id=Model::getConn()->lastInsertid();
            
           
            $stmt=Model::getConn()->prepare("INSERT INTO tb_contato (tel_contato,nm_email,cd_paciente) VALUES (?,?,?)");

            $stmt->bindValue(1,$this->telefone_cadastro);
            $stmt->bindValue(2,$this->email_cadastro);
            $stmt->bindValue(3,$id);
            $stmt->execute();
            echo "Sucesso ao cadastrar";
            #senha rash (cadastrar sem o uso do md5 do mysql);
        }
        catch(Exception $error)
        {
            return "Erro ao cadastrar o usuário"; exit();
        }

    }

    public function get_all_info_user()
    {
        if(isset($_SESSION['logado'])){
        $stmt=Model::getConn()->prepare("select nm_paciente,ds_resumo,nm_genero,nm_email from tb_paciente pac join tb_contato ctt on ctt.cd_paciente=pac.cd_paciente join tb_genero gen on gen.cd_genero=pac.cd_genero where pac.cd_paciente=?");
        $stmt->bindValue(1, $_SESSION['id_paciente']);
        $stmt->execute();
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        return $result;
        
        }
    }

    public function update_user(){}


}


?>