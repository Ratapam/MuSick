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
            print "¡Error!: ".$e->getMessage()."<br/>";
            die();
        }
    }

    //Funcion que compara el token y el id de la cookie recuerdame con la base datos


    public function compruebaCookieRecuerdame($id,$token){
        try {
            $sentenciaSQL = $this->dbPDO->query("SELECT id_usuario,token FROM token WHERE id_usuario = '$id' AND token = '$token
            AND tipoToken='tokenRecuerdame''");
            $resultado = $sentenciaSQL->fetchAll();
            print_r($resultado);
            if(count($resultado) == true){
                return $resultado[0]['id_usuario'];
            }else{
                return false;
            }
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }

    public function existeUsuario(string $user, string $pass)
    {
        try {
            $sentenciaSQL = $this->dbPDO->query("SELECT * FROM Usuario WHERE nick = '$user' AND contrasena = '$pass'");
            $resultado = $sentenciaSQL->fetchAll();
            
            if(count($resultado) == true){
                return $resultado[0]['id_usuario'];
            }
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }

    public function __destruct()
    {
        $this->dbPDO = null;
    }

///////////////////////////////////////////////////////////

    // Falta probar
    public function guardarUsuario(string $contrasena, string $nick, string $correo) {
        try {
            $sentencia = $this -> dbPDO -> prepare("INSERT INTO Usuario (contrasena, nick, correo) VALUES (:contrasena, :nick, :correo)");
            $sentencia -> bindParam(':contrasena', $contrasena);
            $sentencia -> bindParam(':nick', $nick);
            $sentencia -> bindParam(':correo', $correo);
            $sentencia -> execute();
            $usuarioBD = null;
        } catch (PDOException $excepcion) {
            echo "</br>¡Error!: ".$excepcion -> getMessage()."</br>";
            die();
        }
    }

    // Falta probar
    public function nickDisponible(string $nick) {
        try {
            $sentenciaSQL = $this->dbPDO->query("SELECT * FROM Usuario WHERE nick = '$nick'");
            $resultado = $sentenciaSQL -> fetchAll();
            print_r($resultado);
            return (count($resultado) == true);
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }

}

?>
