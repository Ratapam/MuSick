DROP TABLE IF EXISTS noticia;

CREATE TABLE noticia (
    id INT AUTO_INCREMENT,
    titulo VARCHAR(2048) NOT NULL,
    texto VARCHAR(2048) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO noticia ( titulo,texto,fecha)
   VALUES
   ( 'noticia1','Esta es la primera noticia','2019/02/15' );
