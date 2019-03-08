<?php

class FieldSelectDiscos extends BaseField
{
    public function validar():bool {
        return true;
    }
    public function pintar() {
        $objeto = new ModelDisco();
        $nombres = $objeto -> getAll();
         
        echo "$this->nombre :";
        echo "<select name= 'id_disco'>";
        foreach($nombres as $clave => $valor){
        
             echo '<option value="'.$valor->getId_disco().'">'.$valor->getNombre_disco().'</option>';
        }     
        echo "</select>";

        
    }
}

?>