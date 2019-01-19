/* -------- Usuario -------- */

SELECT * FROM Usuario;

SELECT * FROM Usuario WHERE Id_usuario = $idUsuario;

SELECT contrasena FROM Usuario WHERE Id_usuario = $idUsuario;

SELECT * FROM Usuario WHERE contrasena = $contrasena;

SELECT * FROM Usuario WHERE alias = $alias;

SELECT * FROM Usuario WHERE alias = $alias AND contrasena = $contrasena;


/* -------- Disco -------- */

SELECT * FROM Disco;

SELECT *.Disco FROM Disco, Cancion WHERE id_disco.Disco = id_disco.Cancion;


/* -------- Autor -------- */

SELECT * FROM Autor;

SELECT *.Autor FROM Autor, Cancion WHERE id_autor.Autor = id_autor.Cancion;


/* -------- Estilo -------- */

SELECT * FROM Estilo;

SELECT *.Estilo FROM Estilo, Cancion WHERE id_estilo.Estilo = id_estilo.Cancion;


/* -------- Cancion -------- */

SELECT * FROM Cancion;

SELECT * FROM Cancion WHERE nombre = $nombre;

SELECT * FROM Cancion ORDER BY fecha_alta;

SELECT * FROM Cancion, Estilo WHERE id_estilo.Cancion = id_estilo.Estilo;

SELECT * FROM Cancion, Disco WHERE id_disco.Cancion = id_disco.Disco;



/* -------- Escuchado_recientemente -------- */

SELECT * FROM Escuchado_recientemente;

SELECT * FROM Escuchado_recientemente WHERE Id_usuario = $idUsuario ORDER BY fecha;


/* -------- Lista_reproduccion -------- */

SELECT * FROM Lista_reproduccion;

SELECT *.Lista_reproduccion FROM Lista_reproduccion, Usuario WHERE Id_usuario.Lista_reproduccion = Id_usuario.Usuario;


/* -------- Administradores -------- */

SELECT * FROM Administradores;

SELECT * FROM Administradores WHERE nombre = $nombre AND contrasena = $contrasena;



/* Cancion / Disco / Autor */

SELECT Cancion.nombre, Disco.nombre , Autor.nombre , Estilo.nombre FROM Cancion, Disco, Autor,Estilo WHERE Disco.id_disco = Cancion.id_disco AND Cancion.id_autor = Autor.id_autor
AND Estilo.id_estilo = Cancion.id_estilo;

/* --- Nombre Disco / Nombre Cancion / Nombre Estilo --- */

select Disco.nombre as Disco , Cancion.nombre as Cancion ,Estilo.nombre as Estilo from Disco,Cancion,Estilo where id_autor =(select id_autor from Autor where nombre='Manolo Garcia');
