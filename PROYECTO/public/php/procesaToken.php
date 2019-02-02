<?php

require_once("../../src/AutentificacionConBaseDeDatos.php");

echo '<pre>';
print_r($_GET);
echo '</pre>';

$conexion = new AutentificacionConBaseDeDatos();
if (isset($_GET['token']) && isset($_GET['id_usuarioNC'])) {
    echo "uno";
    if ($conexion -> comprobarToken($_GET['token'], $_GET['id_usuarioNC'])) {
        echo "dos";
        $usuarioNC = $conexion -> obtenerUsuarioNC($_GET['id_usuarioNC']);
        $conexion -> borrarToken($_GET['id_usuarioNC']);
        $conexion -> borrarUsuarioNC($_GET['id_usuarioNC']);
        $conexion -> guardarUsuario($usuarioNC[0]['contrasenaNC'], $usuarioNC[0]['nombreNC'], $usuarioNC[0]['emailNC']);
        $_SESSION['nombre'] = $usuarioNC[0]['nombreNC'];
        header('Location: login.php');
        die();
    }
} else {
    echo "El token no es válido.";
}

?>