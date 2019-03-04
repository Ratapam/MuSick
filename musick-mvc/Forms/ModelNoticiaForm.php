<?php

class ModelNoticiaForm extends BaseForm
{

    protected static $lista_info = ['id', 'titulo', 'texto', 'fecha'];
    protected static $lista_tipo = [
                          'FieldID',
                          'FieldText',
                          'FieldText',
                          'FieldText'
                        ];
    protected static $clase_modelo_asociado = 'ModelNoticia';
}

?>
