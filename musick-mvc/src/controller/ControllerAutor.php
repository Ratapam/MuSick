<?php

class ControllerAutor extends BaseController{


    function presentacion($id_autor){
        $this->data['css'] = "<link href='/css/artista.css' rel='stylesheet'>";
        $this->data['autor']=  ModelAutor::presentacion($id_autor);
        $this->data['canciones']=  ModelCancion::darCanciones($id_autor);
       // $this->data['estilo']=  ModelEstilo::darEstilo($this->data['canciones']['id_estilo']);
        $this->data['discos']=  ModelDisco::darDiscos($id_autor);
     }

     

}



?>