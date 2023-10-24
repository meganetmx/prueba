-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-08-2018 a las 15:57:36
-- Versión del servidor: 5.5.47-0+deb8u1
-- Versión de PHP: 5.6.17-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mikrorocket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address_routers`
--

CREATE TABLE IF NOT EXISTS `address_routers` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `router_id` int(11) NOT NULL,
  `gateway` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `type` char(7) COLLATE utf8_spanish2_ci NOT NULL,
  `mask` char(3) COLLATE utf8_spanish2_ci NOT NULL,
  `network` varchar(17) COLLATE utf8_spanish2_ci NOT NULL,
  `hosts` int(10) NOT NULL,
  `used` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adv_settings`
--

CREATE TABLE IF NOT EXISTS `adv_settings` (
`id` int(11) NOT NULL,
  `routers_adv` tinyint(1) NOT NULL,
  `ip_server` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `server_path` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `adv_settings`
--

INSERT INTO `adv_settings` (`id`, `routers_adv`, `ip_server`, `server_path`) VALUES
(1, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
`id` int(11) NOT NULL,
  `ticket_id` int(12) NOT NULL,
  `message` text COLLATE utf8_spanish2_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `file` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill_customers`
--

CREATE TABLE IF NOT EXISTS `bill_customers` (
`id` int(11) NOT NULL,
  `num_bill` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `period` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `release_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `total_pay` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL,
  `open` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boxes`
--

CREATE TABLE IF NOT EXISTS `boxes` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(15) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `date_reg` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `num_receipt` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `detail` text COLLATE utf8_spanish2_ci NOT NULL,
  `type` char(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `mac` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `date_in` date NOT NULL,
  `plan_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `status` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `online` char(3) COLLATE utf8_spanish2_ci NOT NULL,
  `onmikrotik` tinyint(1) NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `coordinates` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `user_hot` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `pass_hot` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `typeauth` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_routers`
--

CREATE TABLE IF NOT EXISTS `control_routers` (
`id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `type_control` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `dhcp` tinyint(1) NOT NULL,
  `arpmac` tinyint(1) NOT NULL,
  `adv` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_apis`
--

CREATE TABLE IF NOT EXISTS `global_apis` (
`id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `options` text COLLATE utf8_spanish2_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `global_apis`
--

INSERT INTO `global_apis` (`id`, `name`, `options`, `status`) VALUES
(1, 'mikrotik', '{"a":"5","t":"3","d":false,"s":false}', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_settings`
--

CREATE TABLE IF NOT EXISTS `global_settings` (
`id` int(11) NOT NULL,
  `company` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `smoney` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `nmoney` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `num_bill` int(4) unsigned zerofill NOT NULL,
  `send_prebill` tinyint(1) NOT NULL,
  `send_presms` tinyint(1) NOT NULL,
  `version` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `before_days` int(11) NOT NULL,
  `tolerance` int(2) NOT NULL DEFAULT '0',
  `send_hrs` time NOT NULL,
  `backups` tinyint(1) NOT NULL,
  `create_copy` time NOT NULL,
  `status` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `last_update` date NOT NULL,
  `license` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `license_id` text COLLATE utf8_spanish2_ci NOT NULL,
  `platform` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `message` text COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `email_tickets` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `server` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `port` int(5) NOT NULL,
  `protocol` char(3) COLLATE utf8_spanish2_ci NOT NULL,
  `zone` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `default_location` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `phone_code` int(10) NOT NULL DEFAULT '54',
  `delay_sms` int(2) NOT NULL DEFAULT '2',
  `logo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `debug` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `global_settings`
--

INSERT INTO `global_settings` (`id`, `company`, `smoney`, `nmoney`, `num_bill`, `send_prebill`, `send_presms`, `version`, `before_days`, `tolerance`, `send_hrs`, `backups`, `create_copy`, `status`, `last_update`, `license`, `license_id`, `platform`, `message`, `email`, `email_tickets`, `password`, `server`, `port`, `protocol`, `zone`, `default_location`, `phone_code`, `delay_sms`, `logo`, `debug`) VALUES
(1, 'Mikro Rocket', '$', 'Pesos', 0001, 0, 0, '1.9.1', 1, 0, '00:00:00', 1, '00:00:00', 'in', '2018-09-03', 'Dev', '0', 'Linux', 'none', 'ejemplo@ejemplo.com', 'ejemplo2@ejemplo.com', '', 'smtp.gmail.com', 587, 'tls', 'UTC', '-34.60368440000001,-58.381559100000004', 54, 2, 'none', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(11) NOT NULL,
  `detail` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `user` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `networks`
--

CREATE TABLE IF NOT EXISTS `networks` (
`id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `type` char(10) COLLATE utf8_spanish2_ci NOT NULL,
  `template_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `pay_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `num_bill` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `month_pay` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `plan_id` int(14) NOT NULL,
  `router_id` int(14) NOT NULL,
  `expiries_date` date NOT NULL,
  `after_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_records`
--

CREATE TABLE IF NOT EXISTS `payment_records` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `router_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `detail` text COLLATE utf8_spanish2_ci NOT NULL,
  `type` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
`id` int(11) NOT NULL,
  `user_id` int(14) NOT NULL,
  `access_clients` tinyint(1) NOT NULL,
  `access_plans` tinyint(1) NOT NULL,
  `access_routers` tinyint(1) NOT NULL,
  `access_users` tinyint(1) NOT NULL,
  `access_system` tinyint(1) NOT NULL,
  `access_pays` tinyint(1) NOT NULL,
  `access_templates` tinyint(1) NOT NULL,
  `access_tickets` tinyint(1) NOT NULL,
  `access_reports` tinyint(1) NOT NULL,
  `access_sms` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `access_clients`, `access_plans`, `access_routers`, `access_users`, `access_system`, `access_pays`, `access_templates`, `access_tickets`, `access_reports`, `access_sms`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `download` int(6) NOT NULL,
  `upload` int(6) NOT NULL,
  `num_clients` int(12) unsigned NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `burst_limit` int(3) NOT NULL DEFAULT '0',
  `burst_threshold` int(3) NOT NULL DEFAULT '0',
  `burst_time` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) NOT NULL DEFAULT '5',
  `limitat` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `queued_processes`
--

CREATE TABLE IF NOT EXISTS `queued_processes` (
`id` int(11) NOT NULL,
  `type` char(10) COLLATE utf8_spanish2_ci NOT NULL,
  `process` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `detail` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `values` text COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routers`
--

CREATE TABLE IF NOT EXISTS `routers` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `model` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `ip` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `coordinates` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `clients` int(11) unsigned NOT NULL,
  `status` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `connection` tinyint(1) NOT NULL,
  `login` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `port` int(11) NOT NULL,
  `lan` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
`id` int(11) NOT NULL,
  `client` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `router_id` int(10) NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `gateway` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `total_clients` int(11) NOT NULL,
  `send_rate` int(11) NOT NULL,
  `message` varchar(160) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms_inbox`
--

CREATE TABLE IF NOT EXISTS `sms_inbox` (
`id` int(11) NOT NULL,
  `client` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `received_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `open` tinyint(1) NOT NULL,
  `message` varchar(160) COLLATE utf8_spanish2_ci NOT NULL,
  `gateway` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `smsgateway_id` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspend_clients`
--

CREATE TABLE IF NOT EXISTS `suspend_clients` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `expiration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `registered` date NOT NULL,
  `type` char(10) COLLATE utf8_spanish2_ci NOT NULL,
  `system` tinyint(1) NOT NULL,
  `filename` varchar(120) COLLATE utf8_spanish2_ci NOT NULL,
  `content` mediumtext COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `templates`
--

INSERT INTO `templates` (`id`, `name`, `registered`, `type`, `system`, `filename`, `content`) VALUES
(1, 'Aviso de corte', '2016-05-05', 'screen', 1, 'Aviso_de_corte.blade.php', '<p>&nbsp;<img style="float: left;" class="" alt="" src="assets/imgeditor/imagenes/thumbnail_CanWisp-1390957114.jpg" /></p>\n<h1>&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 30px; color: #333333;" class="glyphicon glyphicon-ban-circle"></span>&nbsp; <strong><span style="color: #666699;">AVISO DE CORTE DE SERVICIO</span></strong></h1>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estimado (a): {{$cliente}}</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Le comunicamos que su servicio de internet se encuentra suspendido por falta de pago,</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Siendo el vencimiento de la factura el {{$vencimiento}}, del plan {{$plan}} contradado con la empresa,</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Aprox&iacute;mese a nuestras oficinas para para efectuar su pago de {{$costo}} {{$moneda}}, consulte si aplican cargos extra por reconexi&oacute;n.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Realmente no queremos que te quedes sin internet, si esto es incorrecto le pedimos disculpas y le solicitamos</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; que se comunique al n&uacute;mero 800-22721 para aclarar su situaci&oacute;n.</p>\n<p style="text-align: center;"><a class="btn btn-primary" href="portal"><span class="glyphicon glyphicon-user"></span> INGRESAR AL PORTAL</a></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>'),
(2, 'Recordatorio de pago email', '2018-07-04', 'email', 1, 'Recordatorio_de_pago_email.blade.php', '<!doctype html>\n <html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n  <meta name="viewport" content="initial-scale=1.0" />\n  <meta name="format-detection" content="telephone=no" />\n  <title>Recordatorio de pago | {{$empresa}}</title>\n  <style type="text/css">\n 	body {\n		width: 100%;\n		margin: 0;\n		padding: 0;\n		-webkit-font-smoothing: antialiased;\n	}\n	@media only screen and (max-width: 600px) {\n		table[class="table-row"] {\n			float: none !important;\n			width: 98% !important;\n			padding-left: 20px !important;\n			padding-right: 20px !important;\n		}\n		table[class="table-row-fixed"] {\n			float: none !important;\n			width: 98% !important;\n		}\n		table[class="table-col"], table[class="table-col-border"] {\n			float: none !important;\n			width: 100% !important;\n			padding-left: 0 !important;\n			padding-right: 0 !important;\n			table-layout: fixed;\n		}\n		td[class="table-col-td"] {\n			width: 100% !important;\n		}\n		table[class="table-col-border"] + table[class="table-col-border"] {\n			padding-top: 12px;\n			margin-top: 12px;\n			border-top: 1px solid #E8E8E8;\n		}\n		table[class="table-col"] + table[class="table-col"] {\n			margin-top: 15px;\n		}\n		td[class="table-row-td"] {\n			padding-left: 0 !important;\n			padding-right: 0 !important;\n		}\n		table[class="navbar-row"] , td[class="navbar-row-td"] {\n			width: 100% !important;\n		}\n		img {\n			max-width: 100% !important;\n			display: inline !important;\n		}\n		img[class="pull-right"] {\n			float: right;\n			margin-left: 11px;\n            max-width: 125px !important;\n			padding-bottom: 0 !important;\n		}\n		img[class="pull-left"] {\n			float: left;\n			margin-right: 11px;\n			max-width: 125px !important;\n			padding-bottom: 0 !important;\n		}\n		table[class="table-space"], table[class="header-row"] {\n			float: none !important;\n			width: 98% !important;\n		}\n		td[class="header-row-td"] {\n			width: 100% !important;\n		}\n	}\n	@media only screen and (max-width: 480px) {\n		table[class="table-row"] {\n			padding-left: 16px !important;\n			padding-right: 16px !important;\n		}\n	}\n	@media only screen and (max-width: 320px) {\n		table[class="table-row"] {\n			padding-left: 12px !important;\n			padding-right: 12px !important;\n		}\n	}\n	@media only screen and (max-width: 458px) {\n		td[class="table-td-wrap"] {\n			width: 100% !important;\n		}\n	}\n  </style>\n </head>\n <body style="font-family: Arial, sans-serif; font-size:13px; color: #444444; min-height: 200px;" bgcolor="#E4E6E9" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">\n <table width="100%" height="100%" bgcolor="#E4E6E9" cellspacing="0" cellpadding="0" border="0">\n <tr><td width="100%" align="center" valign="top" bgcolor="#E4E6E9" style="background-color:#E4E6E9; min-height: 200px;">\n<table><tr><td class="table-td-wrap" align="center" width="458"><table class="table-space" height="18" style="height: 18px; font-size: 0px; line-height: 0; width: 450px; background-color: #e4e6e9;" width="450" bgcolor="#E4E6E9" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="18" style="height: 18px; width: 450px; background-color: #e4e6e9;" width="450" bgcolor="#E4E6E9" align="left">&nbsp;</td></tr></tbody></table>\n<table class="table-space" height="8" style="height: 8px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="8" style="height: 8px; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n\n<table class="table-row" width="450" bgcolor="#FFFFFF" style="table-layout: fixed; background-color: #ffffff;" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-row-td" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;" valign="top" align="left">\n  <table class="table-col" align="left" width="378" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed;"><tbody><tr><td class="table-col-td" width="378" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; width: 378px;" valign="top" align="left">\n    <table class="header-row" width="378" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed;"><tbody><tr><td class="header-row-td" width="378" style="font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #478fca; margin: 0px; font-size: 18px; padding-bottom: 10px; padding-top: 15px;" valign="top" align="left">Aviso de pago</td></tr></tbody></table>\n    <div style="font-family: Arial, sans-serif; line-height: 20px; color: #444444; font-size: 13px;">\n      <b style="color: #777777;">Estimado sr. (a) {{$cliente}}, le comunicamos que se ha generado la factura por el cobro del servicio de internet por {{$costo}} {{$moneda}} según el plan {{$plan}} contratado\n      le recordamos que el pago vence el {{$vencimiento}} si no se registra el pago el sistema realizara el corte automático del servicio en fecha {{$corte}}, por favor acercase a nuestra oficinas o comuniquese al tel: 800-5421612 no te quedes sin internet.</b>\n      <br>\n     Gracias por confiar en {{$empresa}}.\n    </div>\n  </td></tr></tbody></table>\n</td></tr></tbody></table>\n    \n<table class="table-space" height="12" style="height: 12px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="12" style="height: 12px; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n<table class="table-space" height="12" style="height: 12px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="12" style="height: 12px; width: 450px; padding-left: 16px; padding-right: 16px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="center">&nbsp;<table bgcolor="#E8E8E8" height="0" width="100%" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td bgcolor="#E8E8E8" height="1" width="100%" style="height: 1px; font-size:0;" valign="top" align="left">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>\n<table class="table-space" height="16" style="height: 16px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="16" style="height: 16px; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n\n<table class="table-row" width="450" bgcolor="#FFFFFF" style="table-layout: fixed; background-color: #ffffff;" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-row-td" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;" valign="top" align="left">\n  <table class="table-col" align="left" width="378" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed;"><tbody><tr><td class="table-col-td" width="378" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; width: 378px;" valign="top" align="left">\n    <div style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; text-align: center;">\n      <a href="http://192.168.137.2/" style="color: #ffffff; text-decoration: none; margin: 0px; text-align: center; vertical-align: baseline; border: 4px solid #6fb3e0; padding: 4px 9px; font-size: 15px; line-height: 21px; background-color: #6fb3e0;">&nbsp; Ver detalles &nbsp;</a>\n    </div>\n    <table class="table-space" height="16" style="height: 16px; font-size: 0px; line-height: 0; width: 378px; background-color: #ffffff;" width="378" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="16" style="height: 16px; width: 378px; background-color: #ffffff;" width="378" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n  </td></tr></tbody></table>\n</td></tr></tbody></table>\n\n<table class="table-space" height="6" style="height: 6px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="6" style="height: 6px; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n\n<table class="table-row-fixed" width="450" bgcolor="#FFFFFF" style="table-layout: fixed; background-color: #ffffff;" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-row-fixed-td" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 1px; padding-right: 1px;" valign="top" align="left">\n  <table class="table-col" align="left" width="448" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed;"><tbody><tr><td class="table-col-td" width="448" style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;" valign="top" align="left">\n    <table width="100%" cellspacing="0" cellpadding="0" border="0" style="table-layout: fixed;"><tbody><tr><td width="100%" align="center" bgcolor="#f5f5f5" style="font-family: Arial, sans-serif; line-height: 24px; color: #bbbbbb; font-size: 13px; font-weight: normal; text-align: center; padding: 9px; border-width: 1px 0px 0px; border-style: solid; border-color: #e3e3e3; background-color: #f5f5f5;" valign="top">\n      <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;">{{$empresa}} &copy; 2018</a>\n      <br>\n      <a href="#" style="color: #478fca; text-decoration: none; background-color: transparent;">twitter</a>\n      .\n      <a href="#" style="color: #5b7a91; text-decoration: none; background-color: transparent;">facebook</a>\n      .\n      <a href="#" style="color: #dd5a43; text-decoration: none; background-color: transparent;">google+</a>\n    </td></tr></tbody></table>\n  </td></tr></tbody></table>\n</td></tr></tbody></table>\n<table class="table-space" height="1" style="height: 1px; font-size: 0px; line-height: 0; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="1" style="height: 1px; width: 450px; background-color: #ffffff;" width="450" bgcolor="#FFFFFF" align="left">&nbsp;</td></tr></tbody></table>\n<table class="table-space" height="36" style="height: 36px; font-size: 0px; line-height: 0; width: 450px; background-color: #e4e6e9;" width="450" bgcolor="#E4E6E9" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="table-space-td" valign="middle" height="36" style="height: 36px; width: 450px; background-color: #e4e6e9;" width="450" bgcolor="#E4E6E9" align="left">&nbsp;</td></tr></tbody></table></td></tr></table>\n</td></tr>\n </table>\n </body>\n \n\n</html>'),
(3, 'Aviso de corte email', '2016-05-05', 'email', 1, 'Aviso_de_corte_email.blade.php', '<!doctype html>\n<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">\n    <head>\n        <!-- NAME: SUBSCRIBER ALERT -->\n        <!--[if gte mso 15]>\n        <xml>\n        <o:OfficeDocumentSettings>\n        <o:AllowPNG/>\n        <o:PixelsPerInch>117</o:PixelsPerInch>\n        </o:OfficeDocumentSettings>\n        </xml>\n        <![endif]-->\n        <meta charset="UTF-8">\n        <meta http-equiv="X-UA-Compatible" content="IE=edge">\n        <meta name="viewport" content="width=device-width, initial-scale=1">\n        <title>Aviso de Corte de servicio | {{$empresa}}</title>\n       \n        <!--[if gte mso 7]>\n        <style type="text/css">\n        </style>\n        <![endif]-->\n    <style type="text/css">\n		p{\n			margin:10px 0;\n			padding:0;\n		}\n		table{\n			border-collapse:collapse;\n		}\n		h1,h2,h3,h4,h5,h6{\n			display:block;\n			margin:0;\n			padding:0;\n		}\n		img,a img{\n			border:0;\n			height:auto;\n			outline:none;\n			text-decoration:none;\n		}\n		body,#bodyTable,#bodyCell{\n			height:100%;\n			margin:0;\n			padding:0;\n			width:100%;\n		}\n		#outlook a{\n			padding:0;\n		}\n		img{\n			-ms-interpolation-mode:bicubic;\n		}\n		table{\n			mso-table-lspace:0pt;\n			mso-table-rspace:0pt;\n		}\n		.ReadMsgBody{\n			width:100%;\n		}\n		.ExternalClass{\n			width:100%;\n		}\n		p,a,li,td,blockquote{\n			mso-line-height-rule:exactly;\n		}\n		a[href^=tel],a[href^=sms]{\n			color:inherit;\n			cursor:default;\n			text-decoration:none;\n		}\n		p,a,li,td,body,table,blockquote{\n			-ms-text-size-adjust:100%;\n			-webkit-text-size-adjust:100%;\n		}\n		.ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,.ExternalClass span,.ExternalClass font{\n			line-height:100%;\n		}\n		a[x-apple-data-detectors]{\n			color:inherit !important;\n			text-decoration:none !important;\n			font-size:inherit !important;\n			font-family:inherit !important;\n			font-weight:inherit !important;\n			line-height:inherit !important;\n		}\n		a.mcnButton{\n			display:block;\n		}\n		.mcnImage{\n			vertical-align:bottom;\n		}\n		.mcnTextContent{\n			word-break:break-word;\n		}\n		.mcnTextContent img{\n			height:auto !important;\n		}\n		.mcnDividerBlock{\n			table-layout:fixed !important;\n		}\n	\n		body,#bodyTable{\n			background-color:#F2F2F2;\n		}\n	\n		#bodyCell{\n			border-top:5px solid #FFFFFF;\n		}\n	\n		h1{\n			color:#FFFFFF !important;\n			font-family:Helvetica;\n			font-size:26px;\n			/font-style:normal;\n			font-weight:bold;\n			line-height:125%;\n			letter-spacing:normal;\n			text-align:left;\n		}\n	\n		h2{\n			color:#FFFFFF !important;\n			font-family:Helvetica;\n			font-size:22px;\n			font-style:normal;\n			font-weight:bold;\n			line-height:125%;\n			letter-spacing:normal;\n			text-align:left;\n		}\n	\n		h3{\n			color:#D55258 !important;\n			font-family:Helvetica;\n			font-size:18px;\n			font-style:normal;\n			font-weight:bold;\n			line-height:125%;\n			letter-spacing:normal;\n			text-align:left;\n		}\n	\n		h4{\n			color:#D55258 !important;\n			font-family:Helvetica;\n			font-size:16px;\n			font-style:normal;\n			font-weight:bold;\n			line-height:125%;\n			letter-spacing:normal;\n			text-align:left;\n		}\n	\n		#templatePreheader{\n			background-color:#F2F2F2;\n			border-top:0;\n			border-bottom:0;\n		}\n	\n		.preheaderContainer .mcnTextContent,.preheaderContainer .mcnTextContent p{\n			color:#404040;\n			font-family:Helvetica;\n			font-size:12px;\n			line-height:125%;\n			text-align:left;\n		}\n	\n		.preheaderContainer .mcnTextContent a{\n			color:#404040;\n			font-weight:normal;\n			text-decoration:underline;\n		}\n	\n		#templateHeader{\n			background-color:#F2F2F2;\n			border-top:0;\n			border-bottom:0;\n		}\n	\n		.headerFrontBackground,.headerRearBackground{\n			background-color:#D55258;\n		}\n	\n		.headerFrontBackground{\n			border-bottom:2px solid #BD4046;\n		}\n	\n		.headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{\n			color:#FFFFFF;\n			font-family:Helvetica;\n			font-size:16px;\n			line-height:150%;\n			text-align:left;\n		}\n	\n		.headerContainer .mcnTextContent a{\n			color:#FFFFFF;\n			font-weight:normal;\n			text-decoration:underline;\n		}\n	\n		#templateBody{\n			background-color:#F2F2F2;\n			border-top:0;\n			border-bottom:0;\n		}\n	\n		.bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{\n			color:#606060;\n			font-family:Helvetica;\n			font-size:14px;\n			line-height:150%;\n			text-align:left;\n		}\n	\n		.bodyContainer .mcnTextContent a{\n			color:#D55258;\n			font-weight:normal;\n			text-decoration:underline;\n		}\n	\n		#templateFooter{\n			background-color:#F2F2F2;\n			border-top:0;\n			border-bottom:0;\n		}\n	\n		.footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{\n			color:#AAAAAA;\n			font-family:Helvetica;\n			font-size:10px;\n			line-height:125%;\n			text-align:center;\n		}\n	\n		.footerContainer .mcnTextContent a{\n			color:#AAAAAA;\n			font-weight:normal;\n			text-decoration:underline;\n		}\n	@media only screen and (max-width: 480px){\n		body,table,td,p,a,li,blockquote{\n			-webkit-text-size-adjust:none !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		body{\n			width:100% !important;\n			min-width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.templateContainer{\n			max-width:600px !important;\n			width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImage{\n			width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnShareContent,.mcnCaptionTopContent,.mcnCaptionBottomContent,.mcnTextContentContainer,.mcnBoxedTextContentContainer,.mcnImageGroupContentContainer,.mcnCaptionLeftTextContentContainer,.mcnCaptionRightTextContentContainer,.mcnCaptionLeftImageContentContainer,.mcnCaptionRightImageContentContainer,.mcnImageCardLeftTextContentContainer,.mcnImageCardRightTextContentContainer{\n			max-width:100% !important;\n			width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnBoxedTextContentContainer{\n			min-width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageGroupContent{\n			padding:9px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnCaptionLeftContentOuter .mcnTextContent,.mcnCaptionRightContentOuter .mcnTextContent{\n			padding-top:9px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageCardTopImageContent,.mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent{\n			padding-top:18px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageCardBottomImageContent{\n			padding-bottom:9px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageGroupBlockInner{\n			padding-top:0 !important;\n			padding-bottom:0 !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageGroupBlockOuter{\n			padding-top:9px !important;\n			padding-bottom:9px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnTextContent,.mcnBoxedTextContentColumn{\n			padding-right:18px !important;\n			padding-left:18px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcnImageCardLeftImageContent,.mcnImageCardRightImageContent{\n			padding-right:18px !important;\n			padding-bottom:0 !important;\n			padding-left:18px !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n		.mcpreview-image-uploader{\n			display:none !important;\n			width:100% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		h1{\n			font-size:24px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		h2{\n			font-size:20px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		h3{\n			font-size:18px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		h4{\n			font-size:16px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		.mcnBoxedTextContentContainer .mcnTextContent,.mcnBoxedTextContentContainer .mcnTextContent p{\n			font-size:18px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		#templatePreheader{\n			display:block !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		.preheaderContainer .mcnTextContent,.preheaderContainer .mcnTextContent p{\n			font-size:14px !important;\n			line-height:115% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		.headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{\n			font-size:18px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		.bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{\n			font-size:18px !important;\n			line-height:125% !important;\n		}\n\n}	@media only screen and (max-width: 480px){\n	\n		.footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{\n			font-size:14px !important;\n			line-height:115% !important;\n		}\n\n}\n</style>\n\n</head>\n    <body>\n    	<center>\n        	<table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">\n            	<tr>\n                	<td align="center" valign="top" id="bodyCell">\n                       \n                        <table border="0" cellpadding="0" cellspacing="0" width="100%">\n                            <tr>\n                                <td align="center" valign="top">\n                                   \n                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templatePreheader">\n                                        <tr>\n                                        	<td align="center" valign="top">\n                                                <table border="0" cellpadding="0" cellspacing="0" width="600" class="templateContainer">\n                                                    <tr>\n                                                        <td valign="top" class="preheaderContainer" style="padding-top:10px; padding-bottom:10px;"><table class="mcnDividerBlock" style="min-width:100%;" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnDividerBlockOuter">\n        <tr>\n            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">\n                <table class="mcnDividerContent" style="min-width:100%;" border="0" cellpadding="0" cellspacing="0" width="100%">\n                    <tbody><tr>\n                        <td>\n                            <span></span>\n                        </td>\n                    </tr>\n                </tbody></table>\n\n            </td>\n        </tr>\n    </tbody>\n</table><table class="mcnImageBlock" style="min-width:100%;" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnImageBlockOuter">\n            <tr>\n                <td style="padding:9px" class="mcnImageBlockInner" valign="top">\n                    <table class="mcnImageContentContainer" style="min-width:100%;" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">\n                        <tbody><tr>\n                            <td class="mcnImageContent" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0; text-align:center;" valign="top">\n                                \n                                    \n                                        <h3 style="max-width:128px; padding-bottom: 0; display: inline !important; vertical-align: bottom;">{{$empresa}}</h3>\n                                    \n                                \n                            </td>\n                        </tr>\n                    </tbody></table>\n                </td>\n            </tr>\n    </tbody>\n</table></td>\n                                                    </tr>\n                                                </table>\n                                            </td>                                            \n                                        </tr>\n                                    </table>\n                                   \n                                </td>\n                            </tr>\n                            <tr>\n                            	<td align="center" valign="top">\n									\n                                	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateHeader">\n                                    	<tr>\n                                        	<td align="center" valign="top" style="padding-top:20px; padding-bottom:20px;">\n                                                <table border="0" cellpadding="0" cellspacing="0" width="600" class="templateContainer">\n													<tr>\n														<td align="center" height="10" valign="top" width="10">\n															<img src="https://gallery.mailchimp.com/27aac8a65e64c994c4416d6b8/images/d4042106-8117-4b79-b76b-91f8d64c5dff.gif" height="10" width="10" style="display:block; line-height:0px;">\n														</td>\n														<td align="center" height="10" valign="top" class="headerRearBackground" style="opacity:0.5;">\n															<img src="https://gallery.mailchimp.com/27aac8a65e64c994c4416d6b8/images/640a7ee0-db88-4905-a550-89e571c94697.png" class="mcnImage" height="10" width="580" style="display:block; line-height:0px;">\n														</td>\n														<td align="center" height="10" valign="top" width="10">\n															<img src="https://gallery.mailchimp.com/27aac8a65e64c994c4416d6b8/images/d4042106-8117-4b79-b76b-91f8d64c5dff.gif" height="10" width="10" style="display:block; line-height:0px;">\n														</td>\n													</tr>\n                                                	<tr>\n                                                    	<td align="center" colspan="3" valign="top">\n                                                        	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="headerFrontBackground">\n                                                                <tr>\n                                                                    <td align="center" valign="top">\n                                                                       \n                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" id="">\n                                                                            <tr>\n                                                                                <td valign="top" class="headerContainer" style="padding-top:20px; padding-bottom:20px;"><table class="mcnTextBlock" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnTextBlockOuter">\n        <tr>\n            <td class="mcnTextBlockInner" valign="top">\n                \n                <table class="mcnTextContentContainer" align="left" border="0" cellpadding="0" cellspacing="0" width="600">\n                    <tbody><tr>\n                        \n                        <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;" valign="top">\n                        \n                            <h1>Servicio, suspendido por falta de pago</h1>\n                        </td>\n                    </tr>\n                </tbody></table>\n                \n            </td>\n        </tr>\n    </tbody>\n</table><table class="mcnTextBlock" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnTextBlockOuter">\n        <tr>\n            <td class="mcnTextBlockInner" valign="top">\n                \n                <table class="mcnTextContentContainer" align="left" border="0" cellpadding="0" cellspacing="0" width="600">\n                    <tbody><tr>\n                        \n                        <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;" valign="top">\n                        \n                            Estimado Sr.(a). {{$cliente}} le comunicamos que no se registro el pago por el servicio de internet, su fecha de vencimiento fue el {{$vencimiento}}, para habilitar el servicio realize el pago de {{$costo}} {{$moneda}} según el plan {{$plan}} contratado.Si esto es incorrecto le pedimos disculpas y le solicitamos que se comunique con nosotros al tel: 8004145454 a fin de aclarar esta situación.</em><br><br>\n                        </td>\n                    </tr>\n                </tbody></table>\n                \n            </td>\n        </tr>\n    </tbody>\n</table><table class="mcnButtonBlock" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnButtonBlockOuter">\n        <tr>\n            <td style="padding-top:0; padding-right:18px; padding-bottom:18px; padding-left:18px;" class="mcnButtonBlockInner" align="center" valign="top">\n                <table class="mcnButtonContentContainer" style="border-collapse: separate ! important;border: 2px solid #F2F2F2;border-radius: 4px;background-color: #FFFFFF;" border="0" cellpadding="0" cellspacing="0">\n                    <tbody>\n                        <tr>\n                            <td style="font-family: Arial; font-size: 16px; padding: 20px;" class="mcnButtonContent" align="center" valign="middle">\n                                <a class="mcnButton " title="Update your subscription settings" href="#" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #D55258;">Area de clientes</a>\n                            </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n        </tr>\n    </tbody>\n</table></td>\n                                                                            </tr>\n                                                                        </table>\n                                                                       \n                                                                    </td>\n                                                                </tr>\n                                                            </table>\n                                                        </td>\n                                                    </tr>\n                                                </table>\n											</td>\n										</tr>\n									</table>\n									\n								</td>\n							</tr>\n                            <tr>\n                                <td align="center" valign="top">\n                                    \n                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">\n                                        <tr>\n                                            <td align="center" valign="top">\n                                                <table border="0" cellpadding="0" cellspacing="0" width="600" class="templateContainer">\n                                                    <tr>\n                                                        <td valign="top" class="bodyContainer" style="padding-top:10px; padding-bottom:10px;"><table class="mcnTextBlock" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnTextBlockOuter">\n        <tr>\n            <td class="mcnTextBlockInner" valign="top">\n                \n                <table class="mcnTextContentContainer" align="left" border="0" cellpadding="0" cellspacing="0" width="600">\n                    <tbody><tr>\n                        \n                        <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;" valign="top">\n                        \n                            \n¿Quieres saber más sobre tu empres? Aquí está la <a href="#">texto completo </a>. Tu empresa <a href="#">proveedor de internet wifi</a> \npara particulares y empresas.<br><br><em>Si vous voulez en savoir plus sur la LCAP, voici <a href="#">le texte intégral de la loi</a>. tu empresa <a href="#">une page d''information</a> pour les particuliers et les entreprises.</em><br><br>Thanks for your help!<br><em>Merci pour votre aide!</em>\n                        </td>\n                    </tr>\n                </tbody></table>\n                \n            </td>\n        </tr>\n    </tbody>\n</table></td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </table>\n                                  \n                                </td>\n                            </tr>\n                            <tr>\n                                <td align="center" valign="top" style="padding-bottom:40px;">\n                                    \n                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateFooter">\n                                        <tr>\n                                            <td align="center" valign="top">\n                                                <table border="0" cellpadding="0" cellspacing="0" width="600" class="templateContainer">\n                                                    <tr>\n                                                        <td valign="top" class="footerContainer" style="padding-top:10px; padding-bottom:10px;"><table class="mcnDividerBlock" style="min-width:100%;" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnDividerBlockOuter">\n        <tr>\n            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">\n                <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #AAAAAA;" border="0" cellpadding="0" cellspacing="0" width="100%">\n                    <tbody><tr>\n                        <td>\n                            <span></span>\n                        </td>\n                    </tr>\n                </tbody></table>\n\n            </td>\n        </tr>\n    </tbody>\n</table><table class="mcnTextBlock" border="0" cellpadding="0" cellspacing="0" width="100%">\n    <tbody class="mcnTextBlockOuter">\n        <tr>\n            <td class="mcnTextBlockInner" valign="top">\n                \n                <table class="mcnTextContentContainer" align="left" border="0" cellpadding="0" cellspacing="0" width="600">\n                    <tbody><tr>\n                        \n                        <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;" valign="top">\n                        \n                            <em>Copyright © |2016 |{{$empresa}}| Todos los derechos reservados.</em>\n<br>\n|OTROS|\n    |OTROS|\n    <br>\n    <br>\n    <strong>Correo electrónico:</strong>\n    <br>\n    Dirección\n    <br>\n    <br>\n	\n                        </td>\n                    </tr>\n                </tbody></table>\n                \n            </td>\n        </tr>\n    </tbody>\n</table></td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </table>\n                                 \n                                </td>\n                            </tr>\n						</table>\n						\n                    </td>\n                </tr>\n            </table>\n        </center>\n    </body>\n</html>'),
(4, 'Factura cliente', '2018-09-01', 'invoice', 1, 'Factura_cliente.blade.php', '<!DOCTYPE html>\n<html lang="es">\n<head>\n    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>\n    <meta charset="utf-8" />\n    <title>{{@$empresa}} - Factura nº {{@$numFactura}}</title>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />\n    <style>\n    \n    body {\n    margin: 15px;\n    padding: 0;\n    background-color: #ffffff;\n}\n\nbody,td,input,select {\n    font-family: Tahoma;\n    font-size: 11px;\n    color: #000000;\n}\n\nform {\n    margin: 0px;\n}\n\na {\n    font-size: 14px;\n    color: #1E598A;\n    padding: 10px;\n}\n\na:hover {\n    text-decoration: none;\n}\n\n.textcenter {\n    text-align: center;\n}\n\n.textright {\n    text-align: right;\n}\n\n.wrapper {\n    margin: 0 auto;\n    padding: 10px 20px 70px 20px;\n    width: 600px;\n    background-color: #fff;\n    border: 1px solid #ccc;\n    -moz-border-radius: 6px;\n    -webkit-border-radius: 6px;\n    -o-border-radius: 6px;\n    border-radius: 6px;\n}\n\n.header {\n    margin: 0 0 15px 0;\n    width: 100%;\n}\n\n.addressbox {\n    height: 100px;\n    padding: 10px;\n    background-color: #fff;\n    border: 1px solid #ccc;\n    color: #000;\n    overflow: hidden;\n}\n\ntable.items {\n    width: 100%;\n    background-color: #ccc;\n    border-spacing: 0;\n    border-collapse: separate;\n    border-left: 1px solid #ccc;\n}\n\ntable.items tr.title td {\n    margin: 0;\n    padding: 2px 5px;\n    line-height: 16px;\n    background-color: #efefef;\n    border: 1px solid #ccc;\n    border-bottom: 0;\n    border-left: 0;\n    font-size: 12px;\n    font-weight: bold;\n}\n\ntable.items td {\n    margin: 0;\n    padding: 2px;\n    line-height: 15px;\n    background-color: #fff;\n    border: 1px solid #ccc;\n    border-bottom: 0;\n    border-left: 0;\n}\n\ntable.items tr:last-child td {\n    border-bottom: 1px solid #ccc;\n}\n\n.row {\n    margin: 15px 0;\n}\n\n.title {\n    font-size: 16px;\n    font-weight: bold;\n}\n\n.subtitle {\n    font-size: 13px;\n    font-weight: bold;\n}\n\n.unpaid {\n    font-size: 20px;\n    color: #cc0000;\n    font-weight: bold;\n}\n\n.paid {\n    font-size: 20px;\n    color: #779500;\n    font-weight: bold;\n}\n\n.refunded {\n    font-size: 20px;\n    color: #224488;\n    font-weight: bold;\n}\n\n.cancelled {\n    font-size: 16px;\n    color: #cccccc;\n    font-weight: bold;\n}\n\n.collections {\n    font-size: 16px;\n    color: #ffcc00;\n    font-weight: bold;\n}\n\n.creditbox {\n    margin: 0 auto 15px auto;\n    padding: 10px;\n    border: 1px dashed #cc0000;\n    font-weight: bold;\n    background-color: #FBEEEB;\n    text-align: center;\n    width: 95%;\n    color: #cc0000;\n}\n.ba{\n	background-color:#EFEFEF;\n}\n    </style>\n  </head>\n\n  <body>\n\n<div class="wrapper">\n\n\n<table class="header"><tbody><tr><td nowrap="nowrap" width="50%">\n\n<p><img src="{{URL::to(''assets/imgeditor/imagenes/logo.jpg'')}}"></p>\n</td><td align="center" width="50%">\n<font class="paid">Pagada</font><br>\n<p><strong>FCN Internet Service Provider</strong></p>\n<p>Dirección Calle 000 - Zona - Argentina</p>\n<p>Realize el pago en los bancos autorizados, No te quedes sin internet.<br>\n<br>\n\n\n</td></tr></tbody></table>\n\n<div class="row ba">\n<span class="title">Factura nº {{$numFactura}}</span><br>\nFecha de la Factura: {{$fechaPago}}<br>\nFecha de Vencimiento: {{$vencimiento}}\n</div>\n\n<table class="">\n<tbody><tr><td width="50%">\n\n<div class="">\n\n<strong>Facturado a:</strong><br>\n{{$cliente}}<br>\n{{$direccionCliente}}<br>\n{{$telefonoCliente}}<br>\n{{$emailCliente}}\n\n</div>\n\n</td></tr></tbody></table>\n<br>\n<table class="items">\n    <tbody><tr class="title textcenter">\n        <td width="70%">Descripción</td>\n        <td width="30%">Importe</td>\n    </tr>\n    <tr>\n        <td>Servicio de Internet banda ancha WIFI\n          <p>\n            Periodo de facturación del {{@$vencimiento}} al {{@$hastafecha}}\n          </p>\n          <p>\n            Fecha de suspensión del servicio: {{@$vencimiento}}\n          </p>\n          <p>\n            Plan de Internet: {{@$plan}}\n          </p>\n          <p>\n            Velocidad de descarga: {{@$descarga}} kbps\n          </p>\n          <p>\n            Velocidad de Subida: {{@$subida}} kbps\n          </p>\n        </td>\n        <td class="textcenter">{{@$Smoneda}}{{@$costo}}  {{@$moneda}}</td>\n    </tr>\n    \n    <tr class="title">\n        <td class="textright">Sub Total:</td>\n        <td class="textcenter">{{@$Smoneda}}{{@$total}}  {{@$moneda}}</td>\n    </tr>\n            <tr class="title">\n        <td class="textright">Importe IVA:</td>\n        <td class="textcenter">{{@$Smoneda}}{{@$iva}} {{@$moneda}}</td>\n    </tr>\n    <tr class="title">\n        <td class="textright">Total:</td>\n        <td class="textcenter">{{@$Smoneda}}{{@$total}}  {{@$moneda}}</td>\n    </tr>\n</tbody></table>\n\n\n<div class="row">\n<span class="subtitle">Otros Servicios</span>\n</div>\n\n<table class="items">\n    <tbody><tr class="title textcenter">\n        <td width="30%">Fecha</td>\n        <td width="25%">Descripción</td>\n        <td width="25%">ID Servicio</td>\n        <td width="20%">Total</td>\n    </tr>\n    <tr>\n        <td class="textcenter" colspan="4">No se encontraron Servicio relacionados</td>\n    </tr>\n    <tr class="title">\n        <td class="textright" colspan="3">Balance:</td>\n        <td class="textcenter">{{@$Smoneda}}{{@$total}} {{@$moneda}}</td>\n    </tr>\n</tbody></table>\n</div>\n{{ HTML::script(''assets/js/jquery.min.js'') }}\n<script type="text/javascript">\n$(document).ready(function() {  \nwindow.print(); \n});	\n</script>\n</body></html>'),
(5, 'Recordatorio de pago sms', '2018-07-01', 'sms', 1, 'Recordatorio_de_pago_sms.blade.php', 'Señor(a) cliente, recordamos que su servicio de internet vence el {{$vencimiento}},\nTotal a pagar {{$costo}}.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_advs`
--

CREATE TABLE IF NOT EXISTS `temp_advs` (
`id` int(11) NOT NULL,
  `id_notice` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_sms`
--

CREATE TABLE IF NOT EXISTS `temp_sms` (
`id` int(11) NOT NULL,
  `sms_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `smsgateway_id` bigint(20) NOT NULL,
  `status` char(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`id` int(11) NOT NULL,
  `subject` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `section` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `status` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `read_admin` tinyint(1) NOT NULL,
  `read_client` tinyint(1) NOT NULL,
  `client_id` int(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `level` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `photo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `phone`, `level`, `status`, `photo`, `remember_token`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'default', 'default@example.com', '0', 'ad', 1, 'none', '9HAbamQKhywo4pOCzjW2hEkXiljl00P2M0KMwqpa2vQRgNEX3HxIlJRHMpvt', '$2y$10$wxnC2y1dxq4kykeZap6AjeHnYe64CeM.Ws58cK1Lr/Xc88q8IlNpa', '2017-03-01 04:00:00', '2018-08-28 16:08:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address_routers`
--
ALTER TABLE `address_routers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `adv_settings`
--
ALTER TABLE `adv_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `answers`
--
ALTER TABLE `answers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bill_customers`
--
ALTER TABLE `bill_customers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `boxes`
--
ALTER TABLE `boxes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_routers`
--
ALTER TABLE `control_routers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `router_id` (`router_id`);

--
-- Indices de la tabla `global_apis`
--
ALTER TABLE `global_apis`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `global_settings`
--
ALTER TABLE `global_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `networks`
--
ALTER TABLE `networks`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notices`
--
ALTER TABLE `notices`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_records`
--
ALTER TABLE `payment_records`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `queued_processes`
--
ALTER TABLE `queued_processes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `routers`
--
ALTER TABLE `routers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms`
--
ALTER TABLE `sms`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms_inbox`
--
ALTER TABLE `sms_inbox`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suspend_clients`
--
ALTER TABLE `suspend_clients`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `templates`
--
ALTER TABLE `templates`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp_advs`
--
ALTER TABLE `temp_advs`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp_sms`
--
ALTER TABLE `temp_sms`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address_routers`
--
ALTER TABLE `address_routers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `adv_settings`
--
ALTER TABLE `adv_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `answers`
--
ALTER TABLE `answers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `bill_customers`
--
ALTER TABLE `bill_customers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `boxes`
--
ALTER TABLE `boxes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `control_routers`
--
ALTER TABLE `control_routers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `global_apis`
--
ALTER TABLE `global_apis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `global_settings`
--
ALTER TABLE `global_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `networks`
--
ALTER TABLE `networks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notices`
--
ALTER TABLE `notices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `payment_records`
--
ALTER TABLE `payment_records`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `queued_processes`
--
ALTER TABLE `queued_processes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `routers`
--
ALTER TABLE `routers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sms`
--
ALTER TABLE `sms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sms_inbox`
--
ALTER TABLE `sms_inbox`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `suspend_clients`
--
ALTER TABLE `suspend_clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `templates`
--
ALTER TABLE `templates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `temp_advs`
--
ALTER TABLE `temp_advs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `temp_sms`
--
ALTER TABLE `temp_sms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
