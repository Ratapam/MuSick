<?php

class ControllerNoticias extends BaseController
{
    public function list(){
        $this->data = ModelNoticia::getAll();
    }

    public function show($id) {
        $this->data['perfil'] = "Jorge";
        $this->data['publicidad'] = "Mahou es genial!";
        $this->data['noticia'] = ModelNoticia::getById($id);
    }

    public function add(){
        $form = new ModelNoticiaForm($_POST);

        if(count($_POST)>0 && $form->datosValidos()) {
            $form->guardaInformacion();
            App::getRouter()::redirect('/noticias/list/');
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
