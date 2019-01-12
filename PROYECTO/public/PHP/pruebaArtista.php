<?php 

    const $artistas = [
        001 => "michael_jackson", 
        002 => "amaral", 
        003 => "manolo_garcía"];
    const $discos = [
        001 => [
            001 => "Got to Be There (1972)",
            002 => "Ben (1972)",
            003 => "Music and Me (1973)",
            004 => "Forever, Michael (1975)",
            005 => "Off the Wall (1979)",
            006 => "Thriller (1982)",
            007 => "Bad (1987)",
            008 => "Dangerous (1991)",
            009 => "HIStory: Past, Present and Future, Book I (1995)",
            010 => "Blood on the Dance Floor: HIStory in the Mix (1997)",
            011 => "Invincible (2001)"
        ]
    ];
    const $cancionesDisco = [
        001 => [
            001 => [
                001 => ["Ain't No Sunshine", "4:33"],
                002 => ["I Wanna Be Where You Are", "2:23"],
                003 => ["Girl Don't Take Your Love from Me", "2:27"],
                004 => ["In Our Small Way", "4:36"],
                005 => ["Got to Be There", "5:23"],
                006 => ["Rockin' Robin", "2:35"],
                007 => ["Wings of My Love", "2:13"],
                008 => ["Maria (You Were the Only One)", "3:35"],
                009 => ["Love Is Here and Now You're Gone", "2:49"],
                010 => ["You've Got a Friend", "4:11"]
            ],
            002 => [
                001 => ["Wanna Be Startin 'Somethin'", "5:34"],
                002 => ["Baby Be Mine", "2:28"],
                003 => ["The Girl Is Mine", "5:11"],
                004 => ["Thriller", "4:56"],
                005 => ["Beat It", "7:22"],
                006 => ["Billie Jean", "3:43"],
                007 => ["Human Nature", "2:44"],
                008 => ["P.Y.T. (Pretty Young Thing)", "1:34"],
                009 => ["The Lady in My Life", "4:59"]
            ]
       ]
    ];
    const $informacionArtista = [
        001 => [
            "Michael Joseph Jackson​ (Gary, Indiana; 29 de agosto de 1958-Los Ángeles, 
            California; 25 de junio de 2009) fue un cantante, compositor, productor discográfico, 
            bailarín, actor y filántropo estadounidense.​ Conocido como el «Rey del Pop»,​ 
            sus contribuciones y reconocimiento en la historia de la música y el baile, 
            así como su publicitada vida personal, lo convirtieron en una figura internacional 
            en la cultura popular durante más de cuatro décadas. Es reconocido como la estrella 
            de música pop más exitosa en el mundo.​ Sin embargo, su música incluyó una amplia 
            acepción de subgéneros como el rhythm and blues (soul y funk), rock, disco y dance."
        ]
    ];

    function mostrarDatosArtista(int $id_artista) {
        echo '
        <div class="fotoArtista">            
        <img src="../img/artistas/'.strtoupper(str_replace("_", " ", $artistas[$id_artista])).'.png">
        <div id="texto">
        '.$informacionArtista[$id_artista].'
        </div>
        </div>
        ';
    }

    function mostrarDiscos(int $id_artista) {
        echo '
        <div class="discos">
        ';
        foreach ($discos[$id_artista] as $id_disco => $nombreDisco) {
            echo '
            <table>
            <thead>
            <tr>
            <th>'.$nombreDisco.'</th>
            </tr>
            <th>DURACIÓN</th>
            <th>CANCIONES</th>
            <th>GUARDAR EN BIBLIOTECA</th>
            </tr>
            </thead>
            ';
            mostrarCanciones($id_disco);
            echo '</table>';
        }
        echo '</div>';
    }

    function mostrarCanciones(int $id_disco) {
        echo '<tr>';
        foreach ($cancionesDisco[$id_disco] as $id_cancion => $cancion) {
            echo '
            <td>'.$cancion[1].'</td>
            <td>'.$cancion[0].'</td>
            <td><img src="../img/mas.png"></td>           
            ';
        }
        echo '</tr>';
    }

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/minibootstrap.css">
    <link rel="stylesheet" href="../css/artista.css">
    <title>Document</title>
</head>
<body>
    <main>
        <?php

            // if (isset($_GET["id_artista"])) {
                mostrarDatosArtista($_GET["id_artista"]);
                mostarDiscos($_GET["id_artista"]);
            // } else {
            //     header('Location: ../PHP/principal.php');
            // }
        ?>
    </main>
</body>
</html>