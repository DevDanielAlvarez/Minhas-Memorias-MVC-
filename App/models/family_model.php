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

    public function count_of_all_notes($cd_paciente)
    {
      $sql=Model::getConn()->prepare('select count(cd_notes) from tb_notes where cd_paciente=?');
      $sql->bindValue(1,$cd_paciente);
      $sql->execute();
      $result=$sql->fetch(PDO::FETCH_ASSOC);
      return $result;
    }   
    public function count_avg_in_games()
    {
        $sql=Model::getConn()->prepare("select format(avg(num_pontuacao),1) as media from tb_jogo_paciente where cd_paciente=?");
        $sql->bindValue(1,$_SESSION['id_paciente_do_familiar']);
        $sql->execute();
        $result=$sql->fetch(PDO::FETCH_ASSOC);
        
        return $result;
    }
    public function get_number_all_galery()
    {
        $sql=Model::getConn()->prepare('select count(cd_galeria) as fotos from tb_galeria where cd_paciente=?');
        $sql->bindValue(1,$_SESSION['id_paciente_do_familiar']);
        $sql->execute();
        $result=$sql->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    public function Model_get_information_of_family_dashboard_menu()
    {
        $sql=Model::getConn()->prepare('select nm_paciente,nm_jogo,num_pontuacao,num_erros,dt_partida
        from tb_jogo_paciente tb_jp join tb_paciente pac on pac.cd_paciente=tb_jp.cd_paciente join tb_jogos jg on jg.cd_jogo= tb_jp.cd_jogo where tb_jp.cd_paciente = ? ORDER BY cd_jogo_paciente desc');
        $sql->bindValue(1,$_SESSION['id_paciente_do_familiar']);
        $sql->execute();
        $result=$sql->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    public function Model_get_information_of_analytics_dasborad_family_menu()
    {
        /* Start First Graphic*/ 
        // get_info_mount_january
        $january=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-01-01','2022-01-30',?);");
        $january->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $january->execute();
        
        $fevereiro=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-02-01','2022-02-28',?);");
        $fevereiro->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $fevereiro->execute();

        $marco=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-03-01','2022-03-30',?);");
        $marco->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $marco->execute();

        $abril=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-04-01','2022-04-30',?);");
        $abril->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $abril->execute();

        $maio=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-05-01','2022-05-30',?);");
        $maio->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $maio->execute();
        
        $junho=Model::getConn()->prepare("select QTD_PONTOS_ENTRE('2022-06-01','2022-06-30',?);");
        $junho->BindValue(1,$_SESSION['id_paciente_do_familiar']);
        $junho->execute();



        $mounts=[
            'janeiro'=> $january->fetchAll(PDO::FETCH_ASSOC),
            'fevereiro'=> $fevereiro->fetchAll(PDO::FETCH_ASSOC),
            'março'=>$marco->fetchAll(PDO::FETCH_ASSOC),
            'abril'=>$abril->fetchAll(PDO::FETCH_ASSOC),
            'maio'=>$maio->fetchAll(PDO::FETCH_ASSOC),
            'junho' =>$junho->fetchAll(PDO::FETCH_ASSOC)
        ];
       
        return $mounts;
    }
}