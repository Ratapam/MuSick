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

    //Funcion que comprueba si existe un usuario en la base datos cuando se logea
    //  - Debuelve el id_usuario si esta logeado para utilizarlo en $_SESSION
    //  - Si no existe en la base de datos devuelve false.
    public function existeUsuario(string $user, string $pass)
    {
        try {
            $sentenciaSQL = $this->dbPDO->query("SELECT * FROM Usuario WHERE nick = '$user' AND contrasena = '$pass'");
            $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);
            
            if(count($resultado) == true){
                return $resultado[0]['id_usuario'];
            }
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }


    // Funcionn que inserta un token de tipo recuerdame cuando el usuario se logea y pulsa el check 
    // de recuerdame.
    // la fecha se introduce con now() , debemos implemetar un script que borre los campos
    // de las cookie con tipo recuerdame con el la fecha que creamos conveniene o en este caso
    // al ser las cookie de recuerdame podrian quedarse hasta que el usuario pulse cerrar sesion.

    public function insertToken( $id_usuario,  $tipo,  $token) {
     
        try {
            $sentencia = $this -> dbPDO -> prepare("INSERT INTO Token (id_usuario, tipoToken,
             token,fecha_expira) VALUES (:id_usuario, :tipoToken, :token,now());");
            $sentencia -> bindParam(':id_usuario', $id_usuario);
            $sentencia -> bindParam(':tipoToken', $tipo);
            $sentencia -> bindParam(':token', $token);
            $sentencia -> execute();
           // $usuarioBD = null;
        } catch (PDOException $excepcion) {
            echo "</br>¡Error!: ".$excepcion -> getMessage()."</br>";
            die();
        }
    }



    //Funcion que compara el token y el id de la cookie recuerdame con la base datos


    public function compruebaCookieRecuerdame($id,$token){
        try {
            $sentenciaSQL = $this->dbPDO->query("SELECT * FROM token 
            WHERE id_usuario = $id
              AND tipoToken='recuerdame'");
            $sentenciaSQL -> execute();
            $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);
            print_r($resultado);
            if(count($resultado)>0 && strcmp($token, $resultado[0]['token'] == 0)){
                
                return true;
            }else{
                return false;
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
