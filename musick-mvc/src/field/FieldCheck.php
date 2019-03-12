<?php

class FieldCheck extends BaseField
{
    public function validar():bool {
        return true;
       
    }

    public function pintar() {

        echo "<p style='color:rgb(144, 229, 200)'>Recuerdame: <input type='checkbox' name='recuerdame' value='recuerdame' /></p>";
        
        if($this->error){
            echo "$this->error";
        }
    }
    
    
}

?>