<?php
use App\Core\Controller;
use App\Core\Model;

Class gamesmodel extends Controller
{
 
    public function rankview()
    {
        $stmt=Model::getConn()->query("select * from vw_memorizacao");
       
        $result=$stmt->fetchall(PDO::FETCH_ASSOC);
        return $result;
    }
    public function model_save_save_game($cd_jogo,$contador,$contador_erros)
    {
        $stmt=Model::getConn()->prepare('INSERT into tb_jogo_paciente (cd_jogo,cd_paciente,num_pontuacao,dt_partida,num_erros) VALUES (?,?,?,NOW(),?)');
        $stmt->bindValue(1,$cd_jogo);
        $stmt->bindValue(2,$_SESSION['id_paciente']);
        $stmt->bindValue(3,$contador);
        $stmt->bindValue(4,$contador_erros);
        if($stmt->execute())
        {
            return 1;
        }
       
    }
}