<?php

class ModelCancion extends BaseModel
{


    protected static $lista_info = ['id_cancion','nombre_cancion','fecha_alta','id_disco','id_autor','id_estilo']; 

    
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