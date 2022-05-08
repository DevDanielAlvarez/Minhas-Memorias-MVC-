<?php
#chamando classes padrão para manipulação de dados
use App\Core\controller;
use App\Core\Model;
use App\Auth;
use App\components_html;
use App\components\html_components;
use LDAP\Result;

class galeria extends controller
{
    public function index()
    {
        $this->ver();
    }
    public function upload()
    {
        html_components::nav_bar();
        $this->view('galery/upload',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/galery_css/upload.css"]);
    }

    public function ver()
    {
        $model_upload=$this->model('upload_model');
        $data_photos=$model_upload->get_all_info_for_photos_galery_for_user();
       

        html_components::nav_bar();
        $this->view('galery/galeria',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/galery_css/main.css"],$data2=$data_photos);
    }

    public function upload_archive()
    {
        if(!empty($_POST['title']) and !empty($_POST['descricao'])){
        var_dump( $_FILES);
        if(isset($_FILES['arquivo']['name']) && !empty($_FILES['arquivo']['name'])){
        $formatos= array("png","jpeg","jpg","gif");
        $extension=pathinfo($_FILES['arquivo']['name'], PATHINFO_EXTENSION);
            if(in_array($extension,$formatos))
            {
                $folder="uploads/";
                $temp= $_FILES['arquivo']['tmp_name'];
                $new_name= uniqid().".$extension";
                if(move_uploaded_file($temp,$folder.$new_name))
                {
                    $upload_model= $this->model('upload_model');
                   if($upload_model->save_file_upload($_POST['title'],'http://localhost:8080/uploads/'.$new_name,$_POST['descricao']))
                   {
                       header('Location: /galeria/ver');
                   }
                    
                }
                else
                {
                    echo "nao foi possivel fazer o upload";
                }
            }
            else
            {
                echo "formato não permitido";
            }

        }
        else
        {
            echo"error";
        }
    }
    }


}