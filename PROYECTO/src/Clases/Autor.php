<?php

class Autor
{
    
    private $id_autor;
    private $nombre;
    private $informacion;

    public function __construct(int $id_autor) {   	
		$conexion = new AutentificacionConBaseDeDatos();
		try {
            $respuesta = $conexion -> query("SELECT * FROM Autor WHERE id_autor = '$id_autor'");
			$datosAutor = $respuesta -> fetchAll();
            // print_r($datosAutor);
            $this -> nombre = $datosAutor[0]['nombre'];
            $this -> informacion = $datosAutor[0]['informacion'];
            // echo $nombre;
			// echo $informacion;
        } catch (PDOException $error) {
            print "¡Error!: ".$error -> getMessage()."<br/>";
            return false;
        }  
        $this -> id_autor = $id_autor;
    }

    public function __toString() {
        return "id_autor: ".$this -> id_autor."<br>
        nombre: ".$this -> nombre."<br>
        informacion: ".$this -> informacion;
    }
    
    public function saberDiscosAutor() {
        $conexion = new AutentificacionConBaseDeDatos();
        $id_aut = $this -> id_autor;
        try {
            $respuesta = $conexion -> query("SELECT *.Disco 
            FROM Disco, Cancion, Autor 
            WHERE id_disco.Disco = id_disco.Cancion  
            AND id_autor.Cancion = '$id_aut");
			$discos = $respuesta -> fetchAll();
            // print_r($datosAutor);
            return $discos;
        } catch (PDOException $error) {
            print "¡Error!: ".$error -> getMessage()."<br/>";
            return false;
        }
    }   

}

?>