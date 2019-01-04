<?php
$busqueda = "";


if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];

  $usuario = "ususarioPrueba";
  $contrasena = 1234;
  $mbd = new PDO('mysql:host=localhost;dbname=Prueba1', $usuario, $contrasena);

  $sentencia = $mbd->prepare("SELECT * FROM Cancion where id_autor =
    (select id_autor from Autor where nombre = :busqueda)");
  $sentencia->bindParam(':busqueda', $busqueda);
  //$sentencia -> execute(['orden'=>$orden]);
  $sentencia -> execute();
    // Obteniendo todo
    $resultado = $sentencia->fetchAll();
    echo "Busqueda:</br>";

  if(!empty($resultado)){

    echo "
    <table border>
      <tr>
        <th>Nombre de la Cancion</th>
      </tr>";
    foreach ($resultado as $clave => $valor) {
    echo"<tr>";
      foreach ($valor as $key => $value) {
        if(gettype($key)!="integer" && $key != "clave"){
          if(gettype($key)!="integer" && $key != "nombrePista"){
            if($key=="nombre"){
              echo "<td>".$value."</td>";
            }
          }
        }
      }
      echo "</tr>";
    }

  }else{
      echo "Artista no encontrado";
    }
    //print_r($resultado);
}else{
  ?>
  <!DOCTYPE html>
  <html lang="en" dir="ltr">
    <head>
      <meta charset="utf-8">
      <title></title>
    </head>
    <body>
     <form action="pruebaListados.php" method="get">
       <h2>Busqueda</h2> <br>
      <label>Introduce el nombre de un artista (Amaral o Manolo Garcia):  <input type="text" name="busqueda" value="<?=$busqueda?>"></label>
      <br>
      <input type="submit" name="enviar" value="Enviar">
     </form>
    </body>
  </html>
  <?php
}

 ?>
