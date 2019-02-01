<?php 
session_start();
require_once('../src/AutentificacionConBaseDeDatos.php');
if(isset($_COOKIE['recuerdame'])){
    $arrRecuerdame = $_COOKIE['recuerdame'];
    $arrRecuerdame = unserialize($arrRecuerdame);
    $id = $arrRecuerdame['id'];
    $token = $arrRecuerdame['token'];
    $db = new AutentificacionConBaseDeDatos();
    $resultado = $db -> compruebaCookieRecuerdame($id,$token);
    if($resultado){
        $_SESSION['id'] == $resultado;
        $_SESSION['logeado'] == true;
        header('location:public/php/principal.php');
        die();
    }else{
        header('location:html/login.php');
        die();
    }

}else{
    header('location:html/login.php');
    die();
}

if(isset($_SESSION['logeado'])){
	if($_SESSION['logeado'] == true){
        header('location:php/principal.php');
        die();
	}else{
        header('location:html/login.php');
        die();
    }
}else{
    header('location:html/login.php');
    die();
}

?>