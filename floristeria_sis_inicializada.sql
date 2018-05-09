-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 08-01-2014 a las 15:18:16
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `floristeria_sis`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `articulos`
-- 

CREATE TABLE `articulos` (
  `id` int(6) NOT NULL auto_increment,
  `descripcion` varchar(255) collate utf8_spanish_ci NOT NULL,
  `tipo_id` int(6) NOT NULL,
  `unidad_id` int(6) NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `articulos`
-- 

INSERT INTO `articulos` VALUES (1, 'TULIPANES', 4, 1, 200.5);
INSERT INTO `articulos` VALUES (2, 'ROSAS', 4, 1, 300);
INSERT INTO `articulos` VALUES (3, 'SEMILLA DE GIRASOL', 4, 5, 250.2);
INSERT INTO `articulos` VALUES (4, 'SEMILLA DE GIRASOL', 4, 2, 1000);
INSERT INTO `articulos` VALUES (5, 'PETUNIA', 4, 1, 10230.3);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `articulos_entradas`
-- 

CREATE TABLE `articulos_entradas` (
  `id` int(6) NOT NULL auto_increment,
  `articulo_id` int(6) NOT NULL,
  `entrada_id` int(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

-- 
-- Volcar la base de datos para la tabla `articulos_entradas`
-- 

INSERT INTO `articulos_entradas` VALUES (1, 1, 2, 20);
INSERT INTO `articulos_entradas` VALUES (2, 2, 3, 200);
INSERT INTO `articulos_entradas` VALUES (3, 4, 4, 20);
INSERT INTO `articulos_entradas` VALUES (4, 3, 4, 10);
INSERT INTO `articulos_entradas` VALUES (5, 1, 4, 50);
INSERT INTO `articulos_entradas` VALUES (6, 1, 5, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `art_existencia`
-- 

CREATE TABLE `art_existencia` (
  `id` int(6) NOT NULL auto_increment,
  `articulo_id` int(6) NOT NULL,
  `cant` int(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `art_existencia`
-- 

INSERT INTO `art_existencia` VALUES (1, 1, 71);
INSERT INTO `art_existencia` VALUES (2, 2, 200);
INSERT INTO `art_existencia` VALUES (3, 4, 20);
INSERT INTO `art_existencia` VALUES (4, 3, 10);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `bancos`
-- 

CREATE TABLE `bancos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish2_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `bancos`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

CREATE TABLE `clientes` (
  `id` varchar(15) NOT NULL,
  `razon` varchar(255) NOT NULL,
  `direccion` varchar(100) default NULL,
  `tlf_fijo` varchar(11) default NULL,
  `tlf_movil` varchar(11) default NULL,
  `correo` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `clientes`
-- 

INSERT INTO `clientes` VALUES ('j400550793', 'IP SISTEMAS C.A', 'VALERA', '1111111111', '22222', 'marcos@ip.com');
INSERT INTO `clientes` VALUES ('15188306', 'FRANKLIN', 'LKJNKJNKN', '222222222', '3333333333', '');
INSERT INTO `clientes` VALUES ('232313231213231', 'SDAASDDAS', 'DASDSDASA', '', '', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `depositos`
-- 

CREATE TABLE `depositos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `depositos`
-- 

INSERT INTO `depositos` VALUES (1, 'GENERAL');
INSERT INTO `depositos` VALUES (2, 'SALON');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `entradas`
-- 

CREATE TABLE `entradas` (
  `id` int(6) NOT NULL auto_increment,
  `personal_id` varchar(11) collate utf8_spanish_ci NOT NULL,
  `proveedor_id` int(6) NOT NULL,
  `fecha` date NOT NULL,
  `deposito_id` int(6) NOT NULL,
  `observacion` varchar(22) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='lotes de equipos que llegan al sistema' AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `entradas`
-- 

INSERT INTO `entradas` VALUES (1, '1234567', 1, '2013-10-12', 1, 'SDAASAS');
INSERT INTO `entradas` VALUES (2, '1234567', 1, '2013-10-12', 1, 'SDAASAS');
INSERT INTO `entradas` VALUES (3, '1234567', 1, '2013-10-12', 1, 'MERCANCIA DE REMATE\r\n');
INSERT INTO `entradas` VALUES (4, '1234567', 1, '2013-10-12', 1, 'LLEGO MERCANTIL');
INSERT INTO `entradas` VALUES (5, '1234567', 1, '2014-01-08', 1, '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas`
-- 

CREATE TABLE `facturas` (
  `id` int(6) NOT NULL auto_increment,
  `nrofactura` varchar(255) collate utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `cliente_id` int(6) NOT NULL,
  `cond_id` enum('CONTADO','CREDITO') collate utf8_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  `pedido_id` int(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `facturas`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas_detail`
-- 

CREATE TABLE `facturas_detail` (
  `id` int(6) NOT NULL auto_increment,
  `factura_id` int(6) NOT NULL,
  `articulo_id` int(6) NOT NULL,
  `cant` int(11) NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `facturas_detail`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `formas_pagos`
-- 

CREATE TABLE `formas_pagos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish2_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `formas_pagos`
-- 

INSERT INTO `formas_pagos` VALUES (1, 'EFECTIVO');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `niveles`
-- 

CREATE TABLE `niveles` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `niveles`
-- 

INSERT INTO `niveles` VALUES (1, 'ADMINISTRADOR');
INSERT INTO `niveles` VALUES (2, 'USUARIO');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pagos`
-- 

CREATE TABLE `pagos` (
  `id` int(6) NOT NULL auto_increment,
  `nro_factura` varchar(20) collate utf8_spanish2_ci NOT NULL,
  `personal_id` varchar(15) collate utf8_spanish2_ci NOT NULL,
  `cli_prov_id` varchar(15) collate utf8_spanish2_ci NOT NULL,
  `tipo` enum('CLIENTE','PROVEEDOR') collate utf8_spanish2_ci NOT NULL,
  `forma_id` int(6) NOT NULL,
  `banco_id` int(6) NOT NULL,
  `pago` varchar(255) collate utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `MONTO` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `pagos`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos`
-- 

CREATE TABLE `pedidos` (
  `id` int(6) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `observacion` varchar(255) collate utf8_spanish_ci NOT NULL,
  `cliente_id` varchar(15) collate utf8_spanish_ci NOT NULL,
  `personal_id` varchar(15) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `pedidos`
-- 

INSERT INTO `pedidos` VALUES (1, '2013-10-12', '', '0', '1234567');
INSERT INTO `pedidos` VALUES (2, '2013-10-12', '', '0', '1234567');
INSERT INTO `pedidos` VALUES (3, '2013-10-12', '', 'j400550793', '1234567');
INSERT INTO `pedidos` VALUES (4, '2013-10-12', 'credito 15 dias\r\n', '15188306', '1234567');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos_articulos`
-- 

CREATE TABLE `pedidos_articulos` (
  `id` int(6) NOT NULL auto_increment,
  `pedido_id` int(6) NOT NULL,
  `articulo_id` int(6) NOT NULL,
  `cant` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `pedidos_articulos`
-- 

INSERT INTO `pedidos_articulos` VALUES (1, 1, 1, 20);
INSERT INTO `pedidos_articulos` VALUES (2, 2, 1, 50);
INSERT INTO `pedidos_articulos` VALUES (3, 3, 1, 100);
INSERT INTO `pedidos_articulos` VALUES (4, 4, 2, 4);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `personal`
-- 

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(35) collate utf8_spanish_ci NOT NULL,
  `apellido` varchar(35) collate utf8_spanish_ci NOT NULL,
  `login` varchar(30) collate utf8_spanish_ci NOT NULL,
  `clave` varchar(32) collate utf8_spanish_ci NOT NULL,
  `nivel_id` int(6) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Volcar la base de datos para la tabla `personal`
-- 

INSERT INTO `personal` VALUES (1234567, 'ADMIN', 'ADMIN', 'admin1', '21232f297a57a5a743894a0e4a801fc3', 1, 'ACTIVO');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `personal_datos`
-- 

CREATE TABLE `personal_datos` (
  `personal_id` int(11) NOT NULL,
  `direccion` varchar(255) collate utf8_spanish_ci NOT NULL,
  `tlf_fijo` varchar(11) collate utf8_spanish_ci default NULL,
  `tlf_movil` varchar(11) collate utf8_spanish_ci default NULL,
  `correo` varchar(50) collate utf8_spanish_ci default NULL,
  `departamento_id` int(6) NOT NULL,
  `centro_id` int(6) NOT NULL,
  `foto` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`personal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Volcar la base de datos para la tabla `personal_datos`
-- 

INSERT INTO `personal_datos` VALUES (1234567, 'VALERA', '1111111111', '1111111111', 'admin@admin.com', 0, 0, '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `privilegios`
-- 

CREATE TABLE `privilegios` (
  `id` int(6) NOT NULL auto_increment,
  `pagina` varchar(255) collate utf8_spanish_ci NOT NULL,
  `nivel_id` int(6) NOT NULL,
  `acceso` enum('CONCEDER','DENEGAR') collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=61 ;

-- 
-- Volcar la base de datos para la tabla `privilegios`
-- 

INSERT INTO `privilegios` VALUES (1, 'agregar_historia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (2, 'cambiar_clave.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (3, 'centros.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (4, 'consmod_articulos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (5, 'consmod_asistencia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (6, 'consmod_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (7, 'consmod_consulta.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (8, 'consmod_historias.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (9, 'consmod_personal.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (10, 'consmod_proveedores.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (11, 'departamentos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (12, 'depositos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (13, 'discapacidades.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (14, 'ficha_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (15, 'ficha_historia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (16, 'ficha_personal.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (17, 'ficha_proveedores.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (18, 'marcas.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (19, 'modificar_articulos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (20, 'modificar_asistencia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (21, 'modificar_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (22, 'modificar_consulta.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (23, 'registrar_entrada.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (24, 'modificar_historias.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (25, 'modificar_personal.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (26, 'modificar_proveedores.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (27, 'movimientos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (28, 'niveles.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (29, 'privilegios.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (30, 'registrar_articulos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (31, 'registrar_asignacion.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (32, 'registrar_asignacion2.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (33, 'registrar_asistencia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (34, 'registrar_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (35, 'registrar_consulta.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (36, 'registrar_entrada2.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (37, 'registrar_historia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (38, 'registrar_pedido.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (39, 'registrar_pedido2.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (40, 'registrar_personal.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (41, 'registrar_proveedores.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (42, 'retirar_personal.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (43, 'retirar_personal2.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (44, 'rp_cons_asisfecha.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (45, 'rp_cons_asistipo.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (46, 'rp_cons_consbeneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (47, 'rp_cons_consfecha.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (48, 'rp_cons_ficha_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (49, 'rp_cons_pedidos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (50, 'rp_detalle_pedidos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (51, 'rp_frm_asisfecha.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (52, 'rp_frm_consbeneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (53, 'rp_frm_consfecha.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (54, 'rp_frm_ficha_beneficiario.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (55, 'rp_frm_tipo.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (56, 'rp_lista_equipos_almacen.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (57, 'tipo_articulos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (58, 'unidades.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (59, 'presentaciones.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (60, 'principal.php', 1, 'CONCEDER');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `proveedores`
-- 

CREATE TABLE `proveedores` (
  `id` int(6) NOT NULL auto_increment,
  `razon_social` varchar(255) collate utf8_spanish_ci NOT NULL,
  `rif` varchar(20) collate utf8_spanish_ci default NULL,
  `direccion` varchar(90) collate utf8_spanish_ci NOT NULL,
  `telf_fijo` int(11) default NULL,
  `fax` int(11) default NULL,
  `correo` varchar(50) collate utf8_spanish_ci default NULL,
  `persona_contacto` varchar(100) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

-- 
-- Volcar la base de datos para la tabla `proveedores`
-- 

INSERT INTO `proveedores` VALUES (1, 'IP SISTEMAS C.A', 'J-40055079-3', 'VALERA', 2147483647, 0, 'ventas@ipsistemastrujillo.com', 'MARCOS TORREALBA');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipos_articulos`
-- 

CREATE TABLE `tipos_articulos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `tipos_articulos`
-- 

INSERT INTO `tipos_articulos` VALUES (4, 'FLORES');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `unidades`
-- 

CREATE TABLE `unidades` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `unidades`
-- 

INSERT INTO `unidades` VALUES (1, 'DOCENAS');
INSERT INTO `unidades` VALUES (2, 'CAJA');
INSERT INTO `unidades` VALUES (3, 'BULTO');
INSERT INTO `unidades` VALUES (4, 'PAQUETES');
INSERT INTO `unidades` VALUES (5, 'FRASCO');
