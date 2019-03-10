<?php

class ModelUsuario extends BaseModel{
    protected static $lista_info = ['id_usuario','contrasena','nick','correo']; 


    function lista(){
        $db = App::getDB();
		$id_usuario = $_SESSION['usuario'];
	
        $sentenciaSQL = "SELECT cancion.nombre_cancion, autor.nombre_autor,disco.nombre_disco FROM cancion ,autor ,disco ,lista_reproduccion  WHERE lista_reproduccion.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor AND disco.id_disco = cancion.id_disco AND lista_reproduccion.id_usuario = ?";
		$params = $id_usuario;
		
 
		$resultado = $db -> ejecutar($sentenciaSQL,$params);
		

        return $resultado;
    }

    public function ultimasEscuchadas(){
		$db = App::getDB();
        
		//$id_usuario = $_SESSION['usuario'];
		$id_usuario = 1;
		$resultado = $db -> ejecutar("SELECT DISTINCT autor.nombre_autor ,autor.id_autor FROM escuchado_recientemente, cancion, autor WHERE escuchado_recientemente.id_usuario = $id_usuario AND escuchado_recientemente.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor LIMIT 4");
		return $resultado;
	}


	public function perfil(){
		$db = App::getDB();
        //$id_usuario = $_SESSION['usuario'];
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

	public static function generateToken($length = 30)
    {
        return bin2hex(random_bytes($length));
        
    }//generateToken

	/*public function saberUltimosArtistasEscuchados($id_usuario) {
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
	
		*/
}



?>