<?php


/***
Requisitos:
  Esta clase gestiona el pintado de los campos del formulario cuando se visita
  por primera vez.

  Esta clase gestiona el pintado de los datos previos y los errores cuando se
  envía la información.

  Esta clase permite construir un formulario en base a un id, de esta forma se
  edita el elemento.

Situaciones a tener en cuenta:
1º.- Si nos crean sin nada renderizamos un formulario en base a los campos.
2º.- Si nos crean con un array consideramos que el formulario es enviado y
      procesamos los datos.
3º.- Si nos crean con un id, consideramos que vamos a editar una entidad.
*/

class BaseForm
{
    protected static $lista_info;
    protected static $lista_tipo;
    protected static $clase_modelo_asociado;

    private $campos;
    private $errores;
    private $modelo;

    private function estaEnListaDatos($nombre) {
        return in_array($nombre, static::$lista_info);
    }

    public function __construct($data_row = []) {
        $this->errores = false;

        //
        // Creo los campos de información con su nombre
        //
        $campos = [];
        for($i=0;$i<count(static::$lista_tipo);$i++){
            $tipo_campo = static::$lista_tipo[$i];
            $nombre_campo = static::$lista_info[$i];
            $campos[] = new $tipo_campo($nombre_campo);

        }
        //
        // Los meto en el array asociativo
        //   id => new FieldID('id')
        //   campo1 => new FieldTipo('nombre_de_campo')
        //
        $this->campos = array_combine(static::$lista_info, $campos);

        if(count($data_row)>0){
            //
            // Tengo datos:
            //    Bien por POST
            //    Bien por edición
            //
            // Relleno los datos de los campos
            //    También los valido
            //
            // Los meto en el array asociativo
            //   id => new FieldID('id')
            //            ->estableceInfo(4);
            //            ->validar()
            //   campo1 => new FieldTipo('nombre_de_campo')
            //            ->estableceInfo('valor1');
            //            ->validar()
            //
            // Si alguno da error, establezco que hay errores
            foreach ($this->campos as $nombre => &$campo) {
                $campo->estableceInfo(
                    $data_row[$nombre]
                );
                if(!$campo->validar()){
                    $this->errores = true;
                }
            }
        }

        if(count($_POST)>0){
            if($this->datosValidos()){
                $datos = array_map(function ($campo){
                    return $campo->obtenerInfo();
                }, $this->campos);
                $datos = array_combine(static::$lista_info, $datos);

                $this->modelo = new static::$clase_modelo_asociado($datos);
            }
        }
    }

    function datosValidos(){
        return !$this->errores;
    }

    function pintar() {
        ob_start();

        echo "<form action='#' method='post'>";
        foreach ($this->campos as $campo) {
            $campo->pintar();
            echo "<br>";
        }
        echo "<input type='submit' />";
        echo "</form>";

        return ob_get_clean();
    }

    function guardaInformacion() {
        $this->modelo->save();
    }
}


 ?>
