

/* --   Consultas Login -- */

select alias,contrasena from usuario;

select email,contrasena from usuario;

/* -- Consultas Pagina Principal -- */

	/* Pulsando Logotipo (pagina home) */

		/*Novedades*/
		select Disco.nombre from Disco where id_disco=(select id_disco from Cancion order by fecha); 

		/*Escuchado Recientemente*/
		select Disco.nombre from Disco where id_disco=(select id_disco from lista_de_reproduccion);

		/*Estilos*/
		select nombre from Estilo;


	/* Pulsando perfil */

	select * from usuario where id_usuario = $id_usuario;
	select * from usuario where alias = $alias;

	/* Pulsando Buscador */

	select nombre from Artista where nombre = $buscado;

	select nombre from Disco where nombre = $buscado;

	select nombre from Cancion where nombre = $buscado;

	/* Biblioteca */

	select * from lista_de_reproduccion where id_usuario =$id_usuario;


/* Consultas Home */

SELECT Cancion.nombre, Disco.nombre , Autor.nombre , Estilo.nombre FROM Cancion, Disco, Autor
WHERE Disco.id_disco = Cancion.id_disco AND Cancion.id_autor = Autor.id_autor and Cancion.id_cancion = $pulsado;

