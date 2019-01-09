
CREATE TABLE IF NOT EXISTS Usuario  (
	 id_usuario  int(10) NOT NULL AUTO_INCREMENT,
	 contrasena  varchar(40) NOT NULL ,
	 nombre  varchar(40) NOT NULL ,
	 apellidos  varchar(40) NOT NULL ,
	 edad  int(120) NOT NULL ,
	 alias  varchar(50) NOT NULL,
	PRIMARY KEY ( Id_usuario ,  contrasena )
);




 CREATE TABLE IF NOT EXISTS Disco (
	 id_disco  int(10) NOT NULL AUTO_INCREMENT,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_disco )
);



CREATE TABLE IF NOT EXISTS Autor  (
	 id_autor  INT(10) NOT NULL AUTO_INCREMENT ,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_autor )
);



 CREATE TABLE IF NOT EXISTS Estilo  (
	 id_estilo  INT(10) NOT NULL AUTO_INCREMENT ,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_estilo )
);



CREATE TABLE IF NOT EXISTS Cancion (
	 id_cancion INT(10) NOT NULL AUTO_INCREMENT ,
	 nombre  varchar(40) NOT NULL ,
	 fecha_alta  DATE NOT NULL,
	 id_disco  varchar(40) NOT NULL,
	 id_autor  varchar(40) NOT NULL ,
	 id_estilo  varchar(40) NOT NULL,
	PRIMARY KEY ( id_cancion ),
	FOREIGN KEY ( id_disco ) REFERENCES  Disco  ( id_disco ),
	FOREIGN KEY ( id_autor ) REFERENCES  Autor  ( id_autor ),
	FOREIGN KEY ( id_estilo ) REFERENCES  Estilo  ( id_estilo )
);

/*ALTER TABLE  Cancion   ADD  FOREIGN KEY ( id_disco ) REFERENCES  Disco  ( id_disco );

ALTER TABLE  Cancion   ADD CONSTRAINT Cancion_fk1  FOREIGN KEY ( id_autor ) REFERENCES  Autor  ( id_autor );

ALTER TABLE  Cancion  ADD CONSTRAINT Cancion_fk2  FOREIGN KEY ( id_estilo ) REFERENCES  Estilo  ( id_estilo );*/




 CREATE TABLE IF NOT EXISTS Escuchado_recientemente (
	 Id_usuario  INT(10) NOT NULL ,
	 id_cancion  INT(10) NOT NULL ,
	 fecha  DATE NOT NULL ,
	PRIMARY KEY ( Id_usuario ,id_cancion),
	FOREIGN KEY ( Id_usuario ) REFERENCES  Usuario  ( Id_usuario ),
	FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion )
);

/*ALTER TABLE  Escuchado_recientemente   ADD CONSTRAINT Escuchado_recientemente_fk0  FOREIGN KEY ( Id_usuario ) REFERENCES  Usuario  ( Id_usuario );

ALTER TABLE  Escuchado_recientemente   ADD CONSTRAINT Escuchado_recientemente_fk1  FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion );

*/


 CREATE TABLE IF NOT EXISTS Lista_reproduccion  (
	 id_lista  INT(10) NOT NULL AUTO_INCREMENT,
	 nombre  varchar(40) ,
	 id_usuario  INT(10) NOT NULL,
	 id_cancion  INT(10) NOT NULL,
	 PRIMARY KEY ( id_lista ),
	 FOREIGN KEY ( Id_usuario ) REFERENCES  Usuario  ( Id_usuario ),
	 FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion )
);

/*
ALTER TABLE  Lista_reproduccion   ADD CONSTRAINT Lista_reproduccion_fk0  FOREIGN KEY ( id_usuario ) REFERENCES  Usuario  ( Id_usuario );

ALTER TABLE  Lista_reproduccion   ADD CONSTRAINT Lista_reproduccion_fk1  FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion );
*/


 CREATE TABLE  IF NOT EXISTS Administradores  (
	 Id_administrador  INT(40) NOT NULL AUTO_INCREMENT,
	 contrasena  varchar(40) NOT NULL,
	 nombre varchar(40) NOT NULL,
	PRIMARY KEY ( Id_administrador )
);
