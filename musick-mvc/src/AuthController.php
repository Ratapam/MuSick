<?php 


class AuthController{

    protected $parametros;

    public function comprobarCookie(){
        $arrCokie = $_COOKIE['session'];
        $arrCokie = unserialize($arrCokie);
        $respuesta = ModelUsuarioForm::verificaCookie($arrCokie[0],$arrCokie[1]);
        echo $respusta;
        die();
        
    } 

}
?>