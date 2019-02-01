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
              
                header('location:html/principal.php');
                die();
            }else{
                header('location:html/login.php');
                die();
            }

        }elseif(isset($_SESSION['logeado'])){
            if($_SESSION['logeado'] == true){
                header('location:html/principal.php');
                die();
            }else{
                header('location:html/login.php');
                die();
            }
        }

      
 }else{
    header('location:html/login.php');
     die();
}

?>