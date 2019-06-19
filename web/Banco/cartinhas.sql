-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Jun-2019 às 20:41
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cartinhas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE IF NOT EXISTS `carrinho` (
`id_carrinho` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
`id_foto` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `caminho` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`id_foto`, `id_produto`, `caminho`) VALUES
(4, 2, '247664605.jpg'),
(5, 3, '3308286423.jpg'),
(6, 4, '4616021232.jpg'),
(7, 5, '5740800967.jpg'),
(8, 6, '6863971562.jpg'),
(9, 7, '7733038789.jpg'),
(10, 8, '8931773286.jpg'),
(11, 9, '9916259550.jpg'),
(12, 10, '1058409057.jpg'),
(13, 11, '11875906906.jpg'),
(14, 12, '12773196463.jpg'),
(15, 13, '13328876700.jpg'),
(16, 14, '14712026765.jpg'),
(17, 15, '1530914987.jpg'),
(18, 16, '1673411776.jpg'),
(19, 18, '18365964714.jpg'),
(20, 19, '19811186332.jpg'),
(21, 20, '20216774792.jpg'),
(22, 21, '21235608352.jpg'),
(23, 22, '22659129490.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
`id_produto` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `descricao`, `valor`, `quantidade`) VALUES
(1, 'Teste', 'Teste', '50.50', 0),
(2, 'Dragão Branco de Olhos Azuis', 'Este lendário dragão é uma poderosa máquina de destruição. Praticamente invencível, muito poucos enfrentaram essa magnifica criatura e viveram para contar a história.', '3.99', 50),
(3, 'Mago Negro', 'O mago definitivo em termos de ataque e defesa.', '3.99', 50),
(4, 'Reviver Monstro', 'Escolha 1 monstro no Cemitério de qualquer duelista; Invoque-o por Invocação-Especial.', '4.99', 53),
(5, 'Cilindro Mágico', 'Quando um monstro do oponente declarar um ataque: escolha o monstro atacante; negue o ataque e, se isso acontecer, cause dano ao seu oponente igual ao ATK do monstro.', '3.99', 21),
(6, 'Dragão Definitivo de Olhos Azuis', '"Dragão Branco de Olhos Azuis" + "Dragão Branco de Olhos Azuis" + "Dragão Branco de Olhos Azuis"', '9.99', 32),
(7, 'Pote da Ganância', 'Compre 2 cards.', '3.99', 40),
(8, 'Dragão Revólver', 'Uma vez por turno: você pode escolher 1 monstro que seu oponente controla; lance uma moeda 3 vezes e destrua-o se pelo menos 2 resultados forem Cara.', '6.99', 27),
(9, 'Dragão Caveira Negro', '"Caveira Invocada" + "Dragão Negro de Olhos Vermelhos"\r\n\r\n(Este card é tratado como um card "Arquidemônio")', '7.99', 37),
(10, 'Chamado dos Assombrados', 'Ative este card ao escolher 1 monstro no seu Cemitério; Invoque o alvo por Invocação-Especial com a face para cima em Posição de Ataque. Quando este card deixar o campo, destrua o alvo. Quando o alvo for destruído, destrua este card.', '3.99', 50),
(11, 'Ataque da Magia Negra', 'Se você controlar "Mago Negro": destrua todas os Cards de Magia e de Armadilha que seu oponente controla.', '4.99', 52),
(12, 'Desfusão', 'Escolha 1 Monstro de Fusão no campo; devolva o alvo para o Deck Adicional e, depois, se todas as Matérias de Fusão usadas para a Invocação-Fusão dele estiverem no seu Cemitério, você pode Invocar todos eles por Invocação-Especial.', '6.99', 51),
(13, 'Força do Espelho do Afogamento', 'Quando um monstro do oponente declarar um ataque direto: embaralhe no Deck todos os monstros em Posição de Ataque que seu oponente controla.', '5.99', 35),
(14, 'Lady Harpia', 'Este animal alado com forma humana, embora agrade aos olhos, é absolutamente letal em batalha.', '0.99', 35),
(15, 'Rainha dos Insetos', 'Este card não pode declarar um ataque a não ser que você ofereça 1 monstro como Tributo. Este card ganha 200 de ATK para cada monstro do Tipo Inseto no campo. Durante a Fase Final, se este card destruiu um monstro do oponente em batalha neste turno: Invoque por Invocação-Especial 1 "Ficha de Monstro Inseto" (Tipo Inseto/TERRA/Nível 1/ATK 100/DEF 100) em Posição de Ataque.', '2.99', 34),
(16, 'Senhor dos Dragões', 'Monstros do Tipo Dragão no campo não podem ser escolhidos como alvo de efeitos de card.', '1.99', 35),
(18, 'Polimerização', 'Invoque por Invocação-Especial 1 Monstro de Fusão do seu Deck Adicional, usando monstros da sua mão ou do seu lado do campo como Matérias de Fusão.', '3.99', 48),
(19, 'Caveira Invocada', 'Um demônio com poderes das trevas para confundir os inimigos. Entre os monstros do tipo demônio, é dos mais fortes.\r\n\r\n(Este card deve ser sempre considerado como um card "Arquidemônio".)', '1.99', 54),
(20, 'A Flauta para Invocação de Dragões', 'Invoque por Invocação-Especial até 2 monstros do Tipo Dragão da sua mão. "Senhor dos Dragões" deve estar no campo para que você possa ativar e resolver este efeito.', '0.99', 39),
(21, 'Mil Facas', 'Se você controlar um "Mago Negro": escolha 1 monstro que seu oponente controla; destrua o alvo.', '1.99', 36),
(22, 'Dragão Negro de Olhos Vermelhos', 'Um dragão feroz com um ataque letal.', '2.99', 53);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtovendido`
--

CREATE TABLE IF NOT EXISTS `produtovendido` (
`id_produtos_vendidos` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtovendido`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id_usuario` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_perfil` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `administrador` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `usuario`, `senha`, `telefone`, `foto_perfil`, `administrador`) VALUES
(1, 'Daniel', 'dcastro', '123', '55 999598414', 'Imagens/userGeneric.png', 1),
(2, 'Konrado', 'konradols', 'konrado', '55991192589', 'Imagens/userGeneric.png', 0),
(3, 'Irineu', 'irineu', 'irineu', '55 98873442', 'Imagens/userGeneric.png', 0),
(4, 'Alarico', 'alarico', 'alarico', '55 991238879', 'Imagens/userGeneric.png', 0),
(5, 'Rafael', 'rafaelsouza', 'rafael', '55 999722227', 'Imagens/userGeneric.png', 0),
(6, 'João Vitor', 'jvitor', 'jvitor', '55 996744335', 'Imagens/userGeneric.png', 0),
(7, 'Maria', 'mariass', 'maria', '55 991215178', 'Imagens/userGeneric.png', 0),
(8, 'Bernardo', 'bernardo', 'bernardo', '55 999788556', 'Imagens/userGeneric.png', 0),
(9, 'Gustavo', 'lgusta', 'gustavo', '55 996447231', 'Imagens/userGeneric.png', 0),
(10, 'João Paulo', 'jpaulo', 'joaopaulo', '55 999894569', 'Imagens/userGeneric.png', 0),
(11, 'Jasmine', 'jasmineso', 'jasmine', '55 996773212', 'Imagens/userGeneric.png', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
`id_venda` int(11) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_venda` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `venda`
--



--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
 ADD PRIMARY KEY (`id_carrinho`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
 ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
 ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `produtovendido`
--
ALTER TABLE `produtovendido`
 ADD PRIMARY KEY (`id_produtos_vendidos`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
 ADD PRIMARY KEY (`id_venda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `produtovendido`
--
ALTER TABLE `produtovendido`
MODIFY `id_produtos_vendidos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
