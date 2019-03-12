<?php
class ModelAdministrador extends BaseModel{
    protected static $lista_info = ['id_autor','nombre_autor','informacion'];

    public static function principal() {
        $valor = "<h1>Principal</h1>";
        return $valor;
        
    }
    

	
	
}



?>