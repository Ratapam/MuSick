<?php

require_once('../AutentificacionConBaseDeDatos.php');

class Usuario
{

    private $id_usuario;
    private $nick;
	private $correo;

	public function __construct(int $id_usuario) {	
		$conexion = new AutentificacionConBaseDeDatos();
		try {
            $respuesta = $conexion -> query("SELECT * FROM Usuario WHERE id_usuario = '$id_usuario'");
			$datosUsuario = $respuesta -> fetchAll();
            // print_r($datosUsuario);
            $nick = $datosUsuario[0]['nick'];
            $correo = $datosUsuario[0]['correo'];
			// echo $id_usu;
			// echo $correo;
		} catch (PDOException $error) {
            print "¡Error!: ".$error -> getMessage()."<br/>";
            return false;
        }		
		$this -> id_usuario = $id_usuario;
		$this -> nick = $nick;
		$this -> correo = $correo;
	}

	public function __destruct() {
		$this -> nick = null;
	}

	public function __toString() {
		return "id_usuario: ".$this -> id_usuario."<br>
		nick: ".$this -> nick."<br>
		correo: ".$this -> correo;
	}
	
	public function guardarCancionEnListaDeReproduccion() {




	}

	public function guardarCancionEnEscuchadoRecientemente() {
		
	}

	public function saberUltimosEstilosEscuchados() {

	}

	public function saberUltimasCancionesEscuchadas() {

	}

	public function saberUltimosArtistasEscuchados() {

	}



    
}

?>