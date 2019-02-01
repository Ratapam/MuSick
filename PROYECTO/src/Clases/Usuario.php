<?php

class Usuario
{

    public $contrasena;
    public $nick;
    public $correo;

	public function __construct(string $contrasena, string $nick, string $correo) {
		$this -> nombre = $nombre;
		$this -> password = $password;
	}

	public function __toString() {
		return "
		Contrasena: ".$this -> contrasena."
		</br>Nick: ".$this -> nick."
		</br>Correo: ".$this -> correo;
    }
    
}

?>