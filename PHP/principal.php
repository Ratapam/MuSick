<?php

$carpetas = [
    "novedades",
    "recomendados",
    "tendencias",
    "escuchadosRecientemente",
    "generos"
];

function crearImagen($dato, $numero) {
    echo '
    <div class="col-sm-12 col-md-6 col-lg-3">
    <a href="#" class="d-block mb-4 h-100">
    <img class="embed-responsive-item" control 
    src="HTML/img/imgPrincipal/'.$dato.'/'.$dato.$numero.'.png"/>
    </img>
    </a>
    </div>';
}

function crearFila($dato) {
    echo '
    <h1 class="my-4 text-center text-lg-left">'.$dato.'</h1>
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
  <link href="css/home.css" rel="stylesheet">
</head>
<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <div class="collapse navbar-collapse" id="navbarResponsive"><a class="navbar-brand" href="#"><img src="img/logo.png"
              class="logo"></a></div>
        <input type="text" class="buscador" name="" placeholder="Busca aquí...">
        <a class="nav-link" href="#"><img class="usu" src="img/usu.png"></a>
      </div>
    </nav>
  </header>
  <main class="container">
  <?php
    estructuraHtml($carpetas);
  ?>
</div>
</main>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Musick 2019</p>
    </div>
  </footer>
</body>
</html>









