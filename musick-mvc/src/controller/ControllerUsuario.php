<?php

class ControllerUsuario extends BaseController{

    function principal(){

       $this->data=  ModelUsuario::principal();
    }

    function home(){

        $this->data=  ModelUsuario::home();
     }


     function perfil(){

      $this->data=  ModelUsuario::perfil();
   }

}



?>