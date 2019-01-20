<?php
if (isset($_POST['alias'])) {
    echo '
    <form action="get">
        <input type="button" name="tokken" value="'.$tokken.'">
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
<form action="get">
        <input type="button" name="tokken" value="'.$tokken.'">
    </form>
</body>
</html>