<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h3>Por favor, pulsa para confirmar tu cuenta de usuario en <strong> "Musick" </strong></h3>
    <h3>
        <form action="../index.php" method="get">
            <input type="hidden" name="id_usuarioNC" value="<?php 
                    if (isset($_GET['id_usuarioNC'])) {
                        echo $_GET['id_usuarioNC']; 
                    } else {
                        header('Location: login.php');
                        die();
                    }    
                ?>">
            <input type="submit" name="token" value="<?php 
                    if (isset($_GET['token'])) {
                        echo $_GET['token'];
                    } else {
                        header('Location: login.php');
                        die();
                    } 
                ?>">
        </form>    
    </h3>
  </body>
</html>