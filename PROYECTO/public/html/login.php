<?php
session_status();
if(isset($_SESSION['logeado'])){
	if($_SESSION['logeado'] == true){
		header('location:principal.html');
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>

	  <meta charset="UTF-8">
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Iniciar sesión</h3>
				<!--<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>-->
			</div>
			<div class="card-body">
				<form action="../php/procesaLogin.php" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><img src="../img/user.png" class="iconos"></span>
						</div>
						<input type="text" name="alias" class="form-control" placeholder="nickname" required>
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><img src="../img/llave.png" class="iconos"/></span>
						</div>
						<input type="password" name="contrasena" class="form-control" placeholder="contraseña" required>
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox" name='recuerdame'>Recuérdame
					</div>
					<div class="form-group">
						<input type="submit" name="enviar" value="Login" class="btn float-right login_btn">
						<!-- La linea de abajo hay que borrarla, solo esta puesta para trampear el login y se redirija a la pagina principal sin autentificacion -->
						<a href="principal.html" class="enlaces"></a>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					¿Todavía no tienes cuenta?<a href="../php/registrate.php" class="enlaces">Regístrate</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#" class="enlaces">¿Has olvidado tu contraseña?</a>
				</div>
			</div>

		</div>
	</div>
</div>
</body>
</html>
