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
  	`antiguedad` DATE NOT NULL,
  	PRIMARY KEY (`rut`),
  	KEY `cod_estado_civil_id` (`cod_estado_civil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ;

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
	`cod_rol` INT(11) NOT NULL,
	`nombre` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	`rut_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_rol`),
	KEY `rut_id` (`rut_id`)
);

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


ALTER TABLE `certificado`
  	ADD CONSTRAINT `certificado_prestamo` FOREIGN KEY (`cod_prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `solicitud`
  	ADD CONSTRAINT `solicitud_socio` FOREIGN KEY (`rut_id`) REFERENCES `socio` (`rut`),
  	ADD CONSTRAINT `solicitud_prestamo` FOREIGN KEY (`cod_prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `documentos`
  	ADD CONSTRAINT `documentos_sindicatos` FOREIGN KEY (`cod_sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `rol`
  	ADD CONSTRAINT `rol_socio` FOREIGN KEY (`rut_id`) REFERENCES `rol` (`cod_rol`);

ALTER TABLE `sindicato`
  	ADD CONSTRAINT `sindicato_socio` FOREIGN KEY (`rut_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `socio`
  	ADD CONSTRAINT `socio_estado_civil` FOREIGN KEY (`cod_estado_civil_id`) REFERENCES `estado_civil` (`cod_estado_civil`);