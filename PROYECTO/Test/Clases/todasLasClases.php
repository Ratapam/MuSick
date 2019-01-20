<?php 

class Usuario
{
	public $idUsuario;
	public $password;
	public $nombre;
	public $apellidos;
	public $edad;
	public $nick;

	public function __construct(string $idUsuario, string $password, string $nombre, string $apellidos, int $edad, string $nick) {
		$this -> idUsuario = $idUsuario;
		$this -> password = $password;
		$this -> nombre = $nombre;
		$this -> apellidos = $apellidos;
		$this -> edad = $edad;
		$this -> nick = $nick;	
	}

	public function __toString() {
		return "
		idUsuario: ".$this -> idUsuario.
		"</br>password: ".$this -> password.
		"</br>nombre: ".$this -> nombre.
		"</br>apellidos: ".$this -> apellidos.
		"</br>edad: ".$this -> edad.
		"</br>nick: ".$this -> nick
		;
	}

}

class Disco
{
	public $idDisco;
	public $nombre;

	public function __construct(string $idDisco, string $nombre) {
		$this -> idDisco = $idDisco;
		$this -> nombre = $nombre;
	}

	public function __toString() {
		return "
		idDisco: ".$this -> idDisco.
		"</br>nombre: ".$this -> nombre.
		;
	}
}

class Autor
{
	public $idAutor;
	public $nombre;

	public function __construct(string $idAutor, string $nombre) {
		$this -> idAutor = $idAutor;
		$this -> nombre = $nombre;
	}

	public function __toString() {
		return "
		idAutor: ".$this -> idAutor.
		"</br>nombre: ".$this -> nombre.
		;
	}
}


class Estilo
{
	public $idEstilo;
	public $nombre;

	public function __construct(string $idEstilo, string $nombre) {
		$this -> idEstilo = $idEstilo;
		$this -> nombre = $nombre;
	}

	public function __toString() {
		return "
		idEstilo: ".$this -> idEstilo.
		"</br>nombre: ".$this -> nombre.
		;
	}
}

class Cancion
{
	public $idCancion;
	public $nombre;
	public $fechaAlta;
	public $idDisco;
	public $idAutor;
	public $idEstilo;

	public function __construct(string $idCancion, string $nombre, string $fechaAlta, string $idDisco, int $idAutor, string $idEstilo) {
		$this -> idCancion = $idCancion;
		$this -> nombre = $nombre;
		$this -> fechaAlta = $fechaAlta;
		$this -> idDisco = $idDisco;
		$this -> idAutor = $idAutor;
		$this -> idEstilo = $idEstilo;	
	}

	public function __toString() {
		return "
		idCancion: ".$this -> idCancion.
		"</br>nombre: ".$this -> nombre.
		"</br>fechaAlta: ".$this -> fechaAlta.
		"</br>idDisco: ".$this -> idDisco.
		"</br>idAutor: ".$this -> idAutor.
		"</br>idEstilo: ".$this -> idEstilo
		;
	}
}

class Escuchado_recientemente
{
	public $idUsuario;
	public $fecha;
	public $idCancion;

	public function __construct(string $idUsuario, string $fecha, string $idCancion) {
		$this -> idUsuario = $idUsuario;
		$this -> fecha = $fecha;
		$this -> idCancion = $idCancion;
	}

	public function __toString() {
		return "
		idUsuario: ".$this -> idUsuario.
		"</br>fecha: ".$this -> fecha.
		"</br>idCancion: ".$this -> idCancion.
		;
	}
}

class Lista_reproduccion
{
	public $idLista;
	public $nombre;
	public $idUsuario;
	public $idCancion;

	public function __construct(string $idLista, string $nombre, string $idUsuario, string $idCancion) {
		$this -> idLista = $idLista;
		$this -> nombre = $nombre;
		$this -> idUsuario = $idUsuario;
		$this -> idCancion = $idCancion;
	}

	public function __toString() {
		return "
		idLista: ".$this -> idLista.
		"</br>nombre: ".$this -> nombre.
		"</br>idUsuario: ".$this -> idUsuario.
		"</br>idCancion: ".$this -> idCancion.
		;
	}
}

class Administrador
{
	public $idAdministrador;
	public $password;
	public $nombre;

	public function __construct(string $idAdministrador, string $password, string $nombre) {
		$this -> idAdministrador = $idAdministrador;
		$this -> password = $password;
		$this -> nombre = $nombre;
	}

	public function __toString() {
		return "
		idAdministrador: ".$this -> idAdministrador.
		"</br>password: ".$this -> password.
		"</br>nombre: ".$this -> nombre.
		;
	}
}

?>