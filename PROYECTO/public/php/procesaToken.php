<?php

function generateToken($length = 30)
{
    return bin2hex(random_bytes($length));
}





if (isset($_POST)) {
    $token = generateToken();
    echo '
    <form action="../html/principal.html" method="GET">
        <input type="submit" name="tokken" value="'.$token.'">
    </form>
    ';

}



?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tokken</title>
</head>
<body>

</body>
</html>