<?php
session_start(); 
if(isset($_SESSION['logeado'])){
  if($_SESSION['logeado'] == true){
    header('location: ../html/principal.php');
  }else {
  header('Location: ../php/login.php?redirigido=0');
  die();
  }
}
require_once('../../src/AutentificacionConBaseDeDatos.php');
require_once('../../resources/generarToken.php');
//trata loss datos introducidos en el formulario
function clean_input($data) {
  	$data = trim($data);
  	$data = stripslashes($data);
  	$data = htmlspecialchars($data);
  	return $data;
}

$alias ="";
$contrasena = "";
$alias = clean_input($_POST['alias']);
$contrasena = clean_input($_POST['contrasena']);
$mdb = new AutentificacionConBaseDeDatos();
$id_usuario = $mdb->existeUsuario($alias, $contrasena);

//Si la respuesta de la consulta nos devuelve su id 
//accede al if si devuelve false se va al else
if ($id_usuario != false){
    //Si introduce bien su alias y su contrasena, recuperamos el id_usuario 
    // de la consulta y creamos una sesion con una posicion loegeado y otra con su id 
    // y le redirigemos a la pagina principal.
    if(!isset($_SESSION['id'])){
      $_SESSION['id'] = $id_usuario;
      $_SESSION['logeado'] = true;
        // Si pulsa el checck de recuerdame, creamos una cookie con su id y un token
        // serializados que contrastaremos con la base dedatos cuando quiera volver a acceder
        // a la base de datos
        if(isset($_POST['recuerdame'])){         
          $token = generateToken();
          $tipo = "recuerdame";
          echo $id_usuario;
          echo "<pre>";
          print_r($_POST);
          echo "</pre>";
          //die();
          
          $mdb-> insertToken($id_usuario, $tipo, $token);
          $arrRecuerdame = [];
          $arrRecuerdame ['id_usuario'] = $id_usuario;
          $arrRecuerdame ['token'] = $token;
          $arrRecuerdame  = serialize($arrRecuerdame);

         //El tiempo esta puesto provisionalmente para un dia
          setcookie("recuerdame",$arrRecuerdame,time() + 3600,"/");
          
        }
    header('Location: ../html/principal.php');
    die();
    }
          
  } else {
    header('Location: ../php/login.php?redirigido=0');
    die();
}

?>
