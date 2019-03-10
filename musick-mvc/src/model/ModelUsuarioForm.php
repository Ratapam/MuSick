<?php
class ModelUsuarioForm extends BaseForm
{

    protected static $lista_info = ['id_usuario', 'nombre', 'contrasena', 'token'];
    protected static $lista_tipo = [
                          'FieldHidden',
                          'FieldNombre',
                          'FieldPassword',
                          'FieldCheck'
                        ];
    protected static $clase_modelo_asociado = 'ModelUsuario';


    public static function procesaLogin($nombre,$pass){

        $db = App::getDB();
        $nombre_clase = get_called_class();
        $sentenciaSQL = "SELECT * FROM usuario WHERE nick = ? ";
        
        $resultado = $db -> ejecutar($sentenciaSQL,$nombre);
        
        if(password_verify($pass, $resultado[0]['contrasena'])){
           return $resultado[0];
        }else{
            return false;
        }
        /*echo $resultado[0]['id'];
        die();*/
        //return new $nombre_clase($resultado[0]);
    }


    public static function creaRegistro($nombre,$pass){
        $db = App::getDB();
        $token = ModelUsuario::generateToken();
        //$usu = new ModelUsuario('',$nombre,$pass,$token);
        //$resultado =$usu -> save();
        echo $nombre."-".$pass."-".$token;
        
        $sql_insert= "INSERT INTO usuario (nombre,contrasena,tokenLogueado) VALUES (?, ?, ?)";
        $resultado = $db -> ejecutar($sql_insert,$nombre,$pass,$token);
        print_r($resultado);
        die();
        
    }

    public function tokenRecuerdame($id,$token){
		
		$db = App::getDB();
        //$token = ModelUsuario::generateToken();
        //$usu = new ModelUsuario('',$nombre,$pass,$token);
        //$resultado =$usu -> save();
        echo "-".$id."-".$token;
        
        $sql_insert= "INSERT INTO recuerdame (id_usuario,token) VALUES ( ?, ?)";
        $resultado = $db -> ejecutar($sql_insert,$id,$token);
        
        
	}

    public static function verificaCookie($id,$token){

        $db = App::getDB();
       // $nombre_clase = get_called_class();
        $sentenciaSQL = "SELECT id_usuario,token FROM recuerdame WHERE id_usuario = ? AND token =  ?";
        
                
        $resultado = $db -> ejecutar($sentenciaSQL,$id,$token);
        print_r($resultado);
       
        if(count($resultado)>0){
            return true;
        }
       
        return false;
    }

    public static function borrarTokenRecuerdame($id,$token){

        $db = App::getDB();
       // $nombre_clase = get_called_class();
        $sentenciaSQL = "DELETE FROM recuerdame where id_usuario = ? AND token =  ?";
        
                
        $resultado = $db -> ejecutar($sentenciaSQL,$id,$token);
      
        
        if(count($resultado)>0){
            return true;
        }
       
        return false;
    }
}

?>
