<?php

// Arrays Base de Datos

$carpetas = [
  "novedades",
  "recomendados",
  "tendencias",
  "escuchados_recientemente",
  "generos"
];

function crearImagen($dato, $numero) {
  echo '
  <div class="col-sm-12 col-md-6 col-lg-3">
  <a href="#artista?name='.$dato.'" class="d-block mb-4 h-100">
  <img class="embed-responsive-item" control
  src="../img/imgPrincipal/'.$dato.'/'.$dato.$numero.'.png"/>
  </img>
  </a>
  </div>';
}

function crearFila($dato) {
  echo '
  <h1 class="my-4 text-center text-lg-left">'.strtoupper(str_replace("_", " ", $dato)).'</h1>
  <div class="row text-center text-lg-left">
  ';
  for ($x = 1; $x <= 4; $x++) {
    crearImagen($dato, $x);
  }
  echo '</div>';
}

function estructuraHtml($datos) {
  foreach ($datos as $nombre) {
    crearFila($nombre);
  }
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Principal</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
  crossorigin="anonymous">
  <link href="../css/home.css" rel="stylesheet">
</head>
<body>
  <main class="container">
    <?php
    estructuraHtml($carpetas);
    ?>
  </div>


</main>
</body>

</html>
