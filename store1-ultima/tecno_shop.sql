-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2021 a las 02:20:28
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecno_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(7) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Clave` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `Nombre`, `Clave`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CodigoCat` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodigoCat`, `Nombre`, `Descripcion`) VALUES
('001', 'celulares', 'celulares'),
('002', 'televisores', 'televisores'),
('9078', 'Videojuegos', 'Viodeojuegos'),
('lp-001', 'laptops', 'laptops');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `NIT` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `NombreCompleto` varchar(70) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Clave` text NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NIT`, `Nombre`, `NombreCompleto`, `Apellido`, `Clave`, `Direccion`, `Telefono`, `Email`) VALUES
('007', 'prueba', 'prueba', 'prueba', 'c893bad68927b457dbed39460e6afd62', 'san lucas toliman', '32334455', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabanco`
--

CREATE TABLE `cuentabanco` (
  `id` int(50) NOT NULL,
  `NumeroCuenta` varchar(100) NOT NULL,
  `NombreBanco` varchar(100) NOT NULL,
  `NombreBeneficiario` varchar(100) NOT NULL,
  `TipoCuenta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`id`, `NumeroCuenta`, `NombreBanco`, `NombreBeneficiario`, `TipoCuenta`) VALUES
(1, '48484837373', 'BanRural', 'Grupo FASSE', 'Ahorro amigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `NumPedido` int(20) NOT NULL,
  `CodigoProd` varchar(30) NOT NULL,
  `CantidadProductos` int(20) NOT NULL,
  `PrecioProd` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`NumPedido`, `CodigoProd`, `CantidadProductos`, `PrecioProd`) VALUES
(1, 'lp755', 1, '3599.00'),
(2, '9543', 1, '2200.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(20) NOT NULL,
  `CodigoProd` varchar(30) NOT NULL,
  `NombreProd` varchar(30) NOT NULL,
  `CodigoCat` varchar(30) DEFAULT NULL,
  `Precio` decimal(30,2) NOT NULL,
  `Descuento` int(2) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Stock` int(20) NOT NULL,
  `NITProveedor` varchar(30) DEFAULT NULL,
  `Imagen` varchar(150) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `Imagen2` varchar(150) DEFAULT NULL,
  `Imagen3` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `CodigoProd`, `NombreProd`, `CodigoCat`, `Precio`, `Descuento`, `Modelo`, `Marca`, `Stock`, `NITProveedor`, `Imagen`, `Nombre`, `Estado`, `descripcion`, `Imagen2`, `Imagen3`) VALUES
