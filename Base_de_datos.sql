DROP TABLE IF EXISTS Usuario CASCADE CONSTRAINTS;
CREATE TABLE Usuario (
	 Id_usuario  varchar(40) NOT NULL  ,
	 contrasena  varchar(40) NOT NULL ,
	 nombre  varchar(40) NOT NULL ,
	 apellidos  varchar(40) NOT NULL ,
	 edad  int(120) NOT NULL ,
	 alias  varchar(50) NOT NULL,
	PRIMARY KEY ( Id_usuario ,  contrasena )
);


DROP TABLE IF EXISTS Disco CASCADE CONSTRAINTS;

 CREATE TABLE Disco (
	 id_disco  varchar(40) NOT NULL  ,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_disco )
);

DROP TABLE IF EXISTS Autor CASCADE CONSTRAINTS; 

CREATE TABLE Autor (
	 id_autor  varchar(40) NOT NULL  ,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_autor )
);

DROP TABLE IF EXISTS Estilo CASCADE CONSTRAINTS;

 CREATE TABLE Estilo (
	 id_estilo  varchar(40) NOT NULL  ,
	 nombre  varchar(40) NOT NULL,
	PRIMARY KEY ( id_estilo )
);


DROP TABLE IF EXISTS Cancion CASCADE CONSTRAINTS;
CREATE TABLE Cancion (
	 id_cancion  int(120) NOT NULL  ,
	 nombre  varchar(40) NOT NULL ,
	 fecha_alta  DATE NOT NULL,
	 id_disco  varchar(40) NOT NULL,
	 id_autor  varchar(40) NOT NULL ,
	 id_estilo  varchar(40) NOT NULL,
	PRIMARY KEY ( id_cancion )
);

ALTER TABLE  Cancion   ADD CONSTRAINT Cancion_fk0  FOREIGN KEY ( id_disco ) REFERENCES  Disco  ( id_disco );

ALTER TABLE  Cancion   ADD CONSTRAINT Cancion_fk1  FOREIGN KEY ( id_autor ) REFERENCES  Autor  ( id_autor );

ALTER TABLE  Cancion  ADD CONSTRAINT Cancion_fk2  FOREIGN KEY ( id_estilo ) REFERENCES  Estilo  ( id_estilo );


DROP TABLE IF EXISTS Escuchado_recientemente CASCADE CONSTRAINTS;

 CREATE TABLE Escuchado_recientemente (
	 Id_usuario  varchar(40) NOT NULL ,
	 fecha  DATE NOT NULL ,
	 id_cancion  varchar(40) NOT NULL ,
	PRIMARY KEY ( Id_usuario )
);

ALTER TABLE  Escuchado_recientemente   ADD CONSTRAINT Escuchado_recientemente_fk0  FOREIGN KEY ( Id_usuario ) REFERENCES  Usuario  ( Id_usuario );

ALTER TABLE  Escuchado_recientemente   ADD CONSTRAINT Escuchado_recientemente_fk1  FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion );


DROP TABLE IF EXISTS Lista_reproduccion CASCADE CONSTRAINTS;

 CREATE TABLE Lista_reproduccion (
	 id_lista  varchar(40) NOT NULL,
	 nombre  varchar(40) ,
	 id_usuario  varchar(40) NOT NULL,
	 id_cancion  varchar(40) NOT NULL,
	PRIMARY KEY ( id_lista )
);

ALTER TABLE  Lista_reproduccion   ADD CONSTRAINT Lista_reproduccion_fk0  FOREIGN KEY ( id_usuario ) REFERENCES  Usuario  ( Id_usuario );

ALTER TABLE  Lista_reproduccion   ADD CONSTRAINT Lista_reproduccion_fk1  FOREIGN KEY ( id_cancion ) REFERENCES  Cancion  ( id_cancion );

DROP TABLE IF EXISTS Administradores CASCADE CONSTRAINTS;

 CREATE TABLE Administradores (
	 Id_administrador  varchar(40) NOT NULL ,
	 contrasena  varchar(40) NOT NULL ,
	PRIMARY KEY ( Id_administrador )
);



