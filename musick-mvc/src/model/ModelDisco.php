<?php

class ModelDisco extends BaseModel
{

    /*private $id;
    private $titulo;
    private $texto;
    private $fecha;*/

    protected static $lista_info = ['id_disco','nombre_disco']; 


    
  //Funcion que da la infoemacion del disco a partir del id_disco que pasamos.

    public static function darDiscos($id_autor) {
        $db = App::getDB();
        $sentenciaSQL = "SELECT DISTINCT disco.* FROM cancion,disco WHERE disco.id_disco = cancion.id_disco AND cancion.id_autor = ?";
        $params = $id_autor;
        $resultado = $db -> ejecutar($sentenciaSQL,$params);
        
        return $resultado;
    }

    public static function nombresDiscos() {

        $db = App::getDB();
        $sentenciaSQL = "SELECT nombre_disco FROM disco ";
        $resultado = $db -> ejecutar($sentenciaSQL,$params);
    
        return $resultado;
    }


}

?>