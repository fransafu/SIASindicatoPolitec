-- Base de datos para SIASindicato
--
-- Integrantes: Francisco Sanchez, Daniel Silva.
-- 

CREATE TABLE IF NOT EXISTS `socio` (
  	`rut` int(11) NOT NULL,
  	`nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  	`apellido` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  	`fenaci` DATE NOT NULL,
  	`cod_estado_civil_id` INT(11) NOT NULL,
  	`sexo_id` INT(11) NOT NULL,
  	`antiguedad` DATE NOT NULL,
  	`estado_id` INT(11) NOT NULL, 
  	PRIMARY KEY (`rut`),
  	KEY `estado_id` (`estado_id`),
  	KEY `cod_estado_civil_id` (`cod_estado_civil_id`),
  	KEY `sexo_id` (`sexo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ;

CREATE TABLE IF NOT EXISTS `estado` (
	`cod_estado` INT(11) NOT NULL AUTO_INCREMENT,
	`tipo` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`cod_estado`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `estado_civil` (
	`cod_estado_civil` INT(11) NOT NULL,
	`tipo` VARCHAR(25) COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`cod_estado_civil`)
);

CREATE TABLE IF NOT EXISTS `sindicato` (
	`cod_sindicato` INT(11) NOT NULL AUTO_INCREMENT,
	`direccion` VARCHAR(250) COLLATE utf8_spanish_ci NOT NULL,
	`rut_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_sindicato`),
	KEY `rut_id` (`rut_id`)
);

CREATE TABLE IF NOT EXISTS `rol` (
	`cod_rol` INT(11) NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`cod_rol`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `documentos` (
	`cod_documento` INT(11) NOT NULL,
	`nombre` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`tipo` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`fecha` DATE NOT NULL,
	`cod_sindicato_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_documento`),
	KEY `cod_sindicato_id` (`cod_sindicato_id`)
);

CREATE TABLE IF NOT EXISTS `solicitud` (
	`cod_solicitud` INT(11) NOT NULL,
	`fecha` DATE NOT NULL,
	`rut_id` INT(11) NOT NULL,
	`cod_prestamo_id` INT (11) NOT NULL,
	PRIMARY KEY (`cod_solicitud`),
	KEY `rut_id` (`rut_id`),
	KEY `cod_prestamo_id` (`cod_prestamo_id`)
);

CREATE TABLE IF NOT EXISTS `prestamo` (
	`cod_prestamo` INT (11) NOT NULL,
	`cantidad` VARCHAR(100) NOT NULL,
	`nro_cuotas` INT(11) NOT NULL,
	PRIMARY KEY (`cod_prestamo`)
);

CREATE TABLE IF NOT EXISTS `certificado` (
	`nro_certificado` INT(11) NOT NULL,
	`nombre` VARCHAR(100) NOT NULL,
	`cod_prestamo_id` INT(11) NOT NULL,
	PRIMARY KEY (`nro_certificado`),
	KEY `cod_prestamo_id` (`cod_prestamo_id`)
);

CREATE TABLE IF NOT EXISTS `sexo` (
	`cod_sexo` INT(11) NOT NULL,
	`tipo` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`cod_sexo`)
);

CREATE TABLE IF NOT EXISTS `usuario` (
	`cod_usuario` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(15) NOT NULL,
	`password` VARCHAR(15) NOT NULL,
	`nombre` VARCHAR(80) NOT NULL,
	`apellido` VARCHAR(80) NOT NULL,
	`rol_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_usuario`),
	KEY `rol_id` (`rol_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `multa`(
	`cod_multa` INT(11) NOT NULL AUTO_INCREMENT,
	`rut_id` INT(11) NOT NULL,
	`motivo_id` INT(11) NOT NULL,
	`fecha` DATE NOT NULL,
	`cant_multa` INT(11) NOT NULL,
	PRIMARY KEY (`cod_multa`),
	KEY `rut_id` (`rut_id`),
	KEY `motivo_id` (`motivo_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `motivo`(
	`cod_motivo` INT(11) NOT NULL AUTO_INCREMENT,
	`tipo` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`cod_motivo`)
)AUTO_INCREMENT = 1;

ALTER TABLE `multa`
  	ADD CONSTRAINT `multa_socio` FOREIGN KEY (`rut_id`) REFERENCES `socio` (`rut`),
  	ADD CONSTRAINT `multa_motivo` FOREIGN KEY (`motivo_id`) REFERENCES `motivo` (`cod_motivo`);

ALTER TABLE `certificado`
  	ADD CONSTRAINT `certificado_prestamo` FOREIGN KEY (`cod_prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `solicitud`
  	ADD CONSTRAINT `solicitud_socio` FOREIGN KEY (`rut_id`) REFERENCES `socio` (`rut`),
  	ADD CONSTRAINT `solicitud_prestamo` FOREIGN KEY (`cod_prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `documentos`
  	ADD CONSTRAINT `documentos_sindicatos` FOREIGN KEY (`cod_sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `usuario`
  	ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`cod_rol`);

ALTER TABLE `sindicato`
  	ADD CONSTRAINT `sindicato_socio` FOREIGN KEY (`rut_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `socio`
  	ADD CONSTRAINT `socio_estado_civil` FOREIGN KEY (`cod_estado_civil_id`) REFERENCES `estado_civil` (`cod_estado_civil`),
  	ADD CONSTRAINT `socio_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`cod_estado`),
  	ADD CONSTRAINT `socio_sexo` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`cod_sexo`);

-- Datos basicos a ingresar:

INSERT INTO `motivo` (`tipo`) VALUES
('Mal comportamiento'),
('Falta reunion');

INSERT INTO `estado_civil` (`cod_estado_civil`, `tipo`) VALUES 
(1, 'Casado'),
(2, 'Soltero'),
(3, 'Viudo'),
(4, 'Separado');

INSERT INTO `sexo` (`cod_sexo`, `tipo`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

INSERT INTO `estado` (tipo) VALUES
('Activo'),
('Inactivo');

INSERT INTO `socio` (rut, nombre, apellido, fenaci, cod_estado_civil_id, sexo_id, antiguedad, estado_id) VALUES
(19182515, 'Francisco Javier', 'Sánchez Fuentes', '1995-06-02', 1, 1, '2000-06-02', 1),
(18603093, 'Daniel', 'Silva', '1993-08-25', 1, 1, '2000-08-25', 1);

INSERT INTO `rol` (nombre) VALUES
('Presidente'),
('Tesorero'),
('Secretario');

INSERT INTO `usuario` (username, password, nombre, apellido, rol_id) VALUES
('fransafu', 'password', 'Francisco', 'Sánchez', 3),
('dsilva', 'password', 'Daniel', 'Silva', 2),
('scott', 'password', 'Scott', 'Sánchez', 1);