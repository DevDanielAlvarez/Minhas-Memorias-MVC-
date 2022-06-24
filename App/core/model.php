<?php
namespace App\Core;

use Exception;
use PDOException;

class Model
{
    private static $instance;

    public static function getConn()
    {
        if(!isset(self::$instance)):
            try
            {
<<<<<<< HEAD
             self::$instance= new \PDO ('mysql:host=localhost;dbname=teste22;charset=utf8mb4','root','root');
=======
             self::$instance= new \PDO ('mysql:host=localhost;dbname=memoria_banco;charset=utf8mb4','root','root');
>>>>>>> 49e019eed2b11423c6a2bdac6616d0a6b8b0ade6
            }
            catch(PDOException $e)
            {
                return "<h1>Ocorreu um erro com a conexão com o banco de dados do sistema : $e</h1>";
            }
            catch(Exception $e)
            {
                return "<h1>Ocorreu um erro com a conexão com o banco de dados do sistema: $e</h1>";
            }
        endif;
        return self::$instance;
    }
}