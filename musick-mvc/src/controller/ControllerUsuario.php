<?php

class ControllerUsuario extends BaseController{

    function principal(){

       $this->data=  ModelUsuario::principal();
    }

    function home(){
        $this -> data['ultimo_escuchado'] = ModelUsuario::ultimasEscuchadas();
        $this -> data['estilo'] = ModelEstilo::cuatroEstilos();
        $this -> data['recomendado'] = ModelEscuchadoRecientemente::masEscuchados();
     }

     function perfil(){

      $this->data=  ModelUsuario::perfil();
   }

}



?>