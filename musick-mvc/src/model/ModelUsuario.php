<?php

class ModelUsuario extends BaseModel{
    protected static $lista_info = ['id_usuario','contrasena','nick','correo']; 


    function principal(){
        return"<h1>Hola</h1>";
    }

    public function home(){
		$db = App::getDB();
        // $id_usuario = $_SESSION['id_usuario'];
        $id_usuario = 1;
		$resultado = $db -> ejecutar("SELECT autor.nombre ,autor.id_autor FROM escuchado_recientemente, cancion, autor WHERE escuchado_recientemente.id_usuario = $id_usuario AND escuchado_recientemente.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor");
		return $resultado;
	}


	public function perfil(){
		$db = App::getDB();
        // $id_usuario = $_SESSION['id_usuario'];
        $id_usuario = 1;
		$resultado = $db -> ejecutar("SELECT * FROM usuario WHERE id_usuario= $id_usuario");
		return $resultado[0];
	}

    //El id lo pasaremos ataves del $_SESSION
	public function saberDatos($id_usuario) {	
		$db = App::getDB();
		$resultado = $db -> ejecutar("SELECT * FROM usuario WHERE id_usuario = $id_usuario");
		$this -> id_usuario = $resultado['id_usuario'];
		$this -> nick =  $resultado['nick'];
		$this -> correo =  $resultado['correo'];
		return $resultado;
	}

	public function __destruct() {
		$this -> nick = null;
	}

	public function saberUltimosArtistasEscuchados($id_usuario) {
		$db = App::getDB();
		$resultado = $db -> ejecutar("SELECT autor.nombre FROM escuchado_recientemente, cancion, autor WHERE escuchado_recientemente.id_usuario = $id_usuario AND escuchado_recientemente.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor");
		return $resultado;
	}

	public function __toString() {
		return "id_usuario: ".$this -> id_usuario."<br>
		nick: ".$this -> nick."<br>
		correo: ".$this -> correo;
	}

	public function saberUltimosEstilosEscuchados($id_usuario) {
			$db = App::getDB();
			$resultado = $db -> ejecutar("SELECT estilo.nombre FROM escuchado_recientemente, cancion, estilo WHERE escuchado_recientemente.id_usuario = $id_usuario AND escuchado_recientemente.id_cancion = cancion.id_cancion AND cancion.id_estilo = estilo.id_estilo");
			return $resultado;
	}

	public function saberUltimasCancionesEscuchadas($id_usuario) {
		$db = App::getDB();
		$resultado = $db -> ejecutar("SELECT cancion.nombre FROM escuchado_recientemente, cancion WHERE escuchado_recientemente.id_usuario = $id_usuario AND escuchado_recientemente.id_cancion = cancion.id_cancion");
		return $resultado;
	}

	public function guardarCancionEnListaDeReproduccion() {}

	public function guardarCancionEnEscuchadoRecientemente() {}
	
	
}



?>