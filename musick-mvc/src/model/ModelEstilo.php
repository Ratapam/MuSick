<?php

class ModelEstilo extends BaseModel{
    protected static $lista_info = ['id_estilo','nombre_estilo']; 


    public function cuatroEstilos(){
		$db = App::getDB();
        // $id_usuario = $_SESSION['id_usuario'];
        $id_usuario = 1;
		$resultado = $db -> ejecutar("SELECT * FROM estilo LIMIT 4");
		return $resultado;
	}




}
?>