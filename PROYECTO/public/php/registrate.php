<?php

require_once("../../src/AutentificacionConBaseDeDatos.php");

// Comprueba se el correo tiene '@' y '.'
function correoValido($correo) {
	if (strpos($correo, "@") && strpos($correo, ".")) {
		return true;
	}
}

// Procesa si hay que guardar datos del procesa
function procesaRegistrate() {
	$nick = "";
    $correo = "";
    $correo2 = "";
	$mdb = new AutentificacionConBaseDeDatos();
	// Se guardan los datos válidos para mostrarlos dentro del formulario si ya 
	// se han escrito antes y había alguno que no era válido.
    if (isset($_POST)) {
        if (isset($_POST["nick"]) && $mdb -> nickDisponible($_POST["nick"])) {
			$nick = $_POST["nick"];
        }
		if (isset($_POST["correo"])) {
            if (correoValido($_POST["correo"])) {
				$correo = $_POST["correo"];
				if (isset($_POST["correo2"])) {
					if ($_POST["correo"] == $_POST["correo2"]) {
						$correo2 = $_POST["correo2"];
					}
				}
			}
        }
	}
	mostrarHtml($nick, $correo, $correo2);

}
// Muestra la pagina html
function mostrarHtml(string $nick, string $correo, string $correo2) {
	$autofocus1 = "autocus";
	$autofocus2 = "";
	$autofocus3 = "";
	$autofocus4 = "";
	if ($nick == "") {
		$autofocus1 = "autofocus";
	} elseif ($correo == "") {
		$autofocus2 = "autofocus";
	} elseif ($correo2 == "") {
		$autofocus3 = "autofocus";
	} else {
		$autofocus4 = "autofocus";
	}

	echo '
    <div class="contenedor">
		<div class="tarjeta">
			<div class="cabecera">
				<h3>Regístrate</h3>
			</div>
				<form action="../php/registrate.php" method="POST" class="formulario">
					<div class="grupo">
						<img src="../img/user.png" class="icono">
						<input type="text" class="input" placeholder="nick" name="nick" value="'.$nick.'" required '.$autofocus1.'>
					</div>
					<div class="grupo">
                        <img src="../img/correo.png" class="icono">
						<input type="text" class="input" placeholder="correo" name="correo" value="'.$correo.'" required '.$autofocus2.'>
					</div>
					<div class="grupo">
                        <img src="../img/correo.png" class="icono">
						<input type="text" class="input" placeholder="repite el correo" name="correo2" value="'.$correo2.'" required '.$autofocus3.'>
					</div>
					<div class="grupo">
                        <img src="../img/llave.png" class="icono">
						<input type="password" class="input" placeholder="contraseña" required" '.$autofocus4.'>
					</div>
					<div class="grupo">
                        <img src="../img/llave.png" class="icono">
						<input type="password" class="input" placeholder="repetir contraseña" required">
					</div>
					<div class="grupo contenedor_boton">
						<input type="submit" value="Registro" class="boton">
					</div>
				</form>
		</div>
    ';
}

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/registrate.css">
	<title>Registrate</title>
</head>
<body>

    <?php
        procesaRegistrate();
    ?>

	<!-- Esta comentado por que aparece en la parte de abajo de la pantalla
		rn vez de en el cuadro informativo que aparecia antes
	<div id="pswd_info">
	    <img src="../img/ejemplo.png">
	    <h5>La contraseña debe cumplir estos requisitos:</h5>
	    <ul>
		    <li id="letter" class="invalid">Necesita al menos <strong> una letra</strong>
		    </li>
		    <li id="capital" class="invalid">Necesita al menos <strong> una letra mayúscula</strong></li>
		    <li id="number" class="invalid">Necesita al menos <strong> un número</strong></li>
		    <li id="length" class="invalid">Necesita al menos <strong> 8 caracteres</strong></li>
	    </ul>
	</div> -->
</div>
</body>
</html>
