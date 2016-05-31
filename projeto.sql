-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 31-Maio-2016 às 22:46
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 7.0.1

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

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`nome_contato`, `cpf_contato`, `email_contato`, `assunto_contato`, `mensagem_contato`) VALUES
('Teste', 55555555, 'teste@teste', 'Teste', 'teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, teste, ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(200) NOT NULL,
  `categoria_produto` varchar(50) NOT NULL,
  `qt_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `nome_produto` (`nome_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_produto`, `nome_produto`, `categoria_produto`, `qt_produto`) VALUES
(1, 'Placa de VÃ­deo VGA ASUS GTX 1080 Founders Edition 8GB GDDR5X 256Bits PCI-Express 3.0 GTX1080-8G', 'Placa de Video', 10),
(2, 'Processador Intel Core i7-6700, Cache 8MB, Skylake 6a GeraÃ§Ã£o, Quad-Core 3.4 GHz LGA 1151', 'Processadores', 11),
(3, 'MemÃ³ria Kingston HyperX FURY', 'MemÃ³ria RAM', 20),
(4, 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 2', 'Placa de Video', 31),
(5, 'Placa-MÃ£e GIGABYTE p/ Intel LGA 1151 ATX GA-Z170X-GAMING G1,DDR4', 'Placa mÃ£e', 26),
(6, 'Computador Gamer BA7 Ouro com Intel i7-4790 ASUS 16GB 3TB DVD 500W VGA 2GB ', 'Computador Gamer', 5),
(7, 'Notebook Gamer MSI GT80S Titan SLI, Intel Core i7 Skylake 6820HK, Titan SLI GTX970M, 16GB DDR4, 128 SSD, 1TB HD', 'Notebook Gamer', 6),
(8, 'Teclado Gamer MecÃ¢nico Razer Blackwidow Ultimate Chroma com Anti Ghosting', 'Teclado', 9),
(9, 'Headset Gamer Razer Kraken 7.1 Chroma com Microfone', 'Headset Gamer', 15),
(10, 'SSD Kingston HyperX Savage 2.5Â´ 960GB SATA Leituras: 560MB/s e GravaÃ§Ãµes: 530MB/s - SHSS3B7A/960G', 'SSD', 13),
(11, 'Corsair WaterCooler Hydro Series H105 240mm CW-9060016-WW', 'Cooler', 9),
(12, 'Processador AMD FX 8370 Octa Core, Black Edition, Cache 16MB, 4.0GHz (4.3GHz Max Turbo) AM3+', 'Processador', 8),
(13, 'Mouse Gamer Razer Ouroboros Elite Ambidestro Wireless 11BotÃµes 8200DPI', 'Mouse Gamer', 15),
(14, 'Placa-MÃ£e GIGABYTE p/ AMD AM3+ ATX GA-990FXA-UD5 R5, SLI/CFX, SATA 6Gb/s, USB 3.0', 'Placa mÃ£e', 11),
(15, 'Cooler FAN Corsair 120mm Air Series AF120 Quiet Edition CO-9050016-BLED Azul', 'Cooler', 10),
(16, 'AverMedia Placa de Captura Live Gamer HD Lite Full HD 1080P C985E', 'Placa de captura', 20);

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
-- Estrutura da tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `endereco_fornecedor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cnpj_fornecedor` int(7) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome_fornecedor`, `endereco_fornecedor`, `cnpj_fornecedor`) VALUES
(1, 'JoÃ£o', 'Rua Algusto Bernardo da Silva 698', 2536589);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_produto`, `desc1_produto`, `desc2_produto`, `categoria_produto`, `preco_produto`, `foto`) VALUES
(1, 'Placa de VÃ­deo VGA ASUS GTX 1080 Founders Edition', 'Placa de VÃ­deo VGA GigaByte GTX 1080 Founders Edition 8GB GDDR5X 256Bits PCI-Express 3.0 GV-N1080D5X-8GD-B', 'Interface: - PCI-E 3.0 x 16   Chipset: - PCB Form: ATX - GPU: GeForce GTX 1080 - NÃºcleo Clock: BOOST 1733 MHz /BASE 1607 MHz   MemÃ³ria: - Clock eficaz da memÃ³ria: 10,000 MHz - Tamanho da memÃ³ria: 8 GB - Interface da memÃ³ria: 256 bit - Tipo de MemÃ³ria: GDDR5X  API 3D: - DirectX 12 - OpenGL 4.5   Portas: - 1 x HDMI 2.0b - 3 x DP1.4 - 1 x Dual-link DVI-D   Geral: - ResoluÃ§Ã£o mÃ¡xima: 7680x4320 - Requistos do sistema: Fonte de alimentaÃ§Ã£o de 500W no mÃ­nimo - CompatÃ­vel com Dual-Link DVI - Multi-view: 4', 'Placa de Video', '5000.00', '378e327829da436d5b309f847640b021.png'),
(2, 'Processador Intel Core i7-6700, Cache 8MB, Skylake', 'Processador Intel Core i7-6700, Cache 8MB, Skylake 6a GeraÃ§Ã£o, Quad-Core 3.4 GHz LGA 1151 BX80662I76700', '- NÃºmero do Processador: i7-6700 - Cache: 8 MB - DMI3: 8 GT / s - Conjunto de instruÃ§Ãµes: 64-bit - ExtensÃµes do conjunto: SSE4.1/4.2 AVX 2.0 - Litografia: 14nm - Soquete: FCLGA1151 - Tamanho mÃ¡ximo de memÃ³ria (de acordo com o tipo de memÃ³ria): 64GB  - Tipos de memÃ³ria: DDR4-1866 / 2133, DDR3L-1333/1600 @ 1.35V   Desempenho:  - NÃºmero de nÃºcleos: 4 - NÂº de Threads: 8 - FrequÃªncia baseada em processador: 3.4 GHz - FrequÃªncia mÃ¡xima: 4 GHz - TDP: 65 W   GrÃ¡ficos: - GrÃ¡ficos do processador: IntelÂ® HD 530 GrÃ¡ficos - FrequÃªncia da base grÃ¡fica: 350 MHz - MÃ¡x. frequÃªncia dinÃ¢mica da placa grÃ¡fica de vÃ­deo: 1.15 GHz - Quantidade mÃ¡xima de memÃ³ria grÃ¡fica de vÃ­deo: 1.7 GB - Intel Quick Sync Video - Tecnologia Intel In Tru 3D - Intel Wireless Display - Intel Insider - Tecnologia de alta definiÃ§Ã£o Intel Clear Video - NÂº de Telas suportadas: 3   ExpansÃ£o:  - RevisÃ£o de PCI Express: 3.0 - ConfiguraÃ§Ãµes PCI Express: AtÃ© 1x16, 2x8, 1x8 + 2x4 - NÂº mÃ¡x. de linhas ', 'Processadores', '1800.00', '7d227c12b1f6ae199314d07f0e025201.jpg'),
(3, 'MemÃ³ria Kingston HyperX FURY DDR3 4GB 2x', 'A memÃ³ria HyperX FURY estÃ¡ disponÃ­vel nas capacidades de 4GB e 8GB com frequÃªncias que variam entre 1333MHz, 1600MHz e 1866MHz. Todas as memÃ³rias HyperX FURY possuem o PCB preto e um dissipador de calor assimÃ©trico, este podendo ser Azul, Preto, Vermelho ou, pela primeira vez, branco. Perfeita para quem procura uma memÃ³ria de desempenho com um preÃ§o acessÃ­vel, a HyperX FURY Ã© Plug and Play, basta conecta-la que o reconhecimento de sua plataforma host e o overclock Ã© feito automaticamente. Agora cabe a vocÃª optar pela HyperX FURY e fazer este upgrade de performance e estilo.', '- Tipo: 240-Pin DDR3 SDRAM - Capacidade: 4GB - AceleraÃ§Ã£o: DDR3 1866 (PC3 10600) - Cas LatÃªncia: 10 - TensÃ£o: 1.5V', 'MemÃ³ria RAM', '150.00', 'f057d4bf181e3cce3dd615229db909a0.jpg'),
(4, 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 2', 'Placa de vÃ­deo VGA Sapphire AMD Radeon TOXIC R9 270X 2GB DDR5 256-Bits PCI-Express 11217-02-40G', 'Processador GrÃ¡fico AMD Radeon R9 270X. - Processadores Stream: 1.280 - Processo de fabricaÃ§Ã£o: 28nm - Unidades de Textura / ROPs: 80 / 32 - FreqÃ¼Ãªncia: 1,1GHz (PadrÃ£o) / 1,15GHz (Boost)  MemÃ³ria: - PadrÃ£o: GDDR5 - Interface: 256bits - Capacidade: 2GB - FreqÃ¼Ãªncia: 6GHz  Interface: - PCI Express 16x (v3.0)  ConexÃµes de vÃ­deo e resoluÃ§Ãµes: - HDMI: 4.096 x 2.160 - DisplayPort: 4.096 x 2.160 - DVI-I (Dual Link): 2.560 x 1.600 - DVI-D (Dual Link): 1.920 x 1.080  Tecnologias suportadas: - Shader v5.0 - DirectX v11.2 - OpenGL v4.3 - OpenCL v1.2 - DisplayPort v1.2 - HDMI v1.4a (3GHz) - DirectCompute v11 - AMD App / Eyefinity 2.0 / CrossFireX (2-way) / HD3D / PowerPlay / PowerTune / ZeroCore / DDMA / Mantle  Energia: TDP MÃ¡ximo: Â± 180W  ConexÃµes internas: - 2x PCI Express (6 pinos)  DimensÃµes: - L x A x P: 11,3 x 4,1 x 30,8cm ', 'Placa de Video', '1000.00', '61d41843948f72d8c8d3357e4e16296a.jpg'),
(5, 'Placa-MÃ£e GIGABYTE p/ Intel LGA 1151 ATX GA-Z170X', 'Placa-MÃ£e GIGABYTE p/ Intel LGA 1151 ATX GA-Z170X-GAMING G1,DDR4,HDMI,USB 3.1 Tipo C,SATA Express, M.2 , Wireless,SLI/CFX,AMP-UP', 'CPU: - Suporte para Intel processadores Core i7 / Intel Core i5 / Intel Core i3 / Intel Pentium / Intel Celeron no pacote LGA1151 - Cache L3 varia com CPU  Chipset: - Intel Z170 Express Chipset  MemÃ³ria: - 4 x Soquetes DDR4 DIMM que suportam atÃ© 64 GB de memÃ³ria do sistema * Devido a um Windows 32-bit limitaÃ§Ã£o do sistema operacional, quando mais de 4 GB de memÃ³ria fÃ­sica instalada, a capacidade da memÃ³ria exibida serÃ¡ menor do que o tamanho do fÃ­sico memÃ³ria instalada. - Arquitetura de memÃ³ria dual channel - Suporte para DDR4 3866 (OC) / 3733 (OC) / 3666 (OC) / 3600 (OC) / 3466 (OC) / 3400 (OC) / 3333 (OC) / 3300 (OC) / 3200 (OC) / 3000 ( OC) / 2800 (OC) / 2666 (OC) / 2400 (OC) / 2133 mÃ³dulos de memÃ³ria MHz - Suporte para mÃ³dulos de memÃ³ria ECC UDIMM 1Rx8 / 2Rx8 (operar em modo nÃ£o-ECC) - Suporte para mÃ³dulos de memÃ³ria nÃ£o-ECC UDIMM 1Rx8 / 2Rx8 / 1Rx16 - Suporte para Extrema Perfil MemÃ³ria (XMP) mÃ³dulos de memÃ³ria  Ãudio:  - Criativo chip de som do nÃºcleo 3D ', 'Placa mÃ£e', '5000.00', '8e8cca5c9b69aecf282d4a4a0f57f4ef.jpg'),
(6, 'Computador Gamer BA7 Ouro com Intel i7-4790 ASUS 1', 'Computador Gamer BA7 Ouro com Intel i7-4790 ASUS 16GB 3TB DVD 500W VGA 2GB', '- CPU Intel i7-4790 3.6 GHz - Placa Asus H81M-A - MemÃ³ria 16GB DDR3 - HD 3 Tera 7200RPM SATA - Gabinete Gamer Kmex - Placa de Video Radeon R7250 2 GB DDR3 Radeon 128 bits  - Gravador DVD', 'Computador Gamer', '4500.00', 'dd2b00259a4f006b20d81acfe2f9ce60.jpg'),
(7, 'Notebook Gamer MSI GT80S Titan SLI, Intel Core i7 ', 'Notebook Gamer MSI GT80S Titan SLI, Intel Core i7 Skylake 6820HK, Titan SLI GTX970M, 16GB DDR4, 128 SSD, 1TB HD, Windows 10, Tela 18.4', 'Processador: - Intel Core i7 Skylake 6820HK   Tela: - Tamanho: 18,4 " - Full HD - ResoluÃ§Ã£o: 1920x1080 - Painel IPS   VGA: - Titan SLI GTX970M - 8GB GDDR5   HDD: - 1TB    MemÃ³ria Ram: - 16GB DDR4   Sistema operacional: - Windows 10 Home - Windows 10 Pro   Bateria: - 8 CÃ©lulas   Portas: - 1x HDMI - 5x USB 3.0 - 1x USB 3.1 Type-C - 1x Mini DisplayPort - Mic-in/Headphone-out', 'Notebook Gamer', '20000.00', '0077471a50f169251b475dbe6cc942ad.jpg'),
(8, 'Teclado Gamer MecÃ¢nico Razer Blackwidow Ultimate ', 'Teclado Razer Gamer MecÃ¢nico Blackwidow Ultimate Chroma com Anti Ghosting', '- Interruptor mecÃ¢nico silencioso. - ForÃ§a de atuaÃ§Ã§Ã£o: 50g.   - IluminaÃ§Ã£o do teclado. - Teclas totalmente programÃ¡veis. - 10 Key Rollover - OpÃ§Ã£o modo Gaming - Cabo de fibra tranÃ§ado - 05 teclas Macro adicionais - Ãudio-in e Microfone-out - ConexÃ£o USB ', 'Teclado', '1500.00', 'bb4fd28dd21ad39cbf812cb49de50f82.jpg'),
(9, 'Headset Gamer Razer Kraken 7.1 Chroma com Microfon', 'Headset Gamer Razer Kraken 7.1 Chroma com Microfone , Ã© o Headset com qualidade aprovada pelos streamers', 'Headphone: - Drivers: 40mm com neodÃ­mio - Resposta de freqÃ¼Ãªncia: 20Hz-20kHz - ImpedÃ¢ncia: 32Î© - Sensibilidade @ 1kHz: 112dB - PotÃªncia de saÃ­da: 30mW - Conector: Gold USB banhado - Comprimento do cabo: 2m  cabo tranÃ§ado USB   Microfone: - Resposta de freqÃ¼Ãªncia: 100Hz-12kHz - @ 1 kHz Sensibilidade: 40dB Â± 4dB - Sinal-ruÃ­do: 63dB - Pick-up padrÃ£o: Unidireciona', 'Headset Gamer', '750.00', '44898e3d1e095f695ffd604f8efe223c.jpg'),
(10, 'SSD Kingston HyperX Savage 2.5Â´ 960GB SATA Leitur', 'SSD Kingston HyperX Savage 2.5Â´  Ã© um ssd de alta velocidade e ideal para o melhor funcionamento do seu computador', 'apacidade - 960GB   Formato - 2.5"   Interface: - SATA 3 (6Gb/s) / 2 (3Gb/s)   Controladora - Phison PS3110-S10   TransferÃªncia de dados compactados (ATTO) - 560MB/s para leitura e 530MB/s para gravaÃ§Ã£o   TransferÃªncia de Dados nÃ£o compactados (AS-SSD e CrystalDiskMark) - 520MB/s para Leitura e 510MB/s para GravaÃ§Ã£o   IOMETER - Leitura/GravaÃ§Ã£o aleatÃ³ria mÃ¡xima 4K - atÃ© 100.000/ atÃ© 89.000 IOPS - 4k leitura/gravaÃ§Ã£o aleatÃ³ria: - atÃ© 93.000/ atÃ© 89.000 IOPS', 'SSD', '2600.00', '16581a5ba2e88e3c62397bf9e7adafb1.jpg'),
(11, 'Corsair WaterCooler Hydro Series H105 240mm CW-906', 'Corsair WaterCooler Hydro Series H105  Ã© o WaterCooler com a melhor eficiÃªncia no mercado atual', '- Tipo: Sistema de refrigeraÃ§Ã£o lÃ­quida - Material da Placa: Cobre - NÃ­vel de ruÃ­do: 37,7 dBA - PressÃ£o estÃ¡tica: 3,9 mm/H20 - Consumo de energia: 0.34A  Radiador: - DimensÃµes: 270 x 120 x 38 mm - Material do radiador: AlumÃ­nio  Cooler:  - Tamanho: 120mm (x2) - RPM: 800 - 2700 + / - 10% de RPM (PWM)  - Fluxo de Ar: 73 CFM  Compatibilidade CPU:  - Intel LGA 1150, 1155, 1156, 1366, e 2011 - AMD soquetes FM1, FM2, AM2 e AM3', 'Cooler', '750.00', '93005337aa8e04bcd06ade5f6e8818cb.jpg'),
(12, 'Processador AMD FX 8370 Octa Core, Black Edition, ', 'Processador AMD FX 8370 Octa Core Black Edition 4.0GHz (4.3GHz Max Turbo) 16MB AM3+ , Ã© um top de linha da AMD com grande qualidade', '- Socket Processador AM3+ - Processador AMD FX - Velocidade Clock Processador 4,3 Ghz - Velocidade DDR3 1866Mhz - Cache processador 16MB - Arquitetura 32 nm - NÃºmero de NÃºcleos 8 - Voltagem / TDP 125W', 'Processador', '800.00', 'd64df31639e76d1f5c528846d41f7087.jpg'),
(13, 'Mouse Gamer Razer Ouroboros Elite Ambidestro Wirel', 'Razer Mouse Gamer Ouroboros Elite Ã© o mouse top de linha da razer, feito para os Gamers do mundo', '- Ambidestro - Customizado para todos tamanhos de mÃ£os - Sensor Laser - DPI: 8200dpi - Tecnologia sem fio (Wireless) - 11 BotÃµes programÃ¡veis - Ultrapolling: 1000Hz - AtÃ© 200 polegadas por segundo de aceleraÃ§Ã£o / 50g  - Vida da bateria: (aprox) 12 horas (de jogo contÃ­nuo)  - Tamanho aprox. do produto: 122~~137 x 71 x 42mm', 'Mouse Gamer', '1200.00', 'c15f8fde84b7d50126414de0f1bf490b.jpg'),
(14, 'Placa-MÃ£e GIGABYTE p/ AMD AM3+ ATX GA-990FXA-UD5 ', 'Placa-MÃ£e GIGABYTE ', 'CPU Suportada: - Tipo de soquete: AM3 + - Tipo de CPU: FX / Phenom II / Athlon II / Sempron SÃ©rie 100 - FSB: 2600MHz Hyper Transport (5200 MT / s)  Chipsets: - North Bridge: AMD 990FX - South Bridge: AMD SB950  MemÃ³ria: - NÃºmero de Slots de MemÃ³ria: 4 Ã— 240pin - MemÃ³ria padrÃ£o: DDR3 2000 (OC) / 1866/1600/1333/1066 - MÃ¡ximo de memÃ³ria suportada: 32GB - Canal Suportado: Dual Channel  Slots de expansÃ£o: - 5 x PCI Express 2.0 x16 (x16, x16, x8, x4, x4) - 1 x PCI Express x1 - 1 x Slots PCI  Dispositivos de armazenamento: - 8 x SATA 6Gb / s - SATA RAID: 6 x SATA 6Gb / s Conectores (SATA3_0 ~ SATA3_5) suporte RAID 0, 1, 5, 10 e JBOD  - 2 x SATA 6Gb / s conectores (GSATA3_6, GSATA3_7) e 2 x eSATA 6Gb / s suporte RAID 0, 1  Ãudio: - Chipset Ãudio: Realtek ALC889 - Canais de Ãudio: 8 Canais  LAN: - LAN Chipset: Realtek 8111E - Max LAN Velocidade: 10/100/1000 Mbps  Portas Painel Traseiro: - 1 x PS / 2 para teclado / mouse porto - 8 x USB 2.0 - 2 x USB 3.0 - 1 x IEEE 1394 - 2 x eSATA ', 'Placa mÃ£e', '1200.00', '84b978761e349eace371bb025a2288bb.jpg'),
(15, 'Cooler FAN Corsair 120mm Air Series AF120 Quiet Ed', 'Cooler FAN Corsair 120mm Air Series AF120 Quiet Edition CO-9050016-BLED Azul, com led azul', '- Fluxo De Ar: 52,.19 ~ 66,4 CFM - DimensÃ£o: 120 x 25 mm - TensÃ£o: 12V - PressÃ£o EstÃ¡tica: 0,75 / H20 0,80 / H20 - NÃ­vel Sonoro: 25,2 dBA - Velocidade: 1.500 ~ 1.200 RPM - Consumo de Energia: 0.40 A - Cor: Azul - Fan: Tamanho 120 x 25 mm - Tipo: Fan Tranquilo EdiÃ§Ã£o - Fluxo: Tipo Fluxo De Ar', 'Cooler', '100.00', '8174fe63cba55b9a334b6b53a9455f93.jpg'),
(16, 'AverMedia Placa de Captura Live Gamer HD Lite Full', 'Live Gamer HD Lite Ã© uma placa PCI-E, que ajuda vocÃª a gravar e transmitir seus gameplays em atÃ© 1080p. Projetada especificamente para gamers que capturam Streamam gameplay via PC, este dispositivo de captura PCI-E Ã© altamente compatÃ­vel vem com on-board codificador H.264 hardware, o que reduz significativamente o uso de CPU e traz para vocÃª o tamanho do arquivo menor para ediÃ§Ã£o.', '- Jogos de Video em captura 1080p - Consumo Super Baixo de CPU - Suporte de resoluÃ§Ã£o da placa de video - Grava comentÃ¡rios com o jogo de video -TransmissÃ£o ao vivo de Gameplay - DimensÃµes: 12.00 cm X 1.50 cm X 9.00 cm    Vantagens: - Capture jogos em HD a 1080p - Baixo consumo de CPU - Suporte a resoluÃ§Ã£o de placa de video - BotÃ£o dedicado de gravaÃ§Ã£o incluido - Registre ComentÃ¡rios ao jogar - Transmita seus jogos ao vovo no TwitchTV - Captura de tela - Sinal de Entrada: HDMI/DVI - 3.5mm Ãudio - Sinal de SaÃ­da: HDMI/DVI - 3.5mm Ãudio', 'Placa de captura', '2000.00', 'aa30917b96bc21f9080aae1625458651.jpg');

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
