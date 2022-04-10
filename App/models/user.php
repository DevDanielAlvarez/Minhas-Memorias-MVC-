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
            
           
            $stmt=Model::getConn()->prepare("INSERT INTO tb_contato (nm_email,cd_paciente) VALUES (?,?)");

            //$stmt->bindValue(1,$this->telefone_cadastro);
            $stmt->bindValue(1,$this->email_cadastro);
            $stmt->bindValue(2,$id);
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
        
            //gambiarra temporaria
        $stmt=Model::getConn()->prepare("select nm_familiar from tb_familiar where cd_paciente=?;");
        $stmt->bindValue(1,$_SESSION['id_paciente']);
        $stmt->execute();
        $result_row=$stmt->rowCount();
        if($result_row==1)
        {
            $nome_familiar=$stmt->fetch(PDO::FETCH_ASSOC);
            $_SESSION['nome_familiar']=$nome_familiar['nm_familiar'];
        }
        else{$_SESSION['nome_familiar']="Não cadastrado";}



        // saida de dados
        return $result;
        }
    }

    public function update_user($name,$email,$resume,$genre)
    {
        // foi feito um update para cada campo, pois caso nao mude todos os campos ele não altera tupla (!provavel erro de logica ou falta de config sql!)

        //name
            $id_paciente=$_SESSION['id_paciente'];
            $sql=Model::getConn()->prepare("update tb_paciente set nm_paciente=? where cd_paciente=?");
            $sql->bindValue(1,$name);
            $sql->bindValue(2,$id_paciente);
            $sql->execute();

            //resume
            
            $sql=Model::getConn()->prepare("update tb_paciente set ds_resumo=? where cd_paciente=?");
            $sql->bindValue(1,$resume);
            $sql->bindValue(2,$id_paciente);
            $sql->execute();

            //genre
            
            $sql=Model::getConn()->prepare("update tb_paciente set cd_genero=? where cd_paciente=?");
            $sql->bindValue(1,$genre);
            $sql->bindValue(2,$id_paciente);
            $sql->execute();


            $stmt=Model::getConn()->prepare("update tb_contato set nm_email=? where cd_paciente=?");
            $stmt->bindValue(1,$email);
            $stmt->bindValue(2,$id_paciente);
            $stmt->execute();
    }

    public function delete_user_system()
    {
        //delete all information user in system

        // logic for deleter one (tb_paciente)
        $stmt_delete= Model::getConn()->query("");

        // logic for delete two (tb_contato)
        $stmt_delete= Model::getConn()->query("");

        // logic for delete three (tb_jogo_paciente)
        $stmt_delete= Model::getConn()->query("");

        // logic for delete four (tb_familiar)
        $stmt_delete= Model::getConn()->query("");

        // logic for delete five(tb_notes)

    }

}


?>