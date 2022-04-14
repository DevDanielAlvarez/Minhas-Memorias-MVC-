<?php
use App\Core\Controller;
use App\Core\Model;
use App\Auth;
use App\components\html_components;

Class bloco_model extends Controller
{
public function get_all_notepads_for_user()
{
    html_components::nav_bar();
    Auth::CheckLogin();
    $stmt=Model::getConn()->query('select * from tb_notes where cd_paciente='.$_SESSION['id_paciente']);
    $datas=$stmt->fetchAll(PDO::FETCH_ASSOC);
    return $datas;
}
}