-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 31-Maio-2016 às 16:31
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto`
--
CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `projeto`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `apagar_tudo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `apagar_tudo` ()  BEGIN
	delete from usuario;
END$$

DROP PROCEDURE IF EXISTS `primeiros_cadastrados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `primeiros_cadastrados` ()  BEGIN
SELECT nome_usuario FROM usuario 
ORDER BY id_usuario ASC 
LIMIT 10;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `consulta_produto`
--
DROP VIEW IF EXISTS `consulta_produto`;
CREATE TABLE IF NOT EXISTS `consulta_produto` (
`id_produto` int(11)
,`nome_produto` varchar(50)
,`desc1_produto` varchar(1000)
,`desc2_produto` varchar(1000)
,`categoria_produto` varchar(30)
,`preco_produto` decimal(10,2)
,`foto` varchar(255)
,`qt_produto` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `nome_contato` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cpf_contato` int(11) NOT NULL,
  `email_contato` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `assunto_contato` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem_contato` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cpf_contato`),
  UNIQUE KEY `cpf_contato` (`cpf_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(50) NOT NULL,
  `categoria_produto` varchar(50) NOT NULL,
  `qt_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome_produto` (`nome_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_produto`, `nome_produto`, `categoria_produto`, `qt_produto`) VALUES
(1, 'GTX 1080', 'Placa de Video', 10),
(2, 'Processador Intel Core i7-6700', 'Processadores', 11),
(3, 'MemÃ³ria Kingston HyperX FURY', 'MemÃ³ria RAM', 20),
(4, 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 2', 'Placa de Video', 31);

--
-- Acionadores `estoque`
--
DROP TRIGGER IF EXISTS `delete_produto`;
DELIMITER $$
CREATE TRIGGER `delete_produto` BEFORE DELETE ON `estoque` FOR EACH ROW BEGIN
 DELETE FROM produto where id_produto = id_produto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(50) NOT NULL,
  `desc1_produto` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc2_produto` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categoria_produto` varchar(30) NOT NULL,
  `preco_produto` decimal(10,2) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome_produto` (`nome_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_produto`, `desc1_produto`, `desc2_produto`, `categoria_produto`, `preco_produto`, `foto`) VALUES
(1, 'GTX 1080 ', 'Placa de VÃ­deo VGA GigaByte GTX 1080 Founders Edition 8GB GDDR5X 256Bits PCI-Express 3.0 GV-N1080D5X-8GD-B', 'Interface: - PCI-E 3.0 x 16   Chipset: - PCB Form: ATX - GPU: GeForce GTX 1080 - NÃºcleo Clock: BOOST 1733 MHz /BASE 1607 MHz   MemÃ³ria: - Clock eficaz da memÃ³ria: 10,000 MHz - Tamanho da memÃ³ria: 8 GB - Interface da memÃ³ria: 256 bit - Tipo de MemÃ³ria: GDDR5X  API 3D: - DirectX 12 - OpenGL 4.5   Portas: - 1 x HDMI 2.0b - 3 x DP1.4 - 1 x Dual-link DVI-D   Geral: - ResoluÃ§Ã£o mÃ¡xima: 7680x4320 - Requistos do sistema: Fonte de alimentaÃ§Ã£o de 500W no mÃ­nimo - CompatÃ­vel com Dual-Link DVI - Multi-view: 4', 'Placa de Video', '5000.00', '378e327829da436d5b309f847640b021.png'),
(2, 'Processador Intel Core i7-6700 ', 'Processador Intel Core i7-6700, Cache 8MB, Skylake 6a GeraÃ§Ã£o, Quad-Core 3.4 GHz LGA 1151 BX80662I76700', '- NÃºmero do Processador: i7-6700 - Cache: 8 MB - DMI3: 8 GT / s - Conjunto de instruÃ§Ãµes: 64-bit - ExtensÃµes do conjunto: SSE4.1/4.2 AVX 2.0 - Litografia: 14nm - Soquete: FCLGA1151 - Tamanho mÃ¡ximo de memÃ³ria (de acordo com o tipo de memÃ³ria): 64GB  - Tipos de memÃ³ria: DDR4-1866 / 2133, DDR3L-1333/1600 @ 1.35V   Desempenho:  - NÃºmero de nÃºcleos: 4 - NÂº de Threads: 8 - FrequÃªncia baseada em processador: 3.4 GHz - FrequÃªncia mÃ¡xima: 4 GHz - TDP: 65 W   GrÃ¡ficos: - GrÃ¡ficos do processador: IntelÂ® HD 530 GrÃ¡ficos - FrequÃªncia da base grÃ¡fica: 350 MHz - MÃ¡x. frequÃªncia dinÃ¢mica da placa grÃ¡fica de vÃ­deo: 1.15 GHz - Quantidade mÃ¡xima de memÃ³ria grÃ¡fica de vÃ­deo: 1.7 GB - Intel Quick Sync Video - Tecnologia Intel In Tru 3D - Intel Wireless Display - Intel Insider - Tecnologia de alta definiÃ§Ã£o Intel Clear Video - NÂº de Telas suportadas: 3   ExpansÃ£o:  - RevisÃ£o de PCI Express: 3.0 - ConfiguraÃ§Ãµes PCI Express: AtÃ© 1x16, 2x8, 1x8 + 2x4 - NÂº mÃ¡x. de linhas ', 'Processadores', '1800.00', '7d227c12b1f6ae199314d07f0e025201.jpg'),
(3, 'MemÃ³ria Kingston HyperX FURY ', 'A memÃ³ria HyperX FURY estÃ¡ disponÃ­vel nas capacidades de 4GB e 8GB com frequÃªncias que variam entre 1333MHz, 1600MHz e 1866MHz. Todas as memÃ³rias HyperX FURY possuem o PCB preto e um dissipador de calor assimÃ©trico, este podendo ser Azul, Preto, Vermelho ou, pela primeira vez, branco. Perfeita para quem procura uma memÃ³ria de desempenho com um preÃ§o acessÃ­vel, a HyperX FURY Ã© Plug and Play, basta conecta-la que o reconhecimento de sua plataforma host e o overclock Ã© feito automaticamente. Agora cabe a vocÃª optar pela HyperX FURY e fazer este upgrade de performance e estilo.', '- Tipo: 240-Pin DDR3 SDRAM - Capacidade: 4GB - AceleraÃ§Ã£o: DDR3 1866 (PC3 10600) - Cas LatÃªncia: 10 - TensÃ£o: 1.5V', 'MemÃ³ria RAM', '150.00', 'f057d4bf181e3cce3dd615229db909a0.jpg'),
(4, 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 2', 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 270X 2GB DDR5 256-Bits PCI-Express 11217-02-40G', 'Processador GrÃ¡fico AMD Radeon R9 270X. - Processadores Stream: 1.280 - Processo de fabricaÃ§Ã£o: 28nm - Unidades de Textura / ROPs: 80 / 32 - FreqÃ¼Ãªncia: 1,1GHz (PadrÃ£o) / 1,15GHz (Boost)  MemÃ³ria: - PadrÃ£o: GDDR5 - Interface: 256bits - Capacidade: 2GB - FreqÃ¼Ãªncia: 6GHz  Interface: - PCI Express 16x (v3.0)  ConexÃµes de vÃ­deo e resoluÃ§Ãµes: - HDMI: 4.096 x 2.160 - DisplayPort: 4.096 x 2.160 - DVI-I (Dual Link): 2.560 x 1.600 - DVI-D (Dual Link): 1.920 x 1.080  Tecnologias suportadas: - Shader v5.0 - DirectX v11.2 - OpenGL v4.3 - OpenCL v1.2 - DisplayPort v1.2 - HDMI v1.4a (3GHz) - DirectCompute v11 - AMD App / Eyefinity 2.0 / CrossFireX (2-way) / HD3D / PowerPlay / PowerTune / ZeroCore / DDMA / Mantle  Energia: TDP MÃ¡ximo: Â± 180W  ConexÃµes internas: - 2x PCI Express (6 pinos)  DimensÃµes: - L x A x P: 11,3 x 4,1 x 30,8cm ', 'Placa de Video', '1000.00', '61d41843948f72d8c8d3357e4e16296a.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reg_cadastro`
--

DROP TABLE IF EXISTS `reg_cadastro`;
CREATE TABLE IF NOT EXISTS `reg_cadastro` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(50) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `hr_cadastro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reg_cadastro`
--

INSERT INTO `reg_cadastro` (`id_reg`, `nome_usuario`, `dt_cadastro`, `hr_cadastro`, `id_usuario`) VALUES
(1, 'Fubes', '2016-05-25', 144956, 8),
(2, 'teste', '2016-05-25', 145347, 9),
(3, 'joao', '2016-05-25', 145602, 10),
(4, 'oscilando', '2016-05-25', 162910, 11),
(5, 'oasihdo', '2016-05-25', 162948, 12),
(6, 'oscilando', '2016-05-25', 163013, 13),
(7, 'Fubes', '2016-05-26', 211203, 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(50) NOT NULL,
  `email_usuario` varchar(80) NOT NULL,
  `end_usuario` varchar(50) NOT NULL,
  `cep_usuario` int(8) NOT NULL,
  `num_usuario` int(4) NOT NULL,
  `cidade_usuario` varchar(30) NOT NULL,
  `estado_usuario` char(2) NOT NULL,
  `senha_usuario` varchar(40) NOT NULL,
  `dt_cadastro` date DEFAULT NULL,
  `hr_cadastro` time DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_usuario` (`email_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `email_usuario`, `end_usuario`, `cep_usuario`, `num_usuario`, `cidade_usuario`, `estado_usuario`, `senha_usuario`, `dt_cadastro`, `hr_cadastro`) VALUES
(11, 'oscilando', 'b', 'b', 22222222, 50, 'asdqsfwf', 'sp', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL),
(12, 'Admin', 'admin@admin', 'T1', 22222222, 55, 'kajfakjf', 'sp', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL),
(13, 'oscilando', 'admin@kappa', 'asdkjasd', 22222222, 5, 'kajfakjf', 'sp', 'e4da3b7fbbce2345d7772b0674a318d5', NULL, NULL),
(19, 'Fubes', 'Fubes@gmail.com', 'TSC', 11660407, 27, 'Caraguatatuba', 'SP', '202cb962ac59075b964b07152d234b70', NULL, NULL);

--
-- Acionadores `usuario`
--
DROP TRIGGER IF EXISTS `reg_cadastro`;
DELIMITER $$
CREATE TRIGGER `reg_cadastro` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
INSERT INTO reg_cadastro SET
id_usuario = NEW.id_usuario,
nome_usuario = new.nome_usuario,
dt_cadastro=CURDATE(),
hr_cadastro=CURTIME();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `consulta_produto`
--
DROP TABLE IF EXISTS `consulta_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_produto`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `nome_produto`,`p`.`desc1_produto` AS `desc1_produto`,`p`.`desc2_produto` AS `desc2_produto`,`p`.`categoria_produto` AS `categoria_produto`,`p`.`preco_produto` AS `preco_produto`,`p`.`foto` AS `foto`,`e`.`qt_produto` AS `qt_produto` from (`produto` `p` join `estoque` `e` on((`p`.`id_produto` = `e`.`id_produto`))) ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
