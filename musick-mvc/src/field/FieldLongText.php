<?php
class FieldLongText extends BaseField
{
    public function validar():bool {
        if(strlen($this->dato)<20){
            $this->error = "Este campo dee tener al menos 20 caracteres tener información";
            return false;
        }else {
         
            return true;
        }
    }

    public function pintar() {
        echo "<label>$this->nombre :</label>";

        echo "<textarea name='$this->nombre' placeholder=''  minlength='20' maxlength='500' value='$this->dato'></textarea>";
        if($this->error){
            echo "$this->error";
        }
    }
}


?>