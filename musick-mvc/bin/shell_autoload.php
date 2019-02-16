<?php

// Aplicación funcione en linux y windows (DS)
define('DS', DIRECTORY_SEPARATOR); 

// Raíz del proyecto. Independientemente de la situación
define('ROOT',  dirname(dirname(__FILE__)));
define('VIEW_ROOT',  ROOT.DS."resources".DS);

require(ROOT.DS."src".DS."init.php");

App::initDB();

?>