<?php

class ModelEscuchadoRecientemente extends BaseModel{
    protected static $lista_info = ['id_escucha','id_usuario','id_cancion'];

    public function masEscuchados(){
		$db = App::getDB();
        // $id_usuario = $_SESSION['id_usuario'];
        // echo $id_usuario;
        $id_usuario = 1;
		$resultado = $db -> ejecutar("SELECT DISTINCT autor.nombre, autor.id_autor FROM escuchado_recientemente, autor, cancion WHERE autor.id_autor = cancion.id_autor AND cancion.id_cancion = escuchado_recientemente.id_cancion AND escuchado_recientemente.id_usuario = $id_usuario LIMIT 4");
        return $resultado;
	}

}

?>
