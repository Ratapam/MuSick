<?php


	class Router
	{

		private $uri;
		private $controlador;
		private $accion;
		private $params;

		public function __construct($uri) {
			// /controlador/accion/parametro
			$this -> uri = $uri;
			if($uri == "/"){
				$this -> redirect(Config::get('ruta.defecto'));
			}
			$urlProcesada = trim($uri, '/');
			$urlProcesada = explode('?', $urlProcesada);
			$urlProcesada = trim($urlProcesada[0], '/');
			$urlPorPartes = explode('/', $urlProcesada);
			if (count($urlPorPartes) != 0) {
				// Obtengo Controlador si hay
				if (current($urlPorPartes)) {
					$this -> controlador = array_shift($urlPorPartes);
				}
				// Obtengo Acción si hay
				if (current($urlPorPartes)) {
					$this -> accion = array_shift($urlPorPartes);
				}
				// Si no tiene parámetros le asignamos una array vacía para que por lo menos no sea null
				$this -> params = $urlPorPartes;
			}
		}

		public function getUri() {
			return $this -> uri;
		}

		public function getControlador() {
			return $this -> controlador;
		}
		
		public function getAccion() {
			return $this -> accion;
		}
		
		public function getParams() {
			return $this -> params;
		}

		public function redirect($uri) {
			header('location:'.$uri);
			die();
		}


	}

?>