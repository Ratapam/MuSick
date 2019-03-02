<?php
session_start();
class ModelListaReproduccion extends BaseModel
{

    /*private $id;
    private $titulo;
    private $texto;
    private $fecha;*/

    protected static $lista_info = ['id_lista','id_usuario','id_cancion']; 


    public static function getCancionesLista() {
        $db = App::getDB();
        $id_usuario = $_SESSION['usuario'];
        $sentenciaSQL = "SELECT cancion.nombre_cancion, autor.nombre_autor,estilo.nombre_estilo, disco.nombre_disco FROM cancion ,autor ,disco ,estilo ,lista_reproduccion  WHERE lista_reproduccion.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor AND estilo.id_estilo = cancion.id_estilo AND disco.id_disco = cancion.id_disco AND lista_reproduccion.id_usuario = ?";

        $params = $id_usuario;
        
        /*
        $resultado['disco_nombre'] = $db -> ejecutar($sentenciaSQL,$params);
        
        $sentenciaSQL = "SELECT cancion.nombre, autor.nombre,disco.nombre,estilo.nombre FROM cancion ,autor ,disco ,estilo ,lista_reproduccion  WHERE lista_reproduccion.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor AND estilo.id_estilo = cancion.id_estilo AND disco.id_disco = cancion.id_disco AND lista_reproduccion.id_usuario = ?";
        $params = $id_usuario;

        $resultado['estilo_nombre'] = $db -> ejecutar($sentenciaSQL,$params);

        $sentenciaSQL = "SELECT cancion.nombre, disco.nombre,estilo.nombre,autor.nombre FROM cancion ,autor ,disco ,estilo ,lista_reproduccion  WHERE lista_reproduccion.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor AND estilo.id_estilo = cancion.id_estilo AND disco.id_disco = cancion.id_disco AND lista_reproduccion.id_usuario = ?";
        $params = $id_usuario;

        $resultado['autor_nombre'] = $db -> ejecutar($sentenciaSQL,$params);

        $sentenciaSQL = "SELECT cancion.nombre, disco.nombre,estilo.nombre,autor.nombre FROM cancion ,autor ,disco ,estilo ,lista_reproduccion  WHERE lista_reproduccion.id_cancion = cancion.id_cancion AND cancion.id_autor = autor.id_autor AND estilo.id_estilo = cancion.id_estilo AND disco.id_disco = cancion.id_disco AND lista_reproduccion.id_usuario = ?";
        $params = $id_usuario;
*/
        $resultado = $db -> ejecutar($sentenciaSQL,$params);

        return $resultado;
    }


}
?>