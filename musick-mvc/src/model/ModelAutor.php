<?php

class ModelAutor extends BaseModel{
    protected static $lista_info = ['id_autor','nombre_autor','informacion'];

    public static function presentacion($id_autor) {

        $db = App::getDB();
        $sentenciaSQL = "SELECT * FROM autor WHERE id_autor = ?";
        $params = $id_autor;
        $resultado = $db -> ejecutar($sentenciaSQL,$params);
    
        return $resultado;
    }
    public static function nombresAutores() {

        $db = App::getDB();
        $sentenciaSQL = "SELECT nombre_autor FROM autor ";
        $resultado = $db -> ejecutar($sentenciaSQL,$params);
    
        return $resultado;
    }

	
	
}



?>