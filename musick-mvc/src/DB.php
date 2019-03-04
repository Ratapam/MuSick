<?php

class DB {

    protected $connection;

    public function __construct(
                        $db_user, 
                        $db_password, 
                        $db_name, 
                        $db_type='mysql', 
                        $host='localhost'
                    ) {
                    try {
                        $this -> connection = new PDO(
                            "$db_type:host=$host;dbname=$db_name",
                            $db_user,
                            $db_password);
                    } catch (PDOException $e) {
                        print "¡Error!: " . $e -> getMessage() ."<br/>";
                        die();
                    }
    }


    public function ejecutar($sql, ...$params)
    {
        if (!$this -> connection) {
            return false;
        }
        try {
           
            $sentenciaSQL = $this -> connection -> prepare($sql);
            echo "<pre>";
            print_r($sql);
            print_r($params);
            echo "</pre>";
           // die();
            $sentenciaEjecutada = $sentenciaSQL -> execute($params);
            if (!$sentenciaEjecutada) {
                print_r( $this -> connection -> errorInfo());
                return null;
            } else {
                $resultado = $sentenciaSQL -> fetchAll(PDO::FETCH_ASSOC);
                return $resultado;
            }
        } catch (PDOException $e) {
            print "¡Error!: " . $e -> getMessage() ."<br/>";
            die();
        }
        $result = $this -> connection -> query($sql);

    }

    public function __destruct()
    {
        $this -> connection = null;
    }

}

?>
