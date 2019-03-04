<?php

class FieldID extends BaseField
{
    public function validar():bool {
        return true;
    }
    public function pintar() {
        echo "$this->nombre :";
        echo "<input type='text' readonly name='$this->nombre' value='$this->dato' />";
    }
}

?>
