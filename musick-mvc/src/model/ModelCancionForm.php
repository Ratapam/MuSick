<?php
session_start();
class ModelCancionForm extends BaseForm
{

    protected static $lista_info = ['id_cancion', 'nombre_cancion','fecha_cancion','id_disco','id_autor','id_estilo'];
    protected static $lista_tipo = [
                          'FieldID',
                          'FieldText',
                          'FieldDate',
                          'FieldSelectDiscos',
                          'FieldSelectAutor',
                          'FieldSelectEstilo'
                          
                          
                        ];
    protected static $clase_modelo_asociado = 'ModelCancion';
}

?>