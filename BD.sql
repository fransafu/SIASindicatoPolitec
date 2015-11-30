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
	PRIMARY KEY (`cod_sindicato`)
);

CREATE TABLE IF NOT EXISTS `sindicato_carta` (
	`cod_sindicato_carta` INT(11) NOT NULL AUTO_INCREMENT,
	`sindicato_id` INT(11) NOT NULL,
	`carta_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_sindicato_carta`),
	KEY `sindicato_id` (`sindicato_id`),
	KEY `carta_id` (`carta_id`)
) AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `carta` (
	`cod_carta` INT(11) NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`tipo_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_carta`),
	KEY `tipo_id` (`tipo_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `carta_tipo` (
	`cod_carta_tipo` INT(11) NOT NULL AUTO_INCREMENT,
	`tipo` VARCHAR(50) NOT NULL,
	`mensaje` TEXT NULL,
	PRIMARY KEY (`cod_carta_tipo`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `registro_presupuesto` (
	`cod_registro_presupuesto` INT(11) NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`sindicato_id` INT(11) NOT NULL,
	`presupuesto_mensual_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_registro_presupuesto`),
	KEY `sindicato_id` (`sindicato_id`),
	KEY `presupuesto_mensual_id` (`presupuesto_mensual_id`)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `presupuesto_mensual` (
	`cod_presupuesto_mensual` INT(11) NOT NULL AUTO_INCREMENT,
	`total_gastos` FLOAT NOT NULL,
	`total_ingresos` FLOAT NOT NULL,
	`ingresos_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_presupuesto_mensual`),
	KEY `ingresos_id` (`ingresos_id`)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `presupuesto_mensual_egreso` (
	`cod_presupuesto_mensual_egreso` INT(11) NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`presupuesto_mensual_id` INT(11) NOT NULL,
	`egreso_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_presupuesto_mensual_egreso`),
	KEY `presupuesto_mensual_id` (`presupuesto_mensual_id`),
	KEY `egreso_id` (`egreso_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `ingreso` (
	`cod_ingreso` INT(11) NOT NULL AUTO_INCREMENT,
	`saldo_anterior` FLOAT NOT NULL,
	`cuota_sindical` FLOAT NOT NULL,
	`cuota_75_percent` FLOAT NOT NULL,
	PRIMARY KEY (`cod_ingreso`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `egreso` (
	`cod_egreso` INT(11) NOT NULL AUTO_INCREMENT,
	`descripcion` VARCHAR(300) NOT NULL,
	`monto` FLOAT NOT NULL,
	PRIMARY KEY (`cod_egreso`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `informe` (
	`cod_informe` INT(11) NOT NULL AUTO_INCREMENT,
	`presupuesto_mensual_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_informe`),
	KEY `presupuesto_mensual_id` (`presupuesto_mensual_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `rol` (
	`cod_rol` INT(11) NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	PRIMARY KEY (`cod_rol`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `documentos` (
	`cod_documento` INT(11) NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`tipo` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`fecha` DATE NOT NULL,
	`sindicato_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_documento`),
	KEY `sindicato_id` (`sindicato_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `prestamo` (
	`cod_prestamo` INT (11) NOT NULL,
	`cantidad` VARCHAR(100) NOT NULL,
	`nro_cuotas` INT(11) NOT NULL,
	PRIMARY KEY (`cod_prestamo`)
);

CREATE TABLE IF NOT EXISTS `solicitud` (
	`cod_solicitud` INT(11) NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`rut_id` INT(11) NOT NULL,
	`prestamo_id` INT (11) NOT NULL,
	PRIMARY KEY (`cod_solicitud`),
	KEY `rut_id` (`rut_id`),
	KEY `prestamo_id` (`prestamo_id`)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `certificado` (
	`nro_certificado` INT(11) NOT NULL,
	`nombre` VARCHAR(100) NOT NULL,
	`prestamo_id` INT(11) NOT NULL,
	PRIMARY KEY (`nro_certificado`),
	KEY `prestamo_id` (`prestamo_id`)
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
	`sindicato_id` INT(11) NOT NULL,
	PRIMARY KEY (`cod_usuario`),
	KEY `rol_id` (`rol_id`),
	KEY `sindicato_id` (`sindicato_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `socio_multa`(
	`cod_socio_multa` INT(11) NOT NULL AUTO_INCREMENT,
	`rut_id` INT(11) NOT NULL,
	`multa_id` INT(11) NOT NULL,
	`fecha` DATE,
	PRIMARY KEY (`cod_socio_multa`),
	KEY `rut_id` (`rut_id`),
	KEY `multa_id` (`multa_id`)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `multa`(
	`cod_multa` INT(11) NOT NULL,
	`motivo_id` INT(11) NOT NULL,
	`cant_multa` INT(11) NOT NULL,
	PRIMARY KEY (`cod_multa`),
	KEY `motivo_id` (`motivo_id`)
);

CREATE TABLE IF NOT EXISTS `motivo`(
	`cod_motivo` INT(11) NOT NULL AUTO_INCREMENT,
	`tipo` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`cod_motivo`)
)AUTO_INCREMENT = 1;






ALTER TABLE `certificado`
  	ADD CONSTRAINT `certificado_prestamo` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `solicitud`
  	ADD CONSTRAINT `solicitud_socio` FOREIGN KEY (`rut_id`) REFERENCES `socio` (`rut`),
  	ADD CONSTRAINT `solicitud_prestamo` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`cod_prestamo`);

ALTER TABLE `documentos`
  	ADD CONSTRAINT `documentos_sindicatos` FOREIGN KEY (`sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `usuario`
	ADD CONSTRAINT `usuario_sindicato` FOREIGN KEY (`sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`),
  	ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`cod_rol`);

ALTER TABLE `socio`
  	ADD CONSTRAINT `socio_estado_civil` FOREIGN KEY (`cod_estado_civil_id`) REFERENCES `estado_civil` (`cod_estado_civil`),
  	ADD CONSTRAINT `socio_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`cod_estado`),
  	ADD CONSTRAINT `socio_sexo` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`cod_sexo`);

ALTER TABLE `multa`
  	ADD CONSTRAINT `multa_motivo` FOREIGN KEY (`motivo_id`) REFERENCES `motivo` (`cod_motivo`);

ALTER TABLE `socio_multa`
	ADD CONSTRAINT `socio_multa_multa` FOREIGN KEY (`multa_id`) REFERENCES `multa` (`cod_multa`),
	ADD CONSTRAINT `socio_multa_socio` FOREIGN KEY (`rut_id`) REFERENCES `socio` (`rut`);

ALTER TABLE `carta`
	ADD CONSTRAINT `carta_carta_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `carta_tipo` (`cod_carta_tipo`);

ALTER TABLE `sindicato_carta`
	ADD CONSTRAINT `sindicato_carta_sindicato` FOREIGN KEY(`sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`),
	ADD CONSTRAINT `sindicato_carta_carta` FOREIGN KEY (`carta_id`) REFERENCES `carta` (`cod_carta`);

ALTER TABLE `registro_presupuesto`
	ADD CONSTRAINT `registro_presupuesto_presupuesto_mensual` FOREIGN KEY (`presupuesto_mensual_id`) REFERENCES `presupuesto_mensual` (`cod_presupuesto_mensual`),
	ADD CONSTRAINT `registro_presupuesto_sindicato` FOREIGN KEY (`sindicato_id`) REFERENCES `sindicato` (`cod_sindicato`);

ALTER TABLE `presupuesto_mensual`
	ADD CONSTRAINT `presupuesto_mensual_ingreso` FOREIGN KEY (`ingresos_id`) REFERENCES `ingreso` (`cod_ingreso`);

ALTER TABLE `presupuesto_mensual_egreso`
	ADD CONSTRAINT `presupuesto_mensual_egreso_presupuesto_mensual` FOREIGN KEY (`presupuesto_mensual_id`) REFERENCES `presupuesto_mensual` (`cod_presupuesto_mensual`),
	ADD CONSTRAINT `presupuesto_mensual_egreso_egreso` FOREIGN KEY (`egreso_id`) REFERENCES `egreso` (`cod_egreso`);

ALTER TABLE `informe`
	ADD CONSTRAINT `informe_presupuesto_mensual` FOREIGN KEY (`presupuesto_mensual_id`) REFERENCES `presupuesto_mensual` (`cod_presupuesto_mensual`);


-- Datos basicos a ingresar:

INSERT INTO `sindicato` (`direccion`) VALUES
('Camino Antiguo Coquimbo 16.064');

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

INSERT INTO `usuario` (username, password, nombre, apellido, rol_id, sindicato_id) VALUES
('fransafu', 'password', 'Francisco', 'Sánchez', 3, 1),
('dsilva', 'password', 'Daniel', 'Silva', 2, 1),
('scott', 'password', 'Scott', 'Sánchez', 1, 1);