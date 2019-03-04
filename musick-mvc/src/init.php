<?php

function startsWith($haystack, $needle) {
	$length = strlen($needle);
	return (substr($haystack, 0, $length) === $needle);
}

spl_autoload_register(function ($nombre_clase) {
	$ruta_a_clase = ROOT.DS."src".DS;
	if (startsWith($nombre_clase, "Controller")) {
		// Si comienza por Controller
		//		/src/controller/<nombre>
		$ruta_a_clase .= "controller".DS.$nombre_clase;
	} elseif (startsWith($nombre_clase, "Model")) {
		// Si comienza por Model
		// 		/src/model/<nombre>
		$ruta_a_clase .= "model".DS.$nombre_clase;
	}  else if (startsWith($nombre_clase, "Field")) {
		$ruta_a_clase .= "field" . DS . $nombre_clase;
	}else {
		// Si no
		// 		/src/<nombre>
		$ruta_a_clase .= $nombre_clase;
	}

	$ruta_a_clase .= ".php";
	require($ruta_a_clase);
});

require(ROOT.DS."config".DS."config.php");


?>