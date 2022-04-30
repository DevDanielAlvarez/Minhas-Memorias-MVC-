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
    public function upload()
    {
        $this->view('galery/upload',$data=['sty'=>"https://cdn.jsdelivrt/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/galery_css/upload.scss"]);
    }

    public function ver()
    {
        html_components::nav_bar();
        $this->view('galery/galeria',$data=['sty'=>"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",'sty2'=>URL_BASE."/css/galery_css/main.css"]);
    }

    public function upload_archive()
    {
        if(!empty($_POST['title'])){
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
                   if($upload_model->save_file_upload($_POST['title'],'http://localhost:8080/uploads/'.$new_name))
                   {
                    echo "sucesso";
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