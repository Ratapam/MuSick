<?php
class BaseModel
{
    
    protected $db;
    protected static $lista_info;
    private $data;

    /**
     * setAlgo, setOtracosa
     * getAlgo, getOtracosa
     */

     private function estaEnlalistaDatos($nombre){       
         return in_array($nombre, static::$lista_info);
     }

    public function __construct($data_row=[]) {
        $this -> db = App::getDB();
        //$this -> lista_info = ['id','texto','descripcion','fecha'];
      //  print_r($data_row);
        if(count($data_row)==0){
            $this -> data= array_fill_keys(static::$lista_info,null);
        }else{
           
            $this -> data = array_combine(static::$lista_info,$data_row);
        }
    }

    public static function getAll($page= 0,$num= 0){
        $db = App::getDB();
        $nombre_clase = get_called_class();
        $nombre_tabla = strtolower(substr($nombre_clase,5));
        $campos_para_select = implode(",",static::$lista_info);
        // echo "Select $campos_para_select from $nombre_tabla";
        $resultado = $db -> ejecutar("Select $campos_para_select from $nombre_tabla");
        $resultado = array_map(function ($datos){
            $nombre_clase = get_called_class();
            return new $nombre_clase($datos);
        }, $resultado);
        return $resultado;
    }


    public function __call($nombre,$dato){
        $dato_pedido = strtolower(substr($nombre,3));
        $accion = substr($nombre,0,3);
        
        if(!$this->estaEnlalistaDatos($dato_pedido)){            
            return "Error";
        }else{
            if($accion == "get"){
                return $this -> data[$dato_pedido];
            }else if($accion=="set"){
                $this -> data[$dato_pedido] = $dato[0];
            }
        }
        
      }

      public static function getById($id){
        $db = App::getDB();
        $nombre_clase = get_called_class();
        $nombre_tabla = strtolower(substr($nombre_clase,5));
        $campos_para_select = implode(",",static::$lista_info);
        $sqlSelect  = "Select $campos_para_select from $nombre_tabla where id = ? ";        
        $resultado = $db -> ejecutar($sqlSelect,$id);        
        return $resultado[0];
    }
    



   /* public function save() {
        $db = App::getDB();
        $nombre_clase = get_called_class();
        $nombre_tabla = strtolower(substr($nombre_clase,5));
        $campos_para_insert = implode(",",array_slice(static::$lista_info,1));
        $parametros_para_insert = implode(",",array_fill(0,count(static::$lista_info)-1,'?'));
        echo $parametros_para_insert."91\n";
       // $id = $this -> data['id_autor'];
        $claves= array_keys($this-> data);
        $parametros_para_update="";
        for($i = 0;$i<count($claves);$i++){
            if($i != count($claves)-1){
                $parametros_para_update .= $claves[$i]."=?,";
            }else{
                $parametros_para_update .= $claves[$i]."=? ";
            }
        }
        if ($this -> getId() == "") {
            $sqlInsert = "INSERT INTO $nombre_tabla ($campos_para_insert) VALUES ($parametros_para_insert)";
            
            $resultado = $this -> db -> ejecutar($sqlInsert, ...array_values(array_slice($this->data,1)));
            print_r($resultado);
            echo "rsultado insert";
            if(is_array($resultado)){
                $this -> setId($this ->db -> getLastId());
                $resultado[] = $this -> getId();
            }
            return $resultado;
        }else{
           
            $sqlUpdate =  "UPDATE $nombre_tabla SET $parametros_para_update where id = $id";
            $resultado = $this -> db -> ejecutar($sqlUpdate, ...array_values($this->data));
            if(is_array($resultado)){
              $resultado[] = $this ->getId();
             }
             return $resultado;
         }
    }*/

    public function save() {

        $db = App::getDB();

        $nombre_clase = get_called_class();
        $nombre_tabla = strtolower(substr($nombre_clase, 5));
        $campos_insert = implode(', ', array_slice(static::$lista_info, 1));
        $campos_update = implode(' = ?, ', array_slice(static::$lista_info, 1)) . ' = ?';
        $parametros_insert = implode(', ', array_fill(0, count(static::$lista_info) - 1, '?'));
        
       
        $nombreId = "getId_".$nombre_tabla;
        if ($this->$nombreId() == null) {
            $sql_insert = "INSERT INTO $nombre_tabla ($campos_insert) VALUES ($parametros_insert)";
        
            $resultado = $this->db->ejecutar($sql_insert, ...array_values(array_slice($this->data, 1)));
            if (is_array($resultado)) {
                $this->setId($this->db->getLastId());
                $resultado[] = $this->getId();
            }
           
           return $resultado;
        } else {
            $id_update = $this->getId();
            $sql_insert = "UPDATE $nombre_tabla SET $campos_update WHERE id = $id_update";
            $resultado = $this->db->ejecutar($sql_insert, ...array_values(array_slice($this->data, 1)));
            return $resultado;
        }
    }

}

?>