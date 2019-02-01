<?php
session_start();
require_once('../../src/AutentificacionConBaseDeDatos.php');

$errores=[];
if(isset($_GET[]))


if(isset($_POST['enviar'])){
  $email = $_POST['email'];
  $pass = $_POST['pass'];
  $token = $_POST['token'];
  $db = new Autentificacion();
  $comprobacion = $db -> comprobarConfirmacion($email,$pass,$token);

   if($comprobacion){
     $_SESSION["logeado"] = "si";
     session_write_close();
     //print_r($comprobacion);
     //echo "estoy en el if";
   /* $nombre = $comprobacion[0]['nombreNC'];
     $email =  $comprobacion[0]['emailNC'];
     $pass = $comprobacion[0]['contrasenaNC'];*/
     //$db -> registrarUsu($email,$nombre,$pass);
     header('location:../public/home.php');
     die();
   }else{
     $errores[] = $comprobacion;
   }
}


 ?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h3>Por favor, pulsa en aceptar para confirmar tu cuenta de usuario en <br> "Musick"</h3>

    <form class="" action="confirmarRegistro.php" method="post">
    
      <input type="hidden" name="token" value="<?=$_GET['tokenConfirmacion']?>">
      <input type="submit" name="enviar" value="Enviar">
      
    </form>
  </body>
</html>