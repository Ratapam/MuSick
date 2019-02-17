<?php

class ControllerAutor extends BaseController{

    function principal(){

       $this->data=  ModelAutor::principal();
    }

    function presentacion(){

        $this->data=  ModelAutor::presentacion();
     }


}



?>