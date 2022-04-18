<?php
use App\Core\Controller;
use App\Core\Model;
use App\Auth;
use App\components\html_components;

Class bloco_model extends Controller
{
    //pega todas as infos dos blocos do user
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

    public function update_notepad($title,$text,$cd_notes)
    {
        $stmt=Model::getConn()->prepare('update tb_notes set nm_titulo=?,txt_note=? where cd_notes=?');
        $stmt->bindValue(1,$title);
        $stmt->bindValue(2,$text);
        $stmt->bindValue(3,$cd_notes);
        $stmt->execute();

        //caso precise da information of success 
        return true;
    }

    public function verify_notepad($title,$text,$cd_notes)
    {
        //verifi ambuiguis,
        $stmt=Model::getConn()->prepare('select * from tb_notes where nm_titulo=? and txt_note=? and cd_notes=?');
        $stmt->bindValue(1,$title);
        $stmt->bindValue(2,$text);
        $stmt->bindValue(3,$cd_notes);
        $stmt->execute();
        

        $result= $stmt->rowCount();
        if($result==1)
        {
            return 1;
        }
        else{return 0;}
    }
    
    public function search_notepad($title,$text)
    {
        $stmt=Model::getConn()->prepare("select cd_notes from tb_notes where nm_titulo=? and txt_note=? and cd_paciente=?");
        $stmt->bindValue(1,$title);
        $stmt->bindValue(2,$text);
        $stmt->bindValue(3,$_SESSION['id_paciente']);
        $row=$stmt->execute();
        if($row->rowCount()==1)
        {
            $data_of_note=$stmt->fetch(PDO::FETCH_ASSOC);
            return $data_of_note;
        }
        else{return false;}

    }
}