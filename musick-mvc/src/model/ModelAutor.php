<?php

class ModelAutor extends BaseModel{
    protected static $lista_info = ['id_autor','nombre','informacion','discos','estilos'];

    function principal(){
        return"<h1>Hola</h1>";
    }

    public function presentacion() {

        // saberDatos($_GET['id_autor']);
        // saberDatos(1);
        // return $resultado;
        $id_autor = $_GET['id_autor'];
        //$id_autor = 3;
        $db = App::getDB();
        $resultado = $db -> ejecutar("SELECT * FROM autor WHERE id_autor = $id_autor");
        $db2 = App::getDB();
        $resultado2 = $db2 -> ejecutar("SELECT DISTINCT disco.* FROM disco, cancion WHERE cancion.id_disco = disco.id_disco AND cancion.id_autor = $id_autor");
        $resultado['discos'] = $resultado2;
        $db3 = App::getDB();
        $resultado3 = $db3 -> ejecutar("SELECT DISTINCT estilo.* FROM estilo, cancion WHERE estilo.id_estilo = cancion.id_estilo AND cancion.id_autor = $id_autor");
        $resultado['estilos'] = $resultado3;
        foreach ($resultado2 as $id_disco => $disco) {
            foreach ($disco as $clave => $valor) {
                if ($clave == "id_disco") {
                    $string = "disco".$valor;
                    $string = App::getDB();
                    $resultado4 = $string -> ejecutar("SELECT cancion.* FROM cancion WHERE id_disco = $valor ORDER BY id_cancion");
                    $resultado['discos'][$id_disco][$valor] = $resultado4;
                }
            }
        }
        // echo "<pre>";
        // print_r($resultado['discos']);
        // print_r($resultado);
        // echo "</pre>";
        return $resultado;
    }

    // El $id_autor se pasara por GET
	public function saberDatos($id_autor) {	
		$db = App::getDB();
		$resultado = $db -> ejecutar("SELECT * FROM autor WHERE id_autor = $id_autor");
		$this -> id_autor = $resultado['id_autor'];
		$this -> nombre = $resultado['nombre'];
        $this -> informacion =  $resultado['informacion'];

        $resultado['discos'] = saberDiscos($resultado['id_autor']);
        $this -> discos = $resultado['discos'];
        $resultado['estilos'] = saberEstilos($resultado['id_autor']);
        $this -> estilos = $resutlado['estilos'];
        return $resultado;
	}

    // Falta probarlo
	public function __toString() {
		echo "id_autor: ".$this -> id_autor."<br>
		nombre: ".$this -> nombre."<br>
        discos: ";        
        foreach ($this -> discos as $clave => $disco) {
            echo "id_disco: ".$clave."<br>
            nombre: ".$disco;
        }
	}

	public function saberEstilos($id_autor) {
			$db = App::getDB();
			$resultado = $db -> ejecutar("SELECT estilo.* FROM estilo, cancion WHERE estilo.id_estilo = cancion.id_estilo AND cancion.id_autor = $id_autor");
			return $resultado;
	}

	public function saberDiscos($id_autor) {
			$db = App::getDB();
			$resultado2 = $db -> ejecutar("SELECT disco.* FROM disco, cancion WHERE disco.id_disco = cancion.id_cancion AND cancion.id_autor = $id_autor");
			return $resultado;
	}

	public function saberCanciones($id_autor) {
			$db = App::getDB();
			$resultado = $db -> ejecutar("SELECT cancion.* FROM cancion WHERE id_autor = $id_autor");
			return $resultado;
    }
    
    public static function escribirCancionesDisco($id_disco) {
        $db = App::getDB();
        $resultado = $db -> ejecutar("SELECT cancion.nombre, estilo.nombre FROM cancion c, estilo e WHERE c.id_disco = $id_disco AND e.id_estilo = c.id_estilo");
        $contador = 0;
        foreach ($reslultado as $id_cancion => $cancion) {
            echo '
            <tr>
            <td>'.$cancion.'</td>
            <td>'.$resultado[$contador++]['estilo'].'</td>
            <button type="button">
            <img src="../../img/img_artista/mas.png"></td>
            </button>
            </tr>
            ';
        }

    }

	public function guardarCancionEnListaDeReproduccion() {}

	public function guardarCancionEnEscuchadoRecientemente() {}
	
	
}



?>