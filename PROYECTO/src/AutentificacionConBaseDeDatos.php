<?php
//NO funciona el requiere
//require_once('../config/bd_config.php');

$db_user = 'administrador';
$db_pass = '1234';
$db_name = 'musick';

class AutentificacionConBaseDeDatos
{
    private $dbPDO;

    public function __construct()
    {
        global $db_user;
        global $db_pass;
        global $db_name;

        try {

            $this->dbPDO = new PDO(
              "mysql:host=localhost;dbname=$db_name",
              $db_user,
              $db_pass
            );

        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function existe(string $user, string $pass): bool
    {
        try {

            $sentenciaSQL = $this->dbPDO->query("SELECT * FROM Usuario WHERE alias = '$user' AND contrasena = '$pass'");
            $resultado = $sentenciaSQL->fetchAll();
            print_r($resultado);
            return (count($resultado) == true);

        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }

    public function __destruct()
    {
        $this->dbPDO = null;
    }
}

?>
