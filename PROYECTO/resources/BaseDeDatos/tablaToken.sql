CREATE TABLE IF NOT EXISTS Token  (
	token VARCHAR (60) NOT NULL,
	alias VARCHAR (50) NOT NULL,
	datos VARCHAR (250) NOT NULL,
	PRIMARY KEY (token)
);

/**********************************************/

INSERT INTO Token (token, alias, datos) VALUES("1234567890987654321a", "Manolo", "ABCDEFG1");
INSERT INTO Token (token, alias, datos) VALUES("1234567890987654321b", "Manola", "ABCDEFG2");
INSERT INTO Token (token, alias, datos) VALUES("1234567890987654321c", "Pepe", "ABCDEFG3");
INSERT INTO Token (token, alias, datos) VALUES("1234567890987654321d", "Pepa", "ABCDEFG4");
