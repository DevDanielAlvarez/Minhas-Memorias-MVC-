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
}