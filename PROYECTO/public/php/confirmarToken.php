<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Confirmar token</title>
</head>
<body>
    <h3>
        <form action="procesaToken.php" method="get">
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