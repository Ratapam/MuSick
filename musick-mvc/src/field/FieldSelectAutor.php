<?php

class FieldSelectAutor extends BaseField
{
    public function validar():bool {
        return true;
    }
    public function pintar() {
        $objeto = new ModelAutor();
        $nombres = $objeto -> getAll();

        echo "<label>$this->nombre :</label>";
        echo "<select name= 'id_autor'>";
        foreach($nombres as $clave => $valor){
        
             echo '<option value="'.$valor->getId_autor().'">'.$valor->getNombre_autor().'</option>';
        }     
        echo "</select>";

        
    }
}

?>
