<?php
session_start();
class ModelAutorForm extends BaseForm
{

    protected static $lista_info = ['id_autor', 'nombre_autor','informacion'];
    protected static $lista_tipo = [
                          'FieldID',
                          'FieldText',
                          'FieldLongText'
                          
                        ];
    protected static $clase_modelo_asociado = 'ModelAutor';
}

?>