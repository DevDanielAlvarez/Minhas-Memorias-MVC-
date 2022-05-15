<?php
namespace App;
use App\Core\Model;
class Auth
{
    #realiza o login (método chamado pelo App/Controllers/users.php)
    public static function login($email,$senha,$tipo_user)
    {
        if($tipo_user=="user"){
                    $sql="select nm_email,nm_senha,nm_paciente,tb_pac.cd_paciente from tb_contato tb_ctt inner join tb_paciente tb_pac on tb_ctt.cd_paciente=tb_pac.cd_paciente where nm_email= ?";
                    $stmt= Model::getConn()->prepare($sql);
                    $stmt->bindValue(1,$email);
                    $stmt->execute();
                    $resultado= $stmt->fetch(\PDO::FETCH_ASSOC);
                        if($stmt->RowCount()>=1):
                        if(password_verify($senha,$resultado['nm_senha']
                        )):
                        if(isset($_SESSION['id_familiar']))
                         {
                        unset( $_SESSION['id_familiar']);
                        }
                            $_SESSION['logado']=true;
                            $_SESSION['nome']=$resultado['nm_paciente'];
                            $_SESSION['id_paciente']=$resultado['cd_paciente'];
                            echo "true_paciente";
                        else:echo "senha incorreta";
                    endif;



                    else: echo "usuário não encontrado";
                endif;
           
        }
        //precisa-se criar a session user pra saber qual e o usuario desse carinha
        else if($tipo_user=="familiar")
        {
            $stmt= Model::getConn()->prepare("select tb_fam.cd_paciente,nm_email,nm_senha,nm_familiar,tb_fam.cd_familiar from tb_contato tb_ctt inner join tb_familiar tb_fam on tb_ctt.cd_familiar=tb_fam.cd_familiar where nm_email= ?");
            $stmt->bindValue(1,$email);
            $stmt->execute();
            $resultado= $stmt->fetch(\PDO::FETCH_ASSOC);
                if($stmt->RowCount()>=1):
                if(password_verify($senha,$resultado['nm_senha']
                )):
                    if(isset( $_SESSION['id_paciente']))
                    {
                        unset( $_SESSION['id_paciente']);
                    }
                  
                    $_SESSION['logado']=true;
                    $_SESSION['nome']=$resultado['nm_familiar'];
                    $_SESSION['id_familiar']=$resultado['cd_familiar'];
                    $_SESSION['id_paciente_do_familiar']=$resultado['cd_paciente'];
                    echo "true_familiar";
                else:echo "senha incorreta";
            endif;



            else: echo "usuário não encontrado";
        endif;

            
        }
        
    }
    #destroi todas as sessões (desloga o user)
    public static function logout()
    {
        session_destroy();
        header('Location:/home/index');
    }
    #verifica se o usuario está logado
    public static function CheckLogin()
    {
        if(!isset($_SESSION['logado'])):
            header("Location: /users/logar");
        endif;
    }
    public static function check_if_is_user()
    {
        if(!isset( $_SESSION['id_paciente']))
        {
            header("Location: /users/logar");
        }
    }
    public static function check_if_is_family()
    {
        if(!isset( $_SESSION['id_familiar']))
        {
            header("Location: /users/logar");
        }
    }





}