(7, '33sz', 'Samsung a21s (LIBERADO)', '001', '1500.00', 0, 'a21s', 'Samsung', 25, '010001', '33sz.jpg', 'admin', 'Activo', 'Pantalla 6.5 pulgadas, 32GB, 4ram, cámaras traseras 48+8+2+2mp, cámara frontal 13mp, lector de huellas, batería 5000mAh, Android 10', '33sz2.jpg', '33sz3.jpg'),
(8, '223cd', 'IPhone 12(LIBERADO)', '001', '11999.00', 0, '12', 'IPhone', 12, '010001', '223cd.jpg', 'admin', 'Activo', 'Pantalla 4.7 pulgadas, 64GB, 3ram, cámara trasera 12mp, cámara frontal 7mp, lector de huellas, batería 1.821mAh, iOS 13, color negro, pero 148g', '223cd2.jpg', '223cd3.jpg'),
(9, '129t6', 'Xiaomi redmi note 9(LIBERADO)', '001', '2000.00', 5, 'redmi note 9', 'Xioami', 24, '010001', '129t6.png', 'admin', 'Activo', 'Pantalla 6.5 pulgadas, 128GB, 4ram, lector de huellas, cámaras traseras 48+8+2+2mp, cámara frontal 13mp, color azul oscuro, batería 5020mAh, Android 10', '129t62.png', '129t63.png'),
(10, '343sx', 'LG k42(CLARO)', '001', '1300.00', 0, 'k42', 'LG', 20, '010001', '343sx.jpg', 'admin', 'Activo', 'Pantalla 6.6 pulgadas, 64GB, 4ram, cámaras traseras 13+5+2+2mp, cámara frontal 8mp, lector de huellas, batería 4000mAh, Android 10', '343sx2.jpg', '343sx3.jpg'),
(11, '9543', 'Moto g9 plus(TIGO)', '001', '2200.00', 0, 'g9 plus', 'Motorola', 21, '352334343', '9543.jpg', 'admin', 'Activo', 'Pantalla 6.7 pulgadas, 128GB, 4ram, cámaras traseras 64,8,2,2mp, cámara frontal 16mp, lector de huellas, batería de 5000mAh, Android 10, color azul', '95432.jpg', '95433.jpg'),
(12, 'tv-22', 'Smart Samsung 43\" UN43T5300', '002', '2799.00', 0, 'UN43T5300', 'Samsung', 12, '352334343', 'tv-22.jpg', 'admin', 'Activo', 'Televisor Smart 43 Pulgadas Samsung UN43T5300. Disfruta dos veces más claridad en tus contenidos, Resolución Full HD, Siente como tus películas favoritas y programas de televisión cobran vida. Disfruta una resolución Full HD intensa y con colores vivos con el doble de resolución que un televisor HD.', 'tv-222.jpg', 'tv-223.jpg'),
(13, 'tv-r34', 'Smart Panasonic 32\" TC32FS500', '002', '1699.00', 0, 'TC32FS500/ES600L', 'Panasonic', 12, '9877', 'tv-r34.png', 'admin', 'Activo', 'Televisor SMART de 32 pulgadas marca Panasonic Tc-32es600l full HD con conectividad USB y HDMI, con acceso a YouTube y Netflix', 'tv-r342.png', 'tv-r343.png'),
(14, 'lp322', 'Laptop HP  14-245G7', 'lp-001', '3299.00', 0, '14-245G7', 'HP', 20, '9877', 'lp322.jpg', 'admin', 'Activo', 'Laptop HP 14\" 14-240G7 Core i3 4GB Ram 1TB Disco duro', 'lp3222.jpg', 'lp3223.jpg'),
(15, 'lp755', 'Laptop ASUS 15\" 15-90NB', 'lp-001', '3599.00', 0, '15-90NB', 'Asus', 14, '9877', 'lp755.png', 'admin', 'Activo', 'Laptop ASUS 15\" 15-90NB Celeron 4GB Ram 1TB Disco duro', 'lp7552.png', 'lp7553.png'),
(16, '12345', 'A21s(CLARO)', '001', '1500.00', 0, 'A21s', 'Samsung', 12, '010001', '12345.jpg', 'admin', 'Activo', '5.5 pulgadas, 4 ram, 64 almacenamiento, 64+12+2+2 mpx(trasera), 13mpx(frontal),Android 10, color negro', '123452.jpg', '123453.jpg'),
(23, 'al-001', 'Alcatel 1v 2020 (TIGO)', '001', '599.00', 0, '1v 2020', 'Alcatel', 24, '010001', 'al-001.png', 'admin', 'Activo', 'Pantalla 6.22 pulgadas, 32GB, 2ram, lector de huellas, cámaras traseras 13+ 5mp, cámara frontal 5mp, color negro, bateria 4000 mAh, android 10', 'al-0012.png', 'al-0013.png'),
(24, 'ip-001', 'Iphone SE 2020 (TIGO)', '001', '3999.00', 0, 'SE 2020', 'Iphone', 15, '9877', 'ip-001.jpg', 'admin', 'Activo', 'Pantalla 4.7 pulgadas, 64GB, 3ram, cámara trasera 12mp, cámara frontal 7mp, lector de huellas, batería 1.821mAh, iOS 13, color negro, pero 148g', 'ip-0012.jpg', 'ip-0013.jpg'),
(25, 'hi-002', 'Huawei Y8s (LIBERADO)', '001', '1600.00', 0, 'Y8s', 'Huawei', 18, '341241', 'hi-002.jpg', 'admin', 'Activo', '6.5 pulgadas, 64GB, 4ram, cámaras traseras 48+2mp, cámaras delanteras 8+2mp, lector de huellas, batería 4000mAh, Android 9.', 'hi-0022.jpg', 'hi-0023.jpg'),
(26, 'ns-001', 'Nintendo Switch V2 Neon', '9078', '3899.00', 0, 'Switch V2 Neon', 'Nintendo', 10, '48593444930', 'ns-001.jpg', 'admin', 'Activo', 'Aproximadamente 4.02 pulgadas (10.21 cm) de alto, 1.41 pulgadas (3.58 cm) de ancho y 1.12 pulgadas (2.84 cm) de largo', 'ns-0012.jpg', 'ns-0013.jpg'),
(27, 'p4-0001', 'Consola PlayStation 4 1TB', '002', '3999.00', 0, '4', 'PlayStation', 15, '48593444930', 'p4-0001.jpg', 'admin', 'Activo', 'Consola PlayStation 4 1TB MegaPack15 SpiderMan-Horizon-RatchetClank', 'p4-00012.jpg', 'p4-00013.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `NITProveedor` varchar(30) NOT NULL,
  `NombreProveedor` varchar(30) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `PaginaWeb` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NITProveedor`, `NombreProveedor`, `Direccion`, `Telefono`, `PaginaWeb`) VALUES
('010001', 'Juan Perez', 'San Lucas Toliman', '45324565', 'http://www.celulare.com'),
('341241', 'Ramiro Lopez Lopez', 'Panajachel', '45665544', ''),
('352334343', 'Ramon Sanchez Juares', 'Solola', '45786512', ''),
('48593444930', 'Manolo Lopez Mendez', 'Panajachel', '34543654', ''),
('9877', 'Marina Campos Mendez', 'Panajachel', '32466544', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `NumPedido` int(20) NOT NULL,
  `Fecha` varchar(150) NOT NULL,
  `NIT` varchar(30) NOT NULL,
  `TotalPagar` decimal(30,2) NOT NULL,
  `Estado` varchar(150) NOT NULL,
  `NumeroDeposito` varchar(50) NOT NULL,
  `TipoEnvio` varchar(37) NOT NULL,
  `Adjunto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`NumPedido`, `Fecha`, `NIT`, `TotalPagar`, `Estado`, `NumeroDeposito`, `TipoEnvio`, `Adjunto`) VALUES
(1, '20-05-2021', '007', '3599.00', 'Pendiente', '1232312', 'Envio Por Currier', 'comprobante_1.jpg'),
(2, '20-05-2021', '007', '2200.00', 'Pendiente', '52545', 'Envio Por Cargo Express', 'comprobante_2.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CodigoCat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD KEY `NumPedido` (`NumPedido`),
  ADD KEY `CodigoProd` (`CodigoProd`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CodigoCat` (`CodigoCat`),
  ADD KEY `NITProveedor` (`NITProveedor`),
  ADD KEY `Agregado` (`Nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NITProveedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`NumPedido`),
  ADD KEY `NIT` (`NIT`),
  ADD KEY `NIT_2` (`NIT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `NumPedido` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_9` FOREIGN KEY (`NumPedido`) REFERENCES `venta` (`NumPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_7` FOREIGN KEY (`CodigoCat`) REFERENCES `categoria` (`CodigoCat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_8` FOREIGN KEY (`NITProveedor`) REFERENCES `proveedor` (`NITProveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`NIT`) REFERENCES `cliente` (`NIT`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
