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
        $this->view('galery/upload');
    }

    public function upload_archive()
    {
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
                    echo "sucesso";
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