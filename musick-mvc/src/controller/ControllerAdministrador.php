<?php

class ControllerAdministrador extends BaseController
{
    public function opciones(){
        $this -> data = ModelAdministrador::principal();
    }
  
    public function addAutor(){
        $form = new ModelAutorForm($_POST);

        if(count($_POST)>0 && $form->datosValidos()) {
            $form->guardaInformacion();
            
        }

        $this->data['form'] = $form->pintar();
    }

    public function addCancion(){
        $form = new ModelCancionForm($_POST);

        if(count($_POST)>0 && $form->datosValidos()) {
            $form->guardaInformacion();
            App::getRouter()::redirect('/administrador/addCancion/');
            
        }

        $this->data['form'] = $form->pintar();
    }

    public function edit($id) {

        if(count($_POST) == 0 ){
            $n = ModelNoticia::getById($id);
            $form = new ModelNoticiaForm($n->toArray());
        } else {
            $form = new ModelNoticiaForm($_POST);
        }

        if(count($_POST)>0 && $form->datosValidos()) {
          $form->guardaInformacion();
          App::getRouter()::redirect('/noticias/list/');
        }

        $this->data['form'] = $form->pintar();
    }

}

?>