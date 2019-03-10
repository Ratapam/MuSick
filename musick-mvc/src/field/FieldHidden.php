<?php

class FieldHidden extends BaseField
{
    public function validar():bool {
        return true;
    }
    public function pintar() {
        echo "<input type='hidden' readonly name='$this->nombre' value='$this->dato' />";
    }
}

?>
