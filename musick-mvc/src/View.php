<?php

class View
{
    private $data;
    private $template;

    public function __construct() {
        $enrutador = App::getRouter();
                        // noticias/list.phtml
        $this -> template = VIEW_ROOT.$enrutador -> getControlador().DS.$enrutador -> getAccion().".phtml";
        if (!file_exists($this -> template)) {
            throw new Exception("Error template no encontrado.");
        }
    }

    public function renderContenido($data = []) {
        ob_start(); // Toda la salida se queda en buffer temporal
        include($this -> template);
        $html_content = ob_get_clean();
        return $html_content;
    }

    public function render($data = []) {
        $html = $this -> renderContenido($data);
        $data = [];
        $data['contenido'] = $html;
        $data['title'] = Config::get('site.name');

        ob_start(); // Toda la salida se queda en buffer temporal
        include(VIEW_ROOT.'base.phtml');
        $html_content = ob_get_clean();
        return $html_content;
    }

}

?>