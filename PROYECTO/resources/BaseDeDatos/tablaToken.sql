
CREATE TABLE IF NOT EXISTS Token  (
	id_token INT(10) NOT NULL AUTO_INCREMENT,
	token VARCHAR (60) NOT NULL,
	id_usuario  INT(10) NOT NULL,
	fecha_expira DATE NOT NULL,
	PRIMARY KEY (id_token),
	FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

/**********************************************/

INSERT INTO Token (token, id_usuario, fecha_expira) VALUES("1234567890987654321a", 1, SYSDATE() + 1);
INSERT INTO Token (token, id_usuario, fecha_expira) VALUES("1234567890987654321b", 2, SYSDATE() + 1);
