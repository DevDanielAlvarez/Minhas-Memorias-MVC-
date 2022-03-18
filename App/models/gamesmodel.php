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
}