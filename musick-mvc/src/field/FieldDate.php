<?php
class FieldDate extends BaseField
{
    public function validar():bool {
        
            /*$valores = explode('/', $this-> dato);
            if(count($valores) == 3 && checkdate($valores[1], $valores[0], $valores[2])){
                return true;
            }*/
            return true;
        
    }

    public function pintar() {
        $hoy = date("Y-m-d");
        echo "<input type='hidden' name='$this->nombre' value='$hoy' />";
        if($this->error){
            echo "$this->error";
        }
    }
}


?>