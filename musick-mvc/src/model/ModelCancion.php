<?php

class ModelCancion extends BaseModel
{

    /*private $id;
    private $titulo;
    private $texto;
    private $fecha;*/

    protected static $lista_info = ['id_cancion','nombre','fecha_alta','id_disco','id_autor','id_estilo']; 




    public static function getAllNoticias($page= 0,$num= 0){
        $db = App::getDB();
        $resultado = $db -> ejecutar('Select id ,titulo,texto,fecha from noticias');
        $resultado = array_map(function($datos){
            return new ModelNoticia($datos);
        },resultado);
        return $resultado;
    }
    
  //Funcion que da las canciones a partti del id_autor que pasamos.

    public static function darCanciones($id_autor) {
        $db = App::getDB();
        $sentenciaSQL = "SELECT * FROM cancion WHERE id_autor = ?";
        $params = $id_autor;
        
        
        $resultado = $db -> ejecutar($sentenciaSQL,$params);
       
        return $resultado;
    }

}

?>