CREATE TABLE IF NOT EXISTS Usuario (
	id_usuario  INT(10) NOT NULL AUTO_INCREMENT,
	contrasena  VARCHAR(100) NOT NULL,
	nick  VARCHAR(50) NOT NULL,
	correo VARCHAR(50) NOT NULL,
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
	informacion VARCHAR(250) NOT NULL,
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
  nombreNC VARCHAR(50) NOT NULL,
  contrasenaNC VARCHAR(100) NOT NULL,
  emailNC VARCHAR(50) NOT NULL,
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
INSERT INTO Autor (nombre, informacion) VALUES('camaron','Fue un cantaor gitano español considerado una de las principales figuras del flamenco.');
INSERT INTO Autor (nombre, informacion) VALUES('la excepcion', "La excepción que confirma la regla, fue un grupo español de rap originario del barrio de Pan Bendito, en el distrito de Carabanchel, Madrid. Estuvo compuesto por los MC's El Langui y Gitano Antón  y por el DJ La Dako Style . ");
INSERT INTO Autor (nombre, informacion) VALUES('los delinquentes', 'Los Delinqüentes fue un grupo musical andaluz, originario de Jerez de la Frontera (Cádiz), formado en 1998 por Miguel Ángel Benítez Gómez "Er Migue" y Marcos del Ojo "Er Canijo de Jeré", a los que se uniría posteriormente Diego Pozo "Er Ratón".');
/**************************************************************************************************************************************/
/* Autores repetidos */
INSERT INTO Autor (nombre, informacion) VALUES('camaron - copia', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('la excepcion - copia', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('los delinquentes - copia', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('camaron - copia (2)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('la excepcion - copia (2)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('los delinquentes - copia (2)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('camaron - copia (3)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('la excepcion - copia (3)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('los delinquentes - copia (3)', 'informacion de copia');
INSERT INTO Autor (nombre, informacion) VALUES('michael jackson', 'El Rey del Pop.​');


/* --- Disco --- */
	/* camaron */
INSERT INTO Disco (nombre) VALUES('caminito de totana');
INSERT INTO Disco (nombre) VALUES('reencuentro');
INSERT INTO Disco (nombre) VALUES('soy caminante');
	/* la excepcion */
INSERT INTO Disco (nombre) VALUES('aguantando el tiron');
INSERT INTO Disco (nombre) VALUES('la verdad mas verdadera');
	/* los delinquentes */
INSERT INTO Disco (nombre) VALUES('arquitectura del aire en la calle');
INSERT INTO Disco (nombre) VALUES('extras');


/* --- Estilo --- */
INSERT INTO Estilo (nombre) VALUES('flamenco');
INSERT INTO Estilo (nombre) VALUES('rap');
INSERT INTO Estilo (nombre) VALUES('rock');
INSERT INTO Estilo (nombre) VALUES('jazz');
INSERT INTO Estilo (nombre) VALUES('pop');

/* --- Cancion --- */
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito de totana',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hermanito mio',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que no se quita con na',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('dame un poquito de agua',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la jaca que yo tenia',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a la sombra de un laurel',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('quisiera volverme pulga',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('salud antes que dinero',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('busco yo mi solea',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a un sabio le oi decir',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las espinas de una flor',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las doce acaban de dar',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por tangos',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la saeta',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('solea del chaqueta',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hombre terrestre',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la virgen hizo una sopa',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a dibujar esta rosa',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('soy fraguero',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las 12 acaban de dar',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vibora rabiosa',CURRENT_DATE,2,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el caminante',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('reniego haberte encontrado',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vida es una ilusion',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las penas de mi mare',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me olvidaste, te olvide',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que desgraciaitos son',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que camina noche y dia',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('se pelean en mi mente',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me dieron una ocasion',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mira que bonitas son',CURRENT_DATE,3,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 1',CURRENT_DATE,4,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 2',CURRENT_DATE,4,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 3',CURRENT_DATE,4,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 4',CURRENT_DATE,4,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('en fuerza fisica',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('ruina',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asintiendo la perdicion',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('carmela pasteles',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('santo devoto',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('no es la solucion',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('su suerte',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asin ke',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 2',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la misma istoria, sin h',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('azoteas',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('siempre sostenerse',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('perfil blanco payo',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 3',CURRENT_DATE,5,2,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,3,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,3,3);
/**************************************************************************************************************************************/

/* Canciones repetidas */
/**/
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito de totana',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hermanito mio',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que no se quita con na',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('dame un poquito de agua',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la jaca que yo tenia',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a la sombra de un laurel',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('quisiera volverme pulga',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('salud antes que dinero',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('busco yo mi solea',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a un sabio le oi decir',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las espinas de una flor',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las doce acaban de dar',CURRENT_DATE,1,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por tangos',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la saeta',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('solea del chaqueta',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hombre terrestre',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la virgen hizo una sopa',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a dibujar esta rosa',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('soy fraguero',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las 12 acaban de dar',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vibora rabiosa',CURRENT_DATE,2,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el caminante',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('reniego haberte encontrado',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vida es una ilusion',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las penas de mi mare',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me olvidaste, te olvide',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que desgraciaitos son',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que camina noche y dia',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('se pelean en mi mente',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me dieron una ocasion',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mira que bonitas son',CURRENT_DATE,3,4,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 1',CURRENT_DATE,4,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 2',CURRENT_DATE,4,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 3',CURRENT_DATE,4,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 4',CURRENT_DATE,4,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('en fuerza fisica',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('ruina',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asintiendo la perdicion',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('carmela pasteles',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('santo devoto',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('no es la solucion',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('su suerte',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asin ke',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 2',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la misma istoria, sin h',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('azoteas',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('siempre sostenerse',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('perfil blanco payo',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 3',CURRENT_DATE,5,5,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,6,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,6,3);
/**/
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito de totana',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hermanito mio',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que no se quita con na',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('dame un poquito de agua',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la jaca que yo tenia',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a la sombra de un laurel',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('quisiera volverme pulga',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('salud antes que dinero',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('busco yo mi solea',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a un sabio le oi decir',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las espinas de una flor',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las doce acaban de dar',CURRENT_DATE,1,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por tangos',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la saeta',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('solea del chaqueta',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hombre terrestre',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la virgen hizo una sopa',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a dibujar esta rosa',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('soy fraguero',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las 12 acaban de dar',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vibora rabiosa',CURRENT_DATE,2,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el caminante',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('reniego haberte encontrado',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vida es una ilusion',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las penas de mi mare',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me olvidaste, te olvide',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que desgraciaitos son',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que camina noche y dia',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('se pelean en mi mente',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me dieron una ocasion',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mira que bonitas son',CURRENT_DATE,3,7,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 1',CURRENT_DATE,4,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 2',CURRENT_DATE,4,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 3',CURRENT_DATE,4,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 4',CURRENT_DATE,4,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('en fuerza fisica',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('ruina',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asintiendo la perdicion',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('carmela pasteles',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('santo devoto',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('no es la solucion',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('su suerte',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asin ke',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 2',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la misma istoria, sin h',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('azoteas',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('siempre sostenerse',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('perfil blanco payo',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 3',CURRENT_DATE,5,8,2);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,9,3);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,9,3);
/**/
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito de totana',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hermanito mio',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que no se quita con na',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('dame un poquito de agua',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la jaca que yo tenia',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a la sombra de un laurel',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('quisiera volverme pulga',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('salud antes que dinero',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('busco yo mi solea',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a un sabio le oi decir',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las espinas de una flor',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las doce acaban de dar',CURRENT_DATE,1,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por tangos',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la saeta',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('solea del chaqueta',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hombre terrestre',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la virgen hizo una sopa',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a dibujar esta rosa',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('soy fraguero',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las 12 acaban de dar',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vibora rabiosa',CURRENT_DATE,2,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el caminante',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('reniego haberte encontrado',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vida es una ilusion',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las penas de mi mare',CURRENT_DATE,3,10,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me olvidaste, te olvide',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que desgraciaitos son',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que camina noche y dia',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('se pelean en mi mente',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me dieron una ocasion',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mira que bonitas son',CURRENT_DATE,3,10,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 1',CURRENT_DATE,4,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 2',CURRENT_DATE,4,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 3',CURRENT_DATE,4,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 4',CURRENT_DATE,4,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('en fuerza fisica',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('ruina',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asintiendo la perdicion',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('carmela pasteles',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('santo devoto',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('no es la solucion',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('su suerte',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asin ke',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 2',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la misma istoria, sin h',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('azoteas',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('siempre sostenerse',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('perfil blanco payo',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 3',CURRENT_DATE,5,11,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,12,4);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,13,5);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,13,5);











/* --- Usuario --- */
INSERT INTO Usuario (contrasena,nick,correo) VALUES ("1234","Javier","moyano_07@hotmail.com");
INSERT INTO Usuario (contrasena,nick,correo) VALUES ("1234","Pablo","ratapam@gmail.com");

/* --- Administradores --- */
INSERT INTO Administradores (contrasena, nombre) VALUES ("admin", "Javier1");
INSERT INTO Administradores (contrasena, nombre) VALUES ("admin", "Pablo1");


/*

INSERT INTO Autor (nombre) VALUES('Amaral');
INSERT INTO Autor (nombre) VALUES('Manolo Garcia');

INSERT INTO Disco (nombre) VALUES('Pajaros en la cabeza');
INSERT INTO Disco (nombre) VALUES('Arena En Los bolsillos');

	 Amaral 
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('El Universo Sobre Mi',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Dias de verano',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Revolucion',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mi alma perdida',CURRENT_DATE,1,1,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Marta, Sebas, Guille y Los Demas',CURRENT_DATE,1,1,1);

	 Manolo Garcia 
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Prefiero El Trapecio',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Carbon Y Ramas Secas',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Del Bosque De Tu Alegria',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Pajaros De Barro',CURRENT_DATE,2,2,1);
INSERT INTO Cancion (nombre,fecha_alta,id_disco,id_autor,id_estilo) VALUES('Sobre el Oscuro Abismo En Que Te Meces',CURRENT_DATE,2,2,1);

*/