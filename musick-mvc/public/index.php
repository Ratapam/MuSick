<?php

// Aplicación funcione en linux y windows (DS)
define('DS', DIRECTORY_SEPARATOR); 

// Raíz del proyecto. Independientemente de la situación
define('ROOT',  dirname(dirname(__FILE__)));
define('VIEW_ROOT',  ROOT.DS."resources".DS);

require(ROOT.DS."src".DS."init.php");

//echo Config::get('site.name');

$enrutador = new Router($_SERVER['REQUEST_URI']);
$app = new App();
$app -> run($_SERVER['REQUEST_URI']);
/*
    echo "<br>";
    echo "<pre>Objeto Router:";
    print_r($enrutador);
    echo "GET:<br>";
    print_r($_GET);
    echo "</pre>";
    echo "<br><br>Pedido: <br>";
    echo $_SERVER['REQUEST_URI'];
*/

?>