<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="Js/js.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/registrate.css">
	<title>Registrate</title>
</head>
<body>
	<div class="contenedor">
		<div class="tarjeta">
			<div class="cabecera">
				<h3>Regístrate</h3>
			</div>
				<form action="../php/procesaToken.php" method="POST" class="formulario">
					<div class="grupo">
                        <img src="../img/correo.png" class="icono">
						<input type="text" class="input" placeholder="correo" name="correo">
					</div>
					<div class="grupo">
                        <img src="../img/correo.png" class="icono">
						<input type="text" class="input" placeholder="repite el correo">
					</div>
					<div class="grupo">
                        <img src="../img/user.png" class="icono">
						<input type="text" class="input" placeholder="nickname">
					</div>
					<div class="grupo">
                        <img src="../img/llave.png" class="icono">
						<input type="password" class="input" placeholder="contraseña">
					</div>
					<div class="grupo">
                        <img src="../img/llave.png" class="icono">
						<input type="password" class="input" placeholder="repetir contraseña">
					</div>
					<div class="grupo contenedor_boton">
						<input type="submit" value="Registro" class="boton">
					</div>

				</form>
		</div>

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
