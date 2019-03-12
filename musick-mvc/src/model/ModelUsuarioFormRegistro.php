<?php
session_start();
class ModelUsuarioFormRegistro extends BaseForm
{

    protected static $lista_info = ['id_usuario', 'nombre', 'contrasena', 'correo'];
    protected static $lista_tipo = [
                          'FieldHidden',
                          'FieldNombre',
                          'FieldPassword',
                          'FieldCorreo'
                        ];
    protected static $clase_modelo_asociado = 'ModelUsuario';


    public static function crearRegistro($nombre,$pass,$correo){
        $db = App::getDB();
        
        $sql_insert= "INSERT INTO usuario (nick,contrasena,correo) VALUES (?, ?, ?)";
        $resultado = $db -> ejecutar($sql_insert,$nombre,$pass,$correo);
       
        
    }

}

?>
