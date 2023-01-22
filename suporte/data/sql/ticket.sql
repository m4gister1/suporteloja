-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2016 at 03:17 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `producoe_suporte`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `description` text,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Atendimento'),
(2, 'Financeiro'),
(3, 'Assistência Técnica');

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE IF NOT EXISTS `generals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `client_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `user_id`, `client_id`, `status`) VALUES
(1, 1, 4, 1),
(2, 1, 8, 1),
(3, 1, 9, 1),
(4, 1, 10, 1),
(5, 1, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invitation_settings`
--

CREATE TABLE IF NOT EXISTS `invitation_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `invitation_settings`
--

INSERT INTO `invitation_settings` (`id`, `title`, `content`) VALUES
(1, 'Bem vindo cliente', '<p>Ola seja bem vindo</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short`) VALUES
(1, 'English', 'en'),
(2, 'Português', 'thiago');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `description` text,
  `receive_emails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `currency_id`, `name`, `country`, `state`, `city`, `zip`, `address`, `contact`, `phone`, `email`, `website`, `bank`, `bank_account`, `description`, `receive_emails`) VALUES
(1, NULL, 'Thiago', 'brasil', 'centro', 'sao paulo', '45000000', 'centro', 'brasil', '7788888888', 'thiago@gmail.com', 'http://www.domain.com', NULL, NULL, 'dsdss', 'thiago@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned DEFAULT NULL,
  `client_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned NOT NULL,
  `priority_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `staff_id`, `client_id`, `department_id`, `priority_id`, `type_id`, `status_id`, `title`, `content`, `state`, `updated_at`, `created_at`) VALUES
(1, 1, 3, 3, 3, 1, 7, 'TESTE', '<p>Ola este ticket &eacute; um tete</p>\r\n', 1, '2016-01-29', '2016-01-19'),
(2, 1, 4, 1, 1, 1, 0, 'boa tarde', '<p>boa tarde preciso saber o que esta acontecendo com o meu celular</p>\r\n', 1, '2016-01-20', '2016-01-20'),
(3, 1, 9, 3, 3, 1, 7, 'serviço de cabo de rede ', '<p>isoo</p>\r\n', 1, '2016-01-29', '2016-01-27'),
(4, 1, 10, 1, 1, 1, 0, 'computador dani reiniciando', '<p>O computador da dani esta ligando e desligando toda Hora, por favor verificar.</p>\r\n', 1, '2016-01-29', '2016-01-29'),
(5, 1, 10, 3, 3, 4, 2, 'Atualizar Sistema', '<p>Solicito que seja atualizado a Vers&atilde;o do sistema para 2016.</p>\r\n', 1, '2016-02-01', '2016-01-29'),
(6, 1, 11, 1, 2, 1, 0, 'Limpeza de lotes', '<p>Preciso da limpeza do lote na rua carmo do rio claro 200</p>\r\n', 1, '2016-02-01', '2016-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_histories`
--

CREATE TABLE IF NOT EXISTS `ticket_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `from_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ticket_histories`
--

INSERT INTO `ticket_histories` (`id`, `ticket_id`, `user_id`, `from_id`, `title`, `content`, `state`, `updated_at`, `created_at`) VALUES
(1, 2, 4, 1, 'boa tarde ', '<p>seu celular esta em manuten&ccedil;&atilde;o esperando a bateria para chegar acompanhe nos por este cana</p>\r\n', 0, '2016-01-20', '2016-01-20'),
(2, 3, 9, 1, 'Responder a ...: serviço de cabo de rede ', 'boa noite ', 1, '2016-01-27', '2016-01-27'),
(3, 4, 10, 1, 'Responder a ...: computador dani reiniciando', 'Estaremos verificando', 1, '2016-01-29', '2016-01-29'),
(4, 6, 11, 1, 'Responder a ...: Limpeza de lotes', '<p>Obrigado por sua solicita&ccedil;&atilde;o, seu lote ser&aacute; limpo em aproximadamente 10 dias &uacute;teis.</p>\r\n\r\n<p>Agradecemos seu contato.</p>\r\n', 0, '2016-02-01', '2016-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

CREATE TABLE IF NOT EXISTS `ticket_priorities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ticket_priorities`
--

INSERT INTO `ticket_priorities` (`id`, `user_id`, `name`) VALUES
(1, 1, 'Urgência'),
(2, 1, 'Emergência'),
(3, 1, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE IF NOT EXISTS `ticket_statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `user_id`, `name`) VALUES
(1, 1, 'Fechado'),
(2, 1, 'Aberto'),
(3, 1, 'Processsando'),
(4, 1, 'Finalizado'),
(6, 1, 'Sem concerto'),
(7, 1, 'Em Andamento'),
(8, 1, 'Orçamento');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `user_Id`, `name`) VALUES
(1, 1, 'Manutenção em Equipamentos'),
(2, 1, 'Suporte Equipamento'),
(4, 1, 'Suporte Sistema'),
(5, 1, 'Dúvidas'),
(9, 1, 'Treinamentos'),
(10, 1, 'Envio de Notas Fiscais ao Contador, XML');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `language_id` int(11) unsigned NOT NULL DEFAULT '1',
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `parent_id`, `language_id`, `name`, `email`, `password`, `status`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 1, 0, 2, 'Admin', 'admin@demo.demo', '$2y$10$cEmvWwlw9o5vBubarGY69egN5gftxO82xhrLhNWiImpEbk9x/tN3C', 1, 'GJaRVA2D6EAO0Cf1kyCNwlDuB8ijHrmDxVmZTmGJ3VYHScWPY6f5BZQUbeU1', '2016-01-30', '2014-11-20'),
(2, 2, 1, 1, 'Thiago', 'teste@gmail.com', '$2y$10$WqguZu54bkJQcqrUlJ985uFcDMnrFtZ5pX7.KLz/Kw2Du3XyB7rIi', 1, NULL, '2016-01-19', '2016-01-19'),
(3, 3, 0, 2, 'thiago', 'thiago.89@icloud.com', '$2y$10$mWAJd/hTwUjrF52QCZLaFunI7l31/OBYVOGpgIALot5eUcWnUVlAu', 0, 'z26jPyHMdFhwCej1TldNKA4PQm753JGrXWaSVjmRbcP1bkxbloW84m9ON6Ke', '2016-02-01', '2016-01-19'),
(4, 3, 1, 2, 'luis eduardo dansieri', 'dududansieri@hotmail.com', '$2y$10$dCuLse3nSFNbRX8LlV/f/ODcxhZDl08mUFe3TMt1vog.I6CQ.4F5m', 0, NULL, '2016-01-20', '2016-01-20'),
(5, 3, 0, 1, 'RAFAEL', 'rafa_rs9@hotmail.com', '$2y$10$EIIk3ikM5MQeb9IMUsjzm.F6F35UuCDzGvJHyfQxGA93NdNIPjqcK', 1, NULL, '2016-01-20', '2016-01-20'),
(6, 3, 1, 2, 'velloso2008', 'velloso2008@gmail.com', '$2y$10$E24h9m0c2U0SXGh1jXtfT.fXAdZgvgrw1CGX0Q97DzedEkg2VhgeO', 1, 'UdOASGf4jrt07T5kfBUHAFjHG8yG9JB76MeNOwnZdZ7SFnBXXteHZXKScm7W', '2016-01-21', '2016-01-21'),
(7, 3, 0, 1, 'Thiago', 'rttecnologia@gmail.com', '$2y$10$NEGchYCYgto.7VkWGKKo/OiMfmqUAKRxLKKI6lCGcN52r2a7sLn3m', 1, NULL, '2016-01-25', '2016-01-25'),
(8, 3, 0, 1, 'thiago', 'rttecnologialtda@gmail.com', '$2y$10$fT2QOM11xW9AQ2fxkdONL.QQXM11b6fBr8JkxNAVTnKXa3W4AwewK', 1, NULL, '2016-01-25', '2016-01-25'),
(9, 3, 1, 2, 'alan', 'alanxmacedo@gmail.com', '$2y$10$AhUaJrRlE5c93cxaEoqwoOQi86uKFQu7f4n1TDCbNJ3wc61GOuU8i', 1, '1lKd62GgL0X10LAcGztT3tGK3Bt9aDjy8aVJBk9ZoVggnOucFbBPELwethSa', '2016-01-27', '2016-01-27'),
(10, 3, 1, 2, 'Carlão', 'carlao@teste.com', '$2y$10$zU743Ej5b64wvwalre3ETe5edmL/IwqTdYvuCeaWRpB8dR8o1UbCG', 1, 'KXguJQ76cR8h4yQ3WUcjm5jL6f8s8zLmCQM9C7wpP3HL54C2u3WuLdwg8ZuP', '2016-01-30', '2016-01-29'),
(11, 3, 0, 1, 'BArcelos', 'falecombarcelos@gmail.com', '$2y$10$.ZDna1QinVFaRk43lodJ1OHlGNVAWIcfHqFJ1K8uQtqAvcGLItaNW', 1, NULL, '2016-02-01', '2016-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE IF NOT EXISTS `user_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `department_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_departments`
--

INSERT INTO `user_departments` (`id`, `user_id`, `department_id`) VALUES
(1, 2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
