<?php

class ControllerNumeros extends BaseController
{
    public function aleatorios($n = 10) {

        $this -> data =ModelNumeros::getAleatorios($n);
        
    }
}


?>