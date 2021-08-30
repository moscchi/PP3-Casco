CREATE DATABASE database_natural;

USE database_natural;

CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    nombre VARCHAR(18) NOT NULL,
    apellido VARCHAR(18) NOT NULL,
    email VARCHAR(30) NOT NULL
);

ALTER TABLE users ADD PRIMARY KEY (id);

DESCRIBE users;

--MENSAJES USUARIO TABLE

CREATE TABLE links(
    id INT(11) NOT NULL,
    title VARCHAR(150) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    mensaje VARCHAR(500),
    user_id INT(11) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

--MENSAJES INVITADO

CREATE TABLE `database_natural`.`mensaje_invitado` (
  `idmensaje_invitado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `comentario` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idmensaje_invitado`));

  ALTER TABLE `database_natural`.`mensaje_invitado` 
ADD COLUMN `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `comentario`;

