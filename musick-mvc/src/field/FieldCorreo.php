<?php

class FieldCorreo extends BaseField
{
    public function validar():bool {
        if(strlen($this->dato)==0){
            $this->error = "<br><p style='color:red'>Debe tener introducir su corro electronico</p>";
            return false;
        } else {
            return true;
        }
    }

    public function pintar() {

        echo "Correo Electronico: <input type='email' name='correo'>";
        
        if($this->error){
            echo "$this->error";
        }
    }
    
    
}

?>