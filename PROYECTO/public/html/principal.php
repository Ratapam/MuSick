<?php 
session_start();
if(isset($_SESSION['logeado'])){
  $_SESSION['logeado'] == true;
}else{
  header('refresh:2,../html/login.php');
  die();
}
?>
<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Principal</title>
  <link href="../css/principal.css" rel="stylesheet">
  <link href="../css/minibootstrap.css" rel="stylesheet">
  <style>
</style>
<script>
  /* -- Eventos click en perfil buscar y logo --
  let div1 = document.querySelector('header > div > div:nth-of-type(1)');

  let div3 = document.querySelector('header > div > div:nth-of-type(3)');

  div1.document.addEventListener('click',cambiarIframe);

  div3.document.addEventListener('click',cambiarIframe);
*/

  </script>
</head>
<body>
  <header>
    <div class="row">
      <div class="col-4"><span><img src="../img/logo.png"></span></div>
      <div class="col-4">
        <input type="text" onkeypress= "if(event.keyCode == 13) cambiarIframe4()"  placeholder="Buscar..." autofocus />
      </div>
      <div class="col-4"><span>
        <img src="../img/usu.png">
      </span>
      </div>
  </div>
  </header>
  <main class="container">
    <iframe id="iframe" src="../php/home.php"></iframe>
  </main>
<footer>
    <div id="reproductor">
      <div class="col-12 col-sm-12 col-lg-3">
        <button type="button" id="biblioteca">
          <a href="biblioteca.html"></a>
          <img src="../img/imgReproductor/library.png">
        </button>
        <button type="button" id="play"><img src="../img/imgReproductor/play.png"></button>
        <button type="button" id="pause"><img src="../img/imgReproductor/pause.png"></button>
        <button type="button" id="stop"><img src="../img/imgReproductor/stop.png"></button>
      </div>
      <div class="col-12 col-sm-12 col-lg-5">
        <img src="../img/imgReproductor/tiempo.png">
        <input type="range" id="time" step=".1" min="0" max="0" value="0" style="width: 20em">
      </div>
      <div class="col-12 col-sm-12 col-lg-4">
          <img src="../img/imgReproductor/volumen.png"/>
          <input type="range" id="volume" step=".1" min="0" max="1" value="1" style="width: 5em">
      </div>
    <audio id="audio">
      <source src="../musica/cancion1.mp3" type="audio/mpeg" />
      Tu navegador no es compatible.
    </audio>
  </div>
</footer>
</body>
 <script src="../js/principal.js"></script>
</html>
