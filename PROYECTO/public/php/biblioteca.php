<?php


$artistas = [
    "michael_jackson",
    "amaral",
    "manolo_garcía"
];

$discos = [
    "Got to Be There (1972)",
    "Ben (1972)",
    "Music and Me (1973)",
    "Forever, Michael (1975)",
    "Off the Wall (1979)",
    "Thriller (1982)",
    "Bad (1987)",
    "Dangerous (1991)",
    "HIStory: Past, Present and Future, Book I (1995)",
    "Blood on the Dance Floor: HIStory in the Mix (1997)",
    "Invincible (2001)"
];

$cancionesDisco = [
    1 => ["Ain't No Sunshine", "4:33"],
    2 => ["I Wanna Be Where You Are", "2:23"],
    3 => ["Girl Don't Take Your Love from Me", "2:27"],
    4 => ["In Our Small Way", "4:36"],
    5 => ["Got to Be There", "5:23"],
    6 => ["Rockin' Robin", "2:35"],
    7 => ["Wings of My Love", "2:13"],
    8 => ["Maria (You Were the Only One)", "3:35"],
    9 => ["Love Is Here and Now You're Gone", "2:49"],
    10 => ["You've Got a Friend", "4:11"],
    11 => ["Wanna Be Startin 'Somethin'", "5:34"],
    12 => ["Baby Be Mine", "2:28"],
    13 => ["The Girl Is Mine", "5:11"],
    14 => ["Thriller", "4:56"],
    15 => ["Beat It", "7:22"],
    16 => ["Billie Jean", "3:43"],
    17 => ["Human Nature", "2:44"],
    18 => ["P.Y.T. (Pretty Young Thing)", "1:34"],
    19 => ["The Lady in My Life", "4:59"],
    20 => ["Thriller", "4:56"],
    21 => ["Ain't No Sunshine", "4:33"],
    22 => ["I Wanna Be Where You Are", "2:23"],
    23 => ["Girl Don't Take Your Love from Me", "2:27"],
    24 => ["In Our Small Way", "4:36"],
    25 => ["Got to Be There", "5:23"],
    26 => ["Rockin' Robin", "2:35"],
    27 => ["Wings of My Love", "2:13"],
    28 => ["Maria (You Were the Only One)", "3:35"],
    29 => ["Love Is Here and Now You're Gone", "2:49"],
    30 => ["You've Got a Friend", "4:11"],
    31 => ["Wanna Be Startin 'Somethin'", "5:34"],
    32 => ["Baby Be Mine", "2:28"],
    33 => ["The Girl Is Mine", "5:11"],
    34 => ["Thriller", "4:56"],
    35 => ["Beat It", "7:22"],
    36 => ["Billie Jean", "3:43"],
    37 => ["Human Nature", "2:44"],
    38 => ["P.Y.T. (Pretty Young Thing)", "1:34"],
    39 => ["The Lady in My Life", "4:59"]
];


function mostrarListas() {
    echo '
    <h3>Tu lista de reproducción</h3>
    <div class="lista">
    <table>
    <thead id="cabecera">
    <tr>
    <th></th>
    <th>Canción</th>
    <th>Álbum</th>
    <th>Artista</th>
    <th></th>
    </tr>
    </thead>
    <tbody>
    ';
    mostrarCanciones();
    echo '
    </tbody>
    </table>
    </div>
    ';
}

function mostrarCanciones() {
    global $cancionesDisco;
    global $discos;
    global $artistas;
    foreach ($cancionesDisco as $id_cancion => $cancion) {
        echo '
        <tr>
        <td>'.$cancion[1].'</td>
        <td>'.$cancion[0].'</td>
        <td>'.$discos[rand(0, count($discos) - 1)].'</td>
        <td>'.ucwords(str_replace("_", " ", $artistas[rand(0, count($artistas) - 1)])).'</td>
        <td>
        <button type="button">
        <a href="#">
        <img src="../img/imgBiblioteca/papelera.png">
        </a>
        </button>
        </td>
        </tr>
        ';
    }
}

mostrarListas();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/minibootstrap.css">
    <link rel="stylesheet" href="../css/biblioteca.css">    
    <title>Biblioteca</title>
</head>
<body>
    
    
</body>
</html>