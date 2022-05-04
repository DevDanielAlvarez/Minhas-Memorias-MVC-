<?php
use App\Core\Controller;
use App\Core\Model;

Class upload_model extends Controller
{

    public function save_file_upload($title,$path)
        {
            $stmt= Model::getConn()->prepare('INSERT into tb_galeria (nm_titulo,nm_caminho,cd_paciente) VALUES (?,?,?)'); 
            $stmt->bindValue(1,$title);
            $stmt->bindValue(2,$path);
            $stmt->bindValue(3,$_SESSION['id_paciente']);
            if($stmt->execute())
            {
                return true;
            }
        }

    public function get_all_info_for_photos_galery_for_user()
    {
        $stmt=Model::getConn()->prepare('select nm_titulo,nm_caminho,ds_resumo from tb_galeria where cd_paciente=?');
        $stmt->bindValue(1,$_SESSION['id_paciente']);
        $stmt->execute();
        $result=$stmt->fetchall(PDO::FETCH_ASSOC);
        return $result;
    }
}