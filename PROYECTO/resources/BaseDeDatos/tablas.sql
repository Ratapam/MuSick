
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
	 id_disco  int(10) NOT NULL,
	 id_autor  int(10) NOT NULL ,
	 id_estilo  int(10) NOT NULL,
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

/* --- Autores --- */

INSERT INTO Autor (nombre) VALUES('Amaral');
INSERT INTO Autor (nombre) VALUES('Manolo Garcia');


INSERT INTO Disco (nombre) VALUES('Pajaros en la cabeza');

INSERT INTO Disco (nombre) VALUES('Arena En Los bolsillos');


INSERT INTO Estilo (nombre) VALUES('Pop');


/* --- Amaral --- */
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('El Universo Sobre Mi',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Dias de verano',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Revolucion',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mi alma perdida',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Marta, Sebas, Guille y Los Demas',CURRENT_DATE,1,1,1);

/* --- Manolo Garcia --- */
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Prefiero El Trapecio',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Carbon Y Ramas Secas',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Del Bosque De Tu Alegria',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Pajaros De Barro',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Sobre el Oscuro Abismo En Que Te Meces',CURRENT_DATE,2,2,1);

/* --- Usuarios --- */
INSERT INTO Usuario (id_usuario,contrasena,nombre,nombre,apellidos,edad,alias) VALUES ("1234","Javier","Moyano",31,"Javier");
INSERT INTO Usuario (id_usuario,contrasena,nombre,nombre,apellidos,edad,alias) VALUES ("1234","Pablo","Alvarez",33,"Pablo");
