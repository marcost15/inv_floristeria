-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 03-05-2014 a las 00:33:12
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

-- 
-- Volcar la base de datos para la tabla `articulos`
-- 

INSERT INTO `articulos` VALUES (1, 'GLADIOLA', 5, 4, 60);
INSERT INTO `articulos` VALUES (2, 'ROSAS', 5, 4, 190);
INSERT INTO `articulos` VALUES (3, 'GIRASOL', 5, 8, 800);
INSERT INTO `articulos` VALUES (4, 'MARGARITA', 5, 4, 40);
INSERT INTO `articulos` VALUES (5, 'ORQUIDEA', 5, 7, 40);
INSERT INTO `articulos` VALUES (6, 'ASTER', 5, 4, 30);
INSERT INTO `articulos` VALUES (7, 'ASTROMELIA', 5, 4, 19);
INSERT INTO `articulos` VALUES (8, 'AVE DE PARAISO', 5, 4, 40);
INSERT INTO `articulos` VALUES (9, 'AZAHAR', 5, 4, 12);
INSERT INTO `articulos` VALUES (10, 'CALA', 5, 4, 40);
INSERT INTO `articulos` VALUES (11, 'CLAVEL', 5, 4, 60);
INSERT INTO `articulos` VALUES (12, 'DRACENA', 5, 8, 100);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

-- 
-- Volcar la base de datos para la tabla `articulos_entradas`
-- 

INSERT INTO `articulos_entradas` VALUES (1, 1, 2, 20);
INSERT INTO `articulos_entradas` VALUES (2, 2, 3, 200);
INSERT INTO `articulos_entradas` VALUES (3, 4, 4, 20);
INSERT INTO `articulos_entradas` VALUES (4, 3, 4, 10);
INSERT INTO `articulos_entradas` VALUES (5, 1, 4, 50);
INSERT INTO `articulos_entradas` VALUES (6, 1, 5, 1);
INSERT INTO `articulos_entradas` VALUES (7, 9, 6, 12);
INSERT INTO `articulos_entradas` VALUES (8, 2, 6, 10);
INSERT INTO `articulos_entradas` VALUES (9, 11, 7, 15);
INSERT INTO `articulos_entradas` VALUES (10, 4, 8, 10);
INSERT INTO `articulos_entradas` VALUES (11, 12, 9, 16);
INSERT INTO `articulos_entradas` VALUES (12, 1, 10, 8);
INSERT INTO `articulos_entradas` VALUES (13, 3, 10, 17);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `art_existencia`
-- 

