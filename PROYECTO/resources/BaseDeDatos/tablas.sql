CREATE TABLE IF NOT EXISTS Usuario (
	id_usuario  INT(10) NOT NULL AUTO_INCREMENT,
	contrasena  VARCHAR(40) NOT NULL,
	nick  VARCHAR(50) NOT NULL,
	correo VARCHAR(250) NOT NULL,
	PRIMARY KEY (id_usuario, contrasena)
);

CREATE TABLE IF NOT EXISTS Disco (
	id_disco INT(10) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_disco)
);

CREATE TABLE IF NOT EXISTS Autor (
	id_autor INT(10) NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_autor)
);

CREATE TABLE IF NOT EXISTS Estilo (
	id_estilo INT(10) NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_estilo)
);

CREATE TABLE IF NOT EXISTS Cancion (
	id_cancion INT(10) NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(40) NOT NULL,
	fecha_alta DATE NOT NULL,
	id_disco INT(10) NOT NULL,
	id_autor INT(10) NOT NULL ,
	id_estilo INT(10) NOT NULL,
	PRIMARY KEY (id_cancion),
	FOREIGN KEY (id_disco) REFERENCES Disco (id_disco),
	FOREIGN KEY (id_autor) REFERENCES Autor (id_autor),
	FOREIGN KEY (id_estilo) REFERENCES Estilo (id_estilo)
);

CREATE TABLE IF NOT EXISTS Escuchado_recientemente (
	id_usuario INT(10) NOT NULL,
	id_cancion INT(10) NOT NULL,
	fecha DATE NOT NULL,
	PRIMARY KEY (id_usuario ,id_cancion),
	FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
	FOREIGN KEY (id_cancion) REFERENCES Cancion (id_cancion)
);

CREATE TABLE IF NOT EXISTS Lista_reproduccion  (
	id_lista INT(10) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40),
	id_usuario INT(10) NOT NULL,
	id_cancion INT(10) NOT NULL,
	PRIMARY KEY (id_lista),
	FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
	FOREIGN KEY (id_cancion) REFERENCES Cancion (id_cancion)
);

CREATE TABLE IF NOT EXISTS Administradores  (
	id_administrador INT(10) NOT NULL AUTO_INCREMENT,
	contrasena VARCHAR(40) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_administrador)
);

CREATE TABLE UsuariosNC (
  id_usuarioNC INTEGER(10) AUTO_INCREMENT,
  nombreNC VARCHAR(30) NOT NULL,
  contrasenaNC VARCHAR(100) NOT NULL,
  emailNC VARCHAR(40) NOT NULL,
  UNIQUE(emailNC),
  PRIMARY KEY (id_usuarioNC)
);

CREATE TABLE IF NOT EXISTS Token  (
	id_usuario  INT(10) NOT NULL,
	tipoToken VARCHAR (50) NOT NULL,
	token VARCHAR (60) NOT NULL,
	fecha_expira DATE NOT NULL,
	PRIMARY KEY (id_usuario)
);



/*********************************************************/

/* --- Autor --- */
INSERT INTO Autor (nombre) VALUES('Amaral');
INSERT INTO Autor (nombre) VALUES('Manolo Garcia');

/* --- Disco --- */
INSERT INTO Disco (nombre) VALUES('Pajaros en la cabeza');
INSERT INTO Disco (nombre) VALUES('Arena En Los bolsillos');

/* --- Estilo --- */
INSERT INTO Estilo (nombre) VALUES('Pop');

/* --- Administradores --- */
INSERT INTO Administradores (contrasena, nombre) VALUES ("admin", "Javier");
INSERT INTO Administradores (contrasena, nombre) VALUES ("admin", "Pablo");

/* --- Cancion --- */
	/* Amaral */
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('El Universo Sobre Mi',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Dias de verano',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Revolucion',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mi alma perdida',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Marta, Sebas, Guille y Los Demas',CURRENT_DATE,1,1,1);

	/* Manolo Garcia */
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Prefiero El Trapecio',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Carbon Y Ramas Secas',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Del Bosque De Tu Alegria',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Pajaros De Barro',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Sobre el Oscuro Abismo En Que Te Meces',CURRENT_DATE,2,2,1);

/* --- Usuario --- */
INSERT INTO Usuario (contrasena,nick,correo) VALUES ("1234","Javier","moyano_07@hotmail.com");
INSERT INTO Usuario (contrasena,nick,correo) VALUES ("1234","Pablo","ratapam@gmail.com");

/* --- Token --- */
INSERT INTO Token (token, id_usuario, fecha_expira) VALUES("1234567890987654321a", 1, SYSDATE() + 1);
INSERT INTO Token (token, id_usuario, fecha_expira) VALUES("1234567890987654321b", 2, SYSDATE() + 1);
