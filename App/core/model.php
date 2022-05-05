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
             self::$instance= new \PDO ('mysql:host=localhost;dbname=memoria_banco;charset=utf8mb4','root','root');
            }
            catch(PDOException $e)
            {
                return "<h1>Ocorreu um erro com a conexão com o banco de dados do sistema : $e<h1>";
            }
            catch(Exception $e)
            {
                return "<h1>Ocorreu um erro com a conexão com o banco de dados do sistema: $e<h1>";
            }
        endif;
        return self::$instance;
    }
}