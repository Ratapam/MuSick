<?php

class ControllerNoticias extends BaseController
{

    public function list() {
        $this -> data = ModelNoticia::getAll();
/*
        ModelNoticias::getNoticias();
        ModelNoticias::getNoticias($page = 1);
        ModelNoticias::getNoticiasPublicadas();
        $noticia1 = ModelNoticias::getById(47);
        $noticia2 = ModelNoticias::getLastByAuthor('Pablo');
        $noticia3 = new ModelNoticias();
        $noticia3 -> setTitle('Lanzamiento de mi MVC');
        $noticia3 -> setAuthor(1);
        $noticia3 -> getContent();
        $noticia3 -> save();
        ModelNoticias::deleteById(3);
        $noticia3 = ModelNoticias::getById(47);
        $noticia3 -> delete();
*/
    }

    public function show($id) {

        $this -> data['noticia'] =  ModelNoticia::getById($id);
        $this -> data['perfil'] = "Javier";
        $this -> data['publicidad'] = "Mahou 5 estrellas es la mejor";
        
    }

}

?>