CREATE TABLE `art_existencia` (
  `id` int(6) NOT NULL auto_increment,
  `articulo_id` int(6) NOT NULL,
  `cant` int(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `art_existencia`
-- 

INSERT INTO `art_existencia` VALUES (1, 1, 79);
INSERT INTO `art_existencia` VALUES (2, 2, 210);
INSERT INTO `art_existencia` VALUES (3, 4, 29);
INSERT INTO `art_existencia` VALUES (4, 3, 22);
INSERT INTO `art_existencia` VALUES (5, 9, 12);
INSERT INTO `art_existencia` VALUES (6, 11, 13);
INSERT INTO `art_existencia` VALUES (7, 12, 16);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `bancos`
-- 

CREATE TABLE `bancos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish2_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

-- 
-- Volcar la base de datos para la tabla `bancos`
-- 

INSERT INTO `bancos` VALUES (3, 'PROVINCIAL');
INSERT INTO `bancos` VALUES (4, 'MERCANTIL');
INSERT INTO `bancos` VALUES (5, 'BANESCO');
INSERT INTO `bancos` VALUES (6, 'BOD');
INSERT INTO `bancos` VALUES (7, 'VENEZUELA');
INSERT INTO `bancos` VALUES (8, 'BANPLUS');
INSERT INTO `bancos` VALUES (9, 'CARIBE');
INSERT INTO `bancos` VALUES (10, 'BICENTENARIO');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

CREATE TABLE `clientes` (
  `id` varchar(15) character set utf8 NOT NULL,
  `razon` varchar(255) character set utf8 NOT NULL,
  `direccion` varchar(100) character set utf8 default NULL,
  `tlf_fijo` varchar(11) character set utf8 default NULL,
  `tlf_movil` varchar(11) character set utf8 default NULL,
  `correo` varchar(50) character set utf8 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Volcar la base de datos para la tabla `clientes`
-- 

INSERT INTO `clientes` VALUES ('J295073267', 'FLORISTERIA HOME', 'AV. PUMARROSA, EDIF. MARCOLONGO, PISO 1, URB. SANTA IRENE PUNTO FIJO, EDO FALCÓN', '02692450467', '04146951688', '');
INSERT INTO `clientes` VALUES ('V-05562528-6', 'FLORISTERIA DIANI ', 'CARRETERA PUNTO FIJO MORON, SECTOR LA TAPARA', '', '04166726056', '');
INSERT INTO `clientes` VALUES ('J-29507326-7', 'HOME OF FLOWERS, C.A.', 'EDO. FALCON,CIUDAD PUNTO FIJO, AV. PUMARROSA, EDIFICIO MARCOLONGO, PISO 1, URBANIZACIÓN SANTA IRENE', '02692450467', '', 'soledad_soto@hotmail.com');
INSERT INTO `clientes` VALUES ('J-08511456-4', 'FLORISTERÍA Y MANUALIDADES LAS GLADIOLAS', 'FALCON, PUNTO FIJO, AV. GARCÉS, AV. AV. BOLÍVAR, PISO PB,', '02692452889', '', '');
INSERT INTO `clientes` VALUES ('V-09809703-0', ' FLORISTERÍA ANABEL', 'AV. JACINTO LARA 105, NIVEL PB, LOCAL 0, PUNTO FIJO, FALCON', '02692471210', '', '');
INSERT INTO `clientes` VALUES ('J-30834124-0', 'COMERCIALIZADORA JUÁREZ SA', 'AV. RAÚL LEONI, PUNTO FIJO, FALCON', '02692480055', '', '');
INSERT INTO `clientes` VALUES ('J-30634859-0', 'Floristeria La Orquidea', 'FALCON, PUNTO FIJO, AV. JACINTO LARA, EDIFICIO -, SECTOR CENTRO', '02692469394', '', '');
INSERT INTO `clientes` VALUES ('V-02365342-3', 'FLORISTERIA Y NOVEDADES ISA', 'Falcon, Punto Fijo, Cl. Ayacucho, Edificio -, Sector Centro', '02692450617', '', '');
INSERT INTO `clientes` VALUES ('V-00705159-6', 'Floristería Alvaflor', 'Garcés entre Peru Y Panama, PB, Local 12-82, Punto Fijo, Falcon', '02692458265', '', '');
INSERT INTO `clientes` VALUES ('V-00705228-2', 'Floristería Jazmín CA', 'FALCON, PUNTO FIJO, AV. RAÚL LEONI, PB, CASACOIMA', '02692479505', '', '');
INSERT INTO `clientes` VALUES ('J-30987675-9', 'FLORISTERÍA ANDINA VALERA CA', 'Trujillo, Valera, Av. 13, Con Calle 8, Centro Comercial C C Parma, Piso PB, Local 3, Sector Mercedes', '02712259198', '', '');
INSERT INTO `clientes` VALUES ('V-09326085-0', 'FLORISTERÍA LA NONA', 'TRUJILLO, VALERA, MERCADO MUNICIPAL, MORÓN', '02712253436', '', '');
INSERT INTO `clientes` VALUES ('J-30438797-0', 'FLORISTERÍA LAS ACACIAS CA', 'TRUJILLO, VALERA, AV. 6, LAS ACACIAS', '02712314442', '', '');
INSERT INTO `clientes` VALUES ('J-31438930-0', 'HIERBAS & FLORES SANTA BÁRBARA, C.A.', 'TRUJILLO, VALERA, CL. 06, ENTRE AV. 11 Y 12, LOCAL ÚNICO, SECTOR CENTRO', '02712210804', '', '');
INSERT INTO `clientes` VALUES ('20788494', 'YERALDY LAITON', 'EL CONTRI', '04247041533', '', '');
INSERT INTO `clientes` VALUES ('20040712', 'FRANCISCO ', 'CARVAJAL', '32243', '', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `depositos`
-- 

CREATE TABLE `depositos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `depositos`
-- 

INSERT INTO `depositos` VALUES (5, 'GALPON CASA');
INSERT INTO `depositos` VALUES (4, 'GALPON');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='lotes de equipos que llegan al sistema' AUTO_INCREMENT=11 ;

-- 
-- Volcar la base de datos para la tabla `entradas`
-- 

INSERT INTO `entradas` VALUES (1, '1234567', 1, '2013-10-12', 1, 'SDAASAS');
INSERT INTO `entradas` VALUES (2, '1234567', 1, '2013-10-12', 1, 'SDAASAS');
INSERT INTO `entradas` VALUES (3, '1234567', 1, '2013-10-12', 1, 'MERCANCIA DE REMATE\r\n');
INSERT INTO `entradas` VALUES (4, '1234567', 1, '2013-10-12', 1, 'LLEGO MERCANTIL');
INSERT INTO `entradas` VALUES (5, '1234567', 1, '2014-01-08', 1, '');
INSERT INTO `entradas` VALUES (6, '1234567', 2, '2014-03-21', 4, 'ENTREGO MERCANCÍA FRES');
INSERT INTO `entradas` VALUES (7, '1234567', 2, '2014-03-21', 4, '');
INSERT INTO `entradas` VALUES (8, '1234567', 4, '2014-04-12', 4, 'NO LLEGARON ROSAS ROJA');
INSERT INTO `entradas` VALUES (9, '1234567', 3, '2014-04-12', 4, '');
INSERT INTO `entradas` VALUES (10, '1234567', 2, '2014-04-12', 4, 'FLORES ROJAS');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `facturas`
-- 

INSERT INTO `facturas` VALUES (1, '000653', '2014-03-21', 0, 'CONTADO', 120, 0);
INSERT INTO `facturas` VALUES (2, '6523', '2014-03-21', 0, 'CONTADO', 40, 0);
INSERT INTO `facturas` VALUES (3, '03', '2014-04-12', 0, 'CONTADO', 4000, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `facturas_detail`
-- 

INSERT INTO `facturas_detail` VALUES (1, 1, 11, 2, 60);
INSERT INTO `facturas_detail` VALUES (2, 2, 4, 1, 40);
INSERT INTO `facturas_detail` VALUES (3, 3, 3, 5, 800);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `formas_pagos`
-- 

CREATE TABLE `formas_pagos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish2_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `formas_pagos`
-- 

INSERT INTO `formas_pagos` VALUES (1, 'EFECTIVO');
INSERT INTO `formas_pagos` VALUES (3, 'CHEQUE');
INSERT INTO `formas_pagos` VALUES (4, 'TRANSFERENCIA');
INSERT INTO `formas_pagos` VALUES (5, 'DEPÓSITO');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `niveles`
-- 

CREATE TABLE `niveles` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `niveles`
-- 

INSERT INTO `niveles` VALUES (1, 'ADMINISTRADOR');
INSERT INTO `niveles` VALUES (3, 'USUARIO');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `pagos`
-- 

INSERT INTO `pagos` VALUES (1, '1', '1234567', 'V-05562528-6', 'CLIENTE', 3, 0, '', '0000-00-00', 120);
INSERT INTO `pagos` VALUES (2, '3', '1234567', 'J295073267', 'CLIENTE', 3, 0, '', '0000-00-00', 560);
INSERT INTO `pagos` VALUES (3, '2', '1234567', '0', 'CLIENTE', 1, 0, '', '0000-00-00', 980);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

-- 
-- Volcar la base de datos para la tabla `pedidos`
-- 

INSERT INTO `pedidos` VALUES (1, '2013-10-12', '', '0', '1234567');
INSERT INTO `pedidos` VALUES (2, '2013-10-12', '', '0', '1234567');
INSERT INTO `pedidos` VALUES (3, '2013-10-12', '', 'j400550793', '1234567');
INSERT INTO `pedidos` VALUES (4, '2013-10-12', 'credito 15 dias\r\n', '15188306', '1234567');
INSERT INTO `pedidos` VALUES (5, '2014-03-21', 'que estén frescas', 'J295073267', '1234567');
INSERT INTO `pedidos` VALUES (6, '2014-03-21', '', 'V-05562528-6', '1234567');
INSERT INTO `pedidos` VALUES (7, '2014-04-12', 'flores frescas', 'J295073267', '1234567');
INSERT INTO `pedidos` VALUES (8, '2014-04-12', '', 'J295073267', '1234567');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `pedidos_articulos`
-- 

INSERT INTO `pedidos_articulos` VALUES (1, 1, 1, 20);
INSERT INTO `pedidos_articulos` VALUES (2, 2, 1, 50);
INSERT INTO `pedidos_articulos` VALUES (3, 3, 1, 100);
INSERT INTO `pedidos_articulos` VALUES (4, 4, 2, 4);
INSERT INTO `pedidos_articulos` VALUES (5, 5, 5, 6);
INSERT INTO `pedidos_articulos` VALUES (6, 5, 11, 7);
INSERT INTO `pedidos_articulos` VALUES (7, 6, 11, 2);
INSERT INTO `pedidos_articulos` VALUES (8, 7, 10, 12);
INSERT INTO `pedidos_articulos` VALUES (9, 8, 10, 12);
INSERT INTO `pedidos_articulos` VALUES (10, 8, 3, 5);
INSERT INTO `pedidos_articulos` VALUES (11, 8, 9, 3);

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

INSERT INTO `personal` VALUES (1234567, 'ADMIN', 'ADMIN', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'ACTIVO');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=77 ;

-- 
-- Volcar la base de datos para la tabla `privilegios`
-- 

INSERT INTO `privilegios` VALUES (1, 'agregar_historia.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (61, 'cambiar_clave.php', 1, 'CONCEDER');
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
INSERT INTO `privilegios` VALUES (62, 'cambiar_clave.php', 3, 'DENEGAR');
INSERT INTO `privilegios` VALUES (63, 'bancos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (64, 'formas_pago.php', 1, 'DENEGAR');
INSERT INTO `privilegios` VALUES (65, 'registrar_clientes.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (66, 'modificar_clientes.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (67, 'consmod_clientes.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (68, 'consmod_pagos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (69, 'ficha_clientes.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (70, 'registrar_factura.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (71, 'registrar_factura2.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (72, 'registrar_pagos.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (73, 'rp_lista_proveedores.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (74, 'rp_detalle_entrada.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (75, 'rp_lista_clientes.php', 1, 'CONCEDER');
INSERT INTO `privilegios` VALUES (76, 'rp_cons_entrada.php', 1, 'CONCEDER');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `proveedores`
-- 

INSERT INTO `proveedores` VALUES (2, 'FINCA LA ESPERANZA', 'V10914958', 'VIA PPAL DURI MESA DE ESNUJAQUE EDO TRUJILLO', 2147483647, 0, '', 'NATHALY ROJAS');
INSERT INTO `proveedores` VALUES (3, 'FINCA LA LADERA', 'J-15176719', 'MESA DE ESNUJAQUE SECTOR SANTA CRUZ', 2147483647, 0, '', 'YOANDER BRICEÑO');
INSERT INTO `proveedores` VALUES (4, 'FINCA LA ESTRELLA', 'V23593804-5', 'TIMOTES SECTOR EL LLANITO EDO MERIDA', 2147483647, 0, '', 'ANTONIO BUSTOS');
INSERT INTO `proveedores` VALUES (5, 'ESTACION LA LAGUNA', 'V13764594-5', 'MESA DE ESNUJAQUE SECTOR JUAN MARTIN', 2147483647, 0, '', 'ANTONIO CAMACHO');
INSERT INTO `proveedores` VALUES (6, 'LAS VIRTUDES HERMANOS', 'V12798850-1', 'LA PUERTA SECTOR LA LAGUNITA EDO TRUJILLO', 2147483647, 0, '', 'PEDRO OSUNA');
INSERT INTO `proveedores` VALUES (7, 'LAS MERCEDES', '52467223', 'LA BEATRIS', 2147483647, 21678828, 'ana@hotmail.com', 'MARIA');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipos_articulos`
-- 

CREATE TABLE `tipos_articulos` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `tipos_articulos`
-- 

INSERT INTO `tipos_articulos` VALUES (6, 'SEMILLAS');
INSERT INTO `tipos_articulos` VALUES (5, 'FLORES');
INSERT INTO `tipos_articulos` VALUES (7, 'MATEROS');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `unidades`
-- 

CREATE TABLE `unidades` (
  `id` int(6) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

-- 
-- Volcar la base de datos para la tabla `unidades`
-- 

INSERT INTO `unidades` VALUES (1, 'DOCENAS');
INSERT INTO `unidades` VALUES (4, 'PAQUETE');
INSERT INTO `unidades` VALUES (8, 'BULTO');
INSERT INTO `unidades` VALUES (7, 'UNIDAD');
