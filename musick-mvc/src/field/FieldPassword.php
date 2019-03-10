<?php

class FieldPassword extends BaseField
{
    public function validar():bool {
        if(strlen($this->dato)==0){
            $this->error = "<br><p style='color:red'>Debe tener introducir su contraseña</p>";
            return false;
        } else {
            return true;
        }
    
    }
    public function pintar() {
       // echo "$this->nombre :";
        echo "<label>Password: <input type='password'  name='$this->nombre' value='$this->dato' /></label>
        ";

        if($this->error){
            echo "$this->error";
        }
    }
}

?>