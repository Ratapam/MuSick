<?php

class FieldSelectEstilo extends BaseField
{
    public function validar():bool {
        return true;
    }
    public function pintar() {
        $objeto = new ModelEstilo();
        $nombres = $objeto -> getAll();
         
        echo "<label>$this->nombre :</label>";
        echo "<select name= 'id_estilo'>";
        foreach($nombres as $clave => $valor){
        
             echo '<option value="'.$valor->getId_estilo().'">'.$valor->getNombre_estilo().'</option>';
        }     
        echo "</select>";

        
    }
}

?>
