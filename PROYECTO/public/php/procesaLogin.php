<?php

require_once('../../src/AutentificacionConBaseDeDatos.php');

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

if ($mdb->existeUsuario($alias, $contrasena)){
  	//Si introduce bien su alias y su contrasena, creamos una sesion
  	// y le redirigemos a la pagina principal.
    session_name("id");
    session_start();
    if(!isset($_SESSION['id'])){
      $_SESSION['id'] = $id;
      $_SESSION['logeado'] = true;
    }
    session_write_close();
    header('Location: principal.php?redirigido=1');
    exit;
} else {
    header('Location: ../html/login.php?redirigido=0');
}

?>
