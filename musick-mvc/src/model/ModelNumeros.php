<?php 
class ModelNumeros {

  public static function getAleatorios($n){
    $data= [];
    for($i =0; $i< $n ;$i++){
      $data[] = rand(1,100);
    }
    return $data;
    
  }

}

?>