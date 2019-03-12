CREATE TABLE IF NOT EXISTS usuario (
	id_usuario  INT(10) NOT NULL AUTO_INCREMENT,
	nick  VARCHAR(50) NOT NULL,
	contrasena  VARCHAR(100) NOT NULL,	
	correo VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_usuario, contrasena)
);

CREATE TABLE IF NOT EXISTS disco (
	id_disco INT(10) NOT NULL AUTO_INCREMENT,
	nombre_disco VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_disco)
);

CREATE TABLE IF NOT EXISTS autor (
	id_autor INT(10) NOT NULL AUTO_INCREMENT ,
	nombre_autor VARCHAR(40) NOT NULL,
	informacion VARCHAR(250) NOT NULL,
	PRIMARY KEY (id_autor)
);

CREATE TABLE IF NOT EXISTS estilo (
	id_estilo INT(10) NOT NULL AUTO_INCREMENT ,
	nombre_estilo VARCHAR(40) NOT NULL,
	PRIMARY KEY (id_estilo)
);

CREATE TABLE IF NOT EXISTS cancion (
	id_cancion INT(10) NOT NULL AUTO_INCREMENT ,
	nombre_cancion VARCHAR(40) NOT NULL,
	fecha_alta DATE NOT NULL,
	id_disco INT(10) NOT NULL,
	id_autor INT(10) NOT NULL ,
	id_estilo INT(10) NOT NULL,
	PRIMARY KEY (id_cancion),
	FOREIGN KEY (id_disco) REFERENCES disco (id_disco),
	FOREIGN KEY (id_autor) REFERENCES autor (id_autor),
	FOREIGN KEY (id_estilo) REFERENCES estilo (id_estilo)
);

CREATE TABLE IF NOT EXISTS escuchado_recientemente (
	id_escuchado_recientemente INT(10) NOT NULL AUTO_INCREMENT ,
	id_usuario INT(10) NOT NULL,
	id_cancion INT(10) NOT NULL,
	fecha DATE NOT NULL,
	PRIMARY KEY (id_escuchado_recientemente),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	FOREIGN KEY (id_cancion) REFERENCES cancion (id_cancion)
);

CREATE TABLE IF NOT EXISTS lista_reproduccion  (
	id_lista_reproduccion INT(10) NOT NULL AUTO_INCREMENT,
	id_usuario INT(10) NOT NULL,
	id_cancion INT(10) NOT NULL,
	PRIMARY KEY (id_lista_reproduccion),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	FOREIGN KEY (id_cancion) REFERENCES cancion (id_cancion)
);

CREATE TABLE IF NOT EXISTS administrador  (
	id_administrador INT(10) NOT NULL AUTO_INCREMENT,
	contrasena VARCHAR(40) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	PRIMARY KEY (disco)
);

CREATE TABLE usuariosNC (
  id_usuarioNC INTEGER(10) AUTO_INCREMENT,
  nombreNC VARCHAR(50) NOT NULL,
  contrasenaNC VARCHAR(100) NOT NULL,
  emailNC VARCHAR(50) NOT NULL,
  UNIQUE(emailNC),
  PRIMARY KEY (id_usuarioNC)
);

CREATE TABLE IF NOT EXISTS token  (
	id_usuario  INTEGER(10) NOT NULL,
	tipoToken VARCHAR (50) NOT NULL,
	token VARCHAR (60) NOT NULL,
	fecha_expira DATE NOT NULL,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS recuerdame (
	id_usuario INT(10) NOT NULL,
	token VARCHAR(60) NOT NULL,
	PRIMARY KEY (id_usuario)
);



/*********************************************************/

/* --- usuario --- */
INSERT INTO usuario (contrasena,nick,correo) VALUES ("$argon2i$v=19$m=1024,t=2,p=2$Wi94eW5tcS5PQmE4aUhOTw$62BsoF2CtaBkBdMHXpj5GwlDtCd4EFiYkbiOUbsc0nA","Javier","moyano_07@hotmail.com");
INSERT INTO usuario (contrasena,nick,correo) VALUES ("$argon2i$v=19$m=1024,t=2,p=2$Wi94eW5tcS5PQmE4aUhOTw$62BsoF2CtaBkBdMHXpj5GwlDtCd4EFiYkbiOUbsc0nA","Pablo","ratapam@gmail.com");
INSERT INTO usuario (contrasena,nick,correo) VALUES ("$argon2i$v=19$m=1024,t=2,p=2$Wi94eW5tcS5PQmE4aUhOTw$62BsoF2CtaBkBdMHXpj5GwlDtCd4EFiYkbiOUbsc0nA","Kevin","kevin@gmail.com"); 
INSERT INTO usuario (contrasena,nick,correo) VALUES ("$argon2i$v=19$m=1024,t=2,p=2$Wi94eW5tcS5PQmE4aUhOTw$62BsoF2CtaBkBdMHXpj5GwlDtCd4EFiYkbiOUbsc0nA","Guillen","guillen@gmail.com"); 

/* --- Administradores --- */
INSERT INTO administrador (contrasena, nombre) VALUES ("admin", "Javier1");
INSERT INTO administrador (contrasena, nombre) VALUES ("admin", "Pablo1");



/* --- autor --- */
INSERT INTO autor (nombre_autor, informacion) VALUES('camaron','Fue un cantaor gitano español considerado una de las principales figuras del flamenco.');
INSERT INTO autor (nombre_autor, informacion) VALUES('la excepcion', "La excepción que confirma la regla, fue un grupo español de rap originario del barrio de Pan Bendito, en el distrito de Carabanchel, Madrid. Estuvo compuesto por los MC's El Langui y Gitano Antón  y por el DJ La Dako Style . ");
INSERT INTO autor (nombre_autor, informacion) VALUES('los delinquentes', 'Los Delinqüentes fue un grupo musical andaluz, originario de Jerez de la Frontera (Cádiz), formado en 1998 por Miguel Ángel Benítez Gómez "Er Migue" y Marcos del Ojo "Er Canijo de Jeré", a los que se uniría posteriormente Diego Pozo "Er Ratón".');

INSERT INTO autor (nombre_autor, informacion) VALUES('def con dos', 'Def Con Dos es un grupo  formado en Vigo en 1988, aunque afincando en Madrid desde poco tiempo después. Fueron pioneros en practicar la música hip hop en español, posteriormente evolucionaron hacia el rap metal.');
INSERT INTO autor (nombre_autor, informacion) VALUES('system of a down', 'System of a Down es una banda de rock estadounidense de ascendencia armenia, formada en Los Ángeles, California, en el año 1994. Está compuesta por Serj Tankian, Daron Malakian, Shavo Odadjian y John Dolmayan..');

/**************************************************************************************************************************************/
/* Autores repetidos */
/*
INSERT INTO autor (nombre, informacion) VALUES('camaron - copia', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('la excepcion - copia', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('los delinquentes - copia', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('camaron - copia (2)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('la excepcion - copia (2)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('los delinquentes - copia (2)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('camaron - copia (3)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('la excepcion - copia (3)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('los delinquentes - copia (3)', 'informacion de copia');
INSERT INTO autor (nombre, informacion) VALUES('michael jackson', 'El Rey del Pop.​');
*/

/* --- disco --- */
	/* camaron */
INSERT INTO disco (nombre_disco) VALUES('caminito de totana');
INSERT INTO disco (nombre_disco) VALUES('reencuentro');
INSERT INTO disco (nombre_disco) VALUES('soy caminante');
	/* la excepcion */
INSERT INTO disco (nombre_disco) VALUES('aguantando el tiron');
INSERT INTO disco (nombre_disco) VALUES('la verdad mas verdadera');
	/* los delinquentes */
INSERT INTO disco (nombre_disco) VALUES('arquitectura del aire en la calle');
INSERT INTO disco (nombre_disco) VALUES('extras');
/* def con dos */
INSERT INTO disco (nombre_disco) VALUES('armas pal pueblo');
/* system of a down */
INSERT INTO disco (nombre_disco) VALUES('toxicity');

/* --- estilo --- */
INSERT INTO estilo (nombre_estilo) VALUES('flamenco');
INSERT INTO estilo (nombre_estilo) VALUES('rap');
INSERT INTO estilo (nombre_estilo) VALUES('rock');
INSERT INTO estilo (nombre_estilo) VALUES('jazz');
INSERT INTO estilo (nombre_estilo) VALUES('pop');

/* --- cancion --- */

INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito de totana',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hermanito mio',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que no se quita con na',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('dame un poquito de agua',CURRENT_DATE,1,1,1);

INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('chacho',CURRENT_DATE,4,2,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,4,2,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('oye compai',CURRENT_DATE,4,2,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por bule',CURRENT_DATE,4,2,3);

INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('extra',CURRENT_DATE,7,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el aire de la calle',CURRENT_DATE,7,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('gato callejero',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('los delinquentes y la banda del raton',CURRENT_DATE,6,3,3);

INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('armas pal pueblo',CURRENT_DATE,8,4,4);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('condicion de defensa',CURRENT_DATE,8,4,4);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('duro y a la encia',CURRENT_DATE,8,4,4);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('errores medicos',CURRENT_DATE,8,4,4);

INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('prison song',CURRENT_DATE,9,5,5);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('needles',CURRENT_DATE,9,5,5);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('deer dance',CURRENT_DATE,9,5,5);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('jet pilot',CURRENT_DATE,9,5,5);
/*  -------  */


INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la jaca que yo tenia',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a la sombra de un laurel',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('quisiera volverme pulga',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('salud antes que dinero',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('busco yo mi solea',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a un sabio le oi decir',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las espinas de una flor',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las doce acaban de dar',CURRENT_DATE,1,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('por tangos',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la saeta',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('solea del chaqueta',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('hombre terrestre',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la virgen hizo una sopa',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('a dibujar esta rosa',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('soy fraguero',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las 12 acaban de dar',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vibora rabiosa',CURRENT_DATE,2,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el caminante',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('reniego haberte encontrado',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la vida es una ilusion',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('las penas de mi mare',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me olvidaste, te olvide',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que desgraciaitos son',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('que camina noche y dia',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('se pelean en mi mente',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('me dieron una ocasion',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('mira que bonitas son',CURRENT_DATE,3,1,1);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 1',CURRENT_DATE,4,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 2',CURRENT_DATE,4,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 3',CURRENT_DATE,4,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('pista 4',CURRENT_DATE,4,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la verdad mas verdadera',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('en fuerza fisica',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('ruina',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asintiendo la perdicion',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('carmela pasteles',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('santo devoto',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('no es la solucion',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('su suerte',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('asin ke',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 2',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la misma istoria, sin h',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('azoteas',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('siempre sostenerse',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('perfil blanco payo',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('interludio peludo 3',CURRENT_DATE,5,2,2);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la nina de la palmera',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('caminito del almendro',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('poeta encadenado',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la ragazza del elevatore',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('medicina y mucho ruido',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('la madriguera',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('el telescopio cosmico',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('amor plutonico',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('joaquin carachapa y la pequena nube',CURRENT_DATE,6,3,3);
INSERT INTO cancion (nombre_cancion,fecha_alta,id_disco,id_autor,id_estilo) VALUES('sigo a la luna',CURRENT_DATE,7,3,3);

/**************************************************************************************************************************************/



/* --- escuchado_recientemente --- */
/*
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,22,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,34,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,24,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,31,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,15,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,41,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,51,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,17,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,18,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,45,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,51,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,10,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,11,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,26,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,34,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,24,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,22,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,42,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,47,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,38,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,54,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,52,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,20,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,22,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,51,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,47,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,38,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,24,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,53,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,20,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,36,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,03,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,34,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,34,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,33,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,53,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,47,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,38,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,44,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,53,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,30,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,33,sysdate());
*/

INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,1,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,2,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,3,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,4,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,5,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,6,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,7,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,8,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,9,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,10,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,11,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,13,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,14,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,15,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,17,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,18,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,19,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(1,20,sysdate());


INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,17,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,18,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,19,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,20,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,4,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,5,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,6,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,7,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,8,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,1,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,2,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,3,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,9,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,10,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,14,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,11,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,15,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(2,13,sysdate());


INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,4,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,5,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,2,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,7,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,8,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,1,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,9,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,12,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,13,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,3,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,6,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,14,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,11,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,15,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,18,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,19,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,10,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,17,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(3,20,sysdate());

INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,19,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,20,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,15,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,1,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,2,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,6,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,16,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,17,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,3,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,4,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,9,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,10,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,11,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,12,sysdate())
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,5,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,7,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,8,sysdate());;
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,13,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,14,sysdate());
INSERT INTO escuchado_recientemente (id_usuario, id_cancion, fecha) VALUES(4,18,sysdate());

/*Insert Lista de reproduccion*/

/*
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,25);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,35);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,45);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,51);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,22);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,25);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,25);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,35);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,45);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,52);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,22);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,25);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,25);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,35);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,45);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,55);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,53);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,23);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,35);*/


/*
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,3);

INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,2);


INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,52);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,63);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,53);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,23);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,35);
*/

INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,4);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,5);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,6);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,7);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,8);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,9);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,10);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,11);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,12);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,13);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,14);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,15);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,16);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,17);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,18);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,19);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (1,20);

INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,9);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,10);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,11);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,12);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,13);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,18);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,19);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,20);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,4);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,14);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,15);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,16);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,17);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,5);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,6);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,7);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (2,8);

INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,19);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,20);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,6);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,7);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,8);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,9);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,10);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,14);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,15);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,16);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,4);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,5);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,11);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,12);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,13);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,17);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (3,18);

INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,6);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,16);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,18);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,7);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,3);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,4);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,5);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,8);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,11);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,12);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,9);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,1);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,2);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,14);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,15);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,19);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,10);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,13);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,17);
INSERT INTO lista_reproduccion (id_usuario,id_cancion) VALUES (4,20);
