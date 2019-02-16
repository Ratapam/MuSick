<?php

class ModelNoticia extends BaseModel
{

    /*private $id;
    private $titulo;
    private $texto;
    private $fecha;*/

    protected static $lista_info = ['id','titulo','texto','fecha']; 




    public static function getAllNoticias($page= 0,$num= 0){
        $db = App::getDB();
        $resultado = $db -> ejecutar('Select id ,titulo,texto,fecha from noticias');
        $resultado = array_map(function($datos){
            return new ModelNoticia($datos);
        },resultado);
        return $resultado;
    }
    
/*
    public function getById($id) {
        if ($this -> id == null) {
            $this -> db -> ejecutar('INSERT INTO noticias (titulo, texto, fecha) VALUES (?, ?, ?)', $this -> titulo, $this -> texto, $this -> fecha);
        } else {
            $this -> db -> ejecutar('UPDATE noticias SET titulo = ?, texto = ?, fecha = ? WHERE id = ?', $this -> titulo, $this -> texto, $this -> fecha, $this -> id);
        }
    }

    public function getNoticias($pagina) {

    }

    public function getNoticiasDesde(date $fecha) {

    }
*/  

}

?>