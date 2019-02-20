<?php

class ControllerAutor extends BaseController{

    function principal(){

       $this->data=  ModelAutor::principal();
    }

    function presentacion($id_autor){

        $this->data['autor']=  ModelAutor::presentacion($id_autor);
        $this->data['canciones']=  ModelCancion::darCanciones($id_autor);
       // $this->data['estilo']=  ModelEstilo::darEstilo($this->data['canciones']['id_estilo']);
        $this->data['discos']=  ModelDisco::darDiscos($id_autor);
     }


}



?>