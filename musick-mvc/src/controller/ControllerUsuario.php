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

     function biblioteca(){
      //$this-> data['css'] = "<link href='/css/artista.css' rel='stylesheet'>"; 
      $this-> data['lista'] =  ModelListaReproduccion::getCancionesLista();
      $this-> data['css'] = "<link href='/css/artista.css' rel='stylesheet'>"; 
     }

     

}



?>