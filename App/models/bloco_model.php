<?php
use App\Core\Controller;
use App\Core\Model;
use App\Auth;
use App\components\html_components;

Class bloco_model extends Controller
{   //pega todas as infos dos blocos do user
    public function get_all_notepads_for_user()
    {
        Auth::CheckLogin();
        html_components::nav_bar();
        $stmt=Model::getConn()->query('select * from tb_notes where cd_paciente='.$_SESSION['id_paciente']);
        $datas=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $datas;
    }
    // pega a info de um bloco especifico desde que pertença ao user
    public function get_single_info_for_notepad($cd_notes)
    {
        
        Auth::CheckLogin();
        html_components::nav_bar();
        $stmt=Model::getConn()->prepare('select * from tb_notes where cd_notes=? and cd_paciente=?');
        $stmt->bindValue(1,$cd_notes);
        $stmt->bindValue(2,$_SESSION['id_paciente']);
        $stmt->execute();
        $datas=$stmt->fetch(PDO::FETCH_ASSOC);
        return $datas;

    }

    public function create_bloco_model($title,$text)
    {
        $stmt=Model::getConn()->prepare('INSERT into tb_notes (nm_titulo,txt_note,cd_paciente,dt_criacao) VALUES(?,?,?,NOW())');
        $stmt->bindValue(1,$title);
        $stmt->bindValue(2,$text);
        $stmt->bindValue(3,$_SESSION['id_paciente']);
        $stmt->execute();
       
    }

    
}