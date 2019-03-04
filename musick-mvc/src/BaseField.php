<?php

abstract class BaseField {
    protected $nombre;
    protected $dato;
    protected $error;

    public function __construct($nombre) {
        $this->nombre = $nombre;
    }

    public function estableceInfo($dato) {
        $this->dato = $dato;
    }

    public function obtenerInfo() {
        return $this->dato;
    }

    public function obtenerError(){
        return $this->error;
    }

    public abstract function validar():bool;
    public abstract function pintar();
}

?>
