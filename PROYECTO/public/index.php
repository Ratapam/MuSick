<?php 
session_start();
require_once('../src/AutentificacionConBaseDeDatos.php');

if(isset($_COOKIE['recuerdame']) || isset($_SESSION['logeado'])){

        if(isset($_COOKIE['recuerdame'])){
            $arrRecuerdame = $_COOKIE['recuerdame'];
            $arrRecuerdame = unserialize($arrRecuerdame);
            $id_usuario = $arrRecuerdame['id_usuario'];
            $token = $arrRecuerdame['token'];
            $db = new AutentificacionConBaseDeDatos();
            $resultado = $db -> compruebaCookieRecuerdame($id_usuario,$token);

            if($resultado){
              //Si la cookie es buena , aprovechamos el id_usuario que contenia
              // para  introducirlo en la sesion
                $_SESSION['id'] = $id_usuario;
                $_SESSION['logeado'] = true;
              
                header('location: html/principal.php');
                die();
            }else{
                header('location: php/login.php');
                die();
            }
        }elseif(isset($_SESSION['logeado'])){
            echo"hola";
                die();
            if($_SESSION['logeado'] === true){
                

                header('location: html/principal.php');
                die();
            }else{
                header('location: php/login.php');
                die();
            }
        }

      
} elseif (isset($_GET['token']) && isset($_GET['id_usuarioNC'])) {
    if ($db -> comprobarToken($_GET['token'], $_GET['id_usuarioNC'])) {
        $usuarioNC = $db -> obtenerUsuarioNC($_GET['id_usuarioNC']);
        $db -> borrarToken($_GET['id_usuarioNC']);
        $db -> borrarUsuarioNC($_GET['id_usuarioNC']);
        $db -> guardarUsuario($usuarioNC[0]['nombreNC'], $usuarioNC[0]['contrasenaNC'], $usuarioNC[0]['emailNC']);
        $_SESSION['logueado'] = true;
    } 
} else {
    header('location: php/login.php');
     die();
}

?>