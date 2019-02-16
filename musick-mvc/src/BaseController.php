<?php

class BaseController
{
    protected $data;

    public function __construct() {
        $this -> data = [];
    }

    public function procesaAccion($metodo, $parametros) {
        // Rellenará los datos
        // Los ... pasa todos los parámetros de la array individualmente
        $this -> $metodo(...$parametros); 
        $vista = new View();
        return $vista -> render($this -> data);  
        
    }

    
    


}

?>