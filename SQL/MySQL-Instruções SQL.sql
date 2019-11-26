drop database webiii;
create database webiii;
use webiii;

CREATE TABLE `ator` (
  `Atr_Codigo` int(11) NOT NULL,
  `Atr_Nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Atr_DataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Extraindo dados da tabela `ator`
INSERT INTO `ator` (`Atr_Codigo`, `Atr_Nome`, `Atr_DataNasc`) VALUES
(1, 'Brie Larson', '1989-11-01'),
(2, 'Samuel L. Jackson', '1948-12-21'),
(3, 'Jude Law', '1972-12-29');

-- --------------------------------------------------------

-- Estrutura da tabela `atorfilme`
CREATE TABLE `atorfilme` (
  `Atfl_Codigo` int(11) NOT NULL,
  `Atfl_Atr_Codigo` int(11) DEFAULT NULL,
  `Atfl_Fil_Codigo` int(11) DEFAULT NULL,
  `Atfl_Papel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Atfl_Importancia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Extraindo dados da tabela `atorfilme`
INSERT INTO `atorfilme` (`Atfl_Codigo`, `Atfl_Atr_Codigo`, `Atfl_Fil_Codigo`, `Atfl_Papel`, `Atfl_Importancia`) VALUES
(1, 1, 1, 'Capita Marvel', 1),
(2, 2, 1, 'Nick Fury', 2),
(3, 3, 1, 'Yon-Rogg', 2);

-- --------------------------------------------------------

-- Estrutura da tabela `classificacao`
CREATE TABLE `classificacao` (
  `Cla_Codigo` int(11) NOT NULL,
  `Cla_Descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Extraindo dados da tabela `classificacao`
INSERT INTO `classificacao` (`Cla_Codigo`, `Cla_Descricao`) VALUES
(1, 'Livre'),
(2, '10 anos'),
(3, '12 anos'),
(4, '14 anos'),
(5, '16 anos'),
(6, '18 anos');

-- --------------------------------------------------------

-- Estrutura da tabela `comentario`
CREATE TABLE `comentario` (
  `Com_Codigo` int(11) NOT NULL,
  `Com_Usuario` int(11) DEFAULT NULL,
  `Com_Comentario` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Com_Gostou` int(11) DEFAULT NULL,
  `Com_NaoGostou` int(11) DEFAULT NULL,
  `Com_Avaliacao` int(11) DEFAULT NULL,
  `Com_Filme` int(11) DEFAULT NULL,
  `Com_Data` datetime DEFAULT NULL,
  `Com_Situacao` char(1) DEFAULT NULL,
  `Com_Parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Extraindo dados da tabela `comentario`
INSERT INTO `comentario` (`Com_Codigo`, `Com_Usuario`, `Com_Comentario`, `Com_Gostou`, `Com_NaoGostou`, `Com_Avaliacao`, `Com_Filme`, `Com_Data`, `Com_Situacao`, `Com_Parent`) VALUES
(1, 1, 'Eu gostei Mais ou Menos do filme ;D', 0, 0, 4, 1, '2019-05-14 14:43:18', '1', NULL),
(2, 1, 'Eu gostei Mais ou Menos do filme : /', 0, 1, 3, 1, '2019-05-14 14:40:34', '1', NULL),
(3, 1, 'Eu gostei Mais ou Menos do filme : /', 1, 0, 3, 1, '2019-05-14 14:40:34', '1', NULL),
(14, 1, 'Eu gostei Mais ou Menos do filme : /', 0, 0, 3, 1, '2019-05-14 14:40:34', 'T', NULL),
(15, 1, 'Eu gostei Mais ou Menos do filme : /', 0, 0, 3, 1, '2019-05-14 14:40:34', 'T', NULL),
(16, 1, 'Eu gostei Mais ou Menos do filme : /', 0, 0, 3, 1, '2019-05-14 14:40:34', 'T', NULL),
(17, 8, 'Muito Ruimm', 0, 0, 1, 2, '2019-06-01 10:21:19', 'T', NULL),
(19, 1, 'Achei Topzeraa', 0, 0, 4, 2, '2019-11-21 10:20:23', 'T', NULL),
(24, 1, 'Tamu Junto Sempre', 0, 0, NULL, NULL, '2019-11-22 02:16:14', 'T', 17),
(25, 1, 'E aí o que acho man?', 0, 0, NULL, NULL, '2019-11-22 02:17:00', 'T', 3),
(26, 6, 'Achei bem bacana cara!', 0, 0, NULL, NULL, '2019-11-22 02:18:56', 'T', 3),
(27, 1, 'Achei Incrívelll!!!', 0, 0, 5, 3, '2019-11-22 02:46:01', 'T', NULL),
(28, 1, 'Eu achei mesmo, muito bom!', 0, 0, NULL, NULL, '2019-11-22 02:47:22', 'T', 27),
(29, 6, 'Não achei tão bom Assim cara ;(', 0, 0, NULL, NULL, '2019-11-22 02:48:20', 'T', 27);

-- --------------------------------------------------------

-- Estrutura da tabela `distribuidora`
CREATE TABLE `distribuidora` (
  `Dis_Codigo` int(11) NOT NULL,
  `Dis_RazaoSocial` varchar(50) DEFAULT NULL,
  `Dis_NomeFantasia` varchar(50) DEFAULT NULL,
  `Dis_Cnpj` varchar(14) DEFAULT NULL,
  `Dis_Site` varchar(100) DEFAULT NULL,
  `Dis_Email` varchar(100) DEFAULT NULL,
  `Dis_Endereco` varchar(60) DEFAULT NULL,
  `Dis_Bairro` varchar(40) DEFAULT NULL,
  `Dis_Cidade` varchar(32) DEFAULT NULL,
  `Dis_Estado` char(2) DEFAULT NULL,
  `Dis_Numero` varchar(5) DEFAULT NULL,
  `Dis_Ie` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Extraindo dados da tabela `distribuidora`
INSERT INTO `distribuidora` (`Dis_Codigo`, `Dis_RazaoSocial`, `Dis_NomeFantasia`, `Dis_Cnpj`, `Dis_Site`, `Dis_Email`, `Dis_Endereco`, `Dis_Bairro`, `Dis_Cidade`, `Dis_Estado`, `Dis_Numero`, `Dis_Ie`) VALUES
(1, NULL, 'Marvel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- Estrutura da tabela `filmes`
CREATE TABLE `filmes` (
  `Fil_Codigo` int(11) NOT NULL,
  `Fil_Titulo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fil_Sinopse` text COLLATE utf8_unicode_ci,
  `Fil_url` text COLLATE utf8_unicode_ci,
  `Fil_Foto` text COLLATE utf8_unicode_ci,
  `Fil_Lancamento` date DEFAULT NULL,
  `Fil_Tempo` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fil_Genero` int(11) DEFAULT NULL,
  `Fil_Classificacao` int(11) DEFAULT NULL,
  `Fil_Distribuidora` int(11) DEFAULT NULL,
  `Fil_Situacao` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fil_Wallpaper` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fil_ExibiWallpaper` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Extraindo dados da tabela `filmes`
INSERT INTO `filmes` (`Fil_Codigo`, `Fil_Titulo`, `Fil_Sinopse`, `Fil_Foto`, `Fil_Lancamento`, `Fil_Tempo`, `Fil_Genero`, `Fil_Classificacao`, `Fil_Distribuidora`, `Fil_Situacao`, `Fil_Wallpaper`, `Fil_ExibiWallpaper`) VALUES
(1, 'Capita Marvel', 'Carol Danvers (Brie Larson) é uma ex-agente da Força Aérea norte-americana, que, sem se lembrar de sua vida na Terra, é recrutada pelos Kree para fazer parte de seu exército de elite. Inimiga declarada dos Skrull, ela acaba voltando ao seu planeta de origem para impedir uma invasão dos metaformos, e assim vai acabar descobrindo a verdade sobre si, com a ajuda do agente Nick Fury (Samuel L. Jackson) e da gata Goose.', 'capa-capita-marvel.jpg', '2019-03-07', '2h10', 1, 1, 1, 'Cartaz', 'wallpaper-capita-marvel.jpg','Sim'),
(2, 'Vingadores Ultimato', 'Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.', 'vingadores-ultimato.jpeg', '2019-04-25', '03:01', 1, 2, 1, 'Ativo', 'wallpaper-vingadores-ultimato.jpg','Sim'),
(3, 'Homem-Aranha: Longe de Casa', 'Peter Parker está em uma viagem de duas semanas pela Europa, ao lado de seus amigos de colégio, quando é surpreendido pela visita de Nick Fury. Convocado para mais uma missão heroica, ele precisa enfrentar vários vilões que surgem em cidades-símbolo do continente, como Londres, Paris e Veneza, e também a aparição do enigmático Mysterio.', 'spider-man.jpeg', '2019-07-04', '2:30', 4, 1, 1, 'Ativo', 'wallpaper-spider-man.jpeg','Sim');

-- --------------------------------------------------------

-- Estrutura da tabela `genero`
CREATE TABLE `genero` (
  `Gen_Codigo` int(11) NOT NULL,
  `Gen_Descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Extraindo dados da tabela `genero`
INSERT INTO `genero` (`Gen_Codigo`, `Gen_Descricao`) VALUES
(1, 'Aventura'),
(2, 'Ação'),
(3, 'Animação'),
(4, 'Comédia'),
(5, 'Romance'),
(6, 'Documentário'),
(7, 'Drama'),
(8, 'Suspense'),
(9, 'Terror'),
(10, 'Ficção Científica');

-- --------------------------------------------------------

-- Estrutura da tabela `moderador`
CREATE TABLE `moderador` (
  `Mod_Codigo` int(11) NOT NULL,
  `Mod_Usuario` varchar(25) NOT NULL,
  `Mod_Nome` varchar(50) DEFAULT NULL,
  `Mod_Senha` varchar(20) DEFAULT NULL,
  `Mod_Email` varchar(100) DEFAULT NULL,
  `Mod_Telefone` varchar(15) DEFAULT NULL,
  `Mod_CPF` char(11) DEFAULT NULL,
  `Mod_Situacao` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Extraindo dados da tabela `moderador`
INSERT INTO `moderador` (`Mod_Codigo`, `Mod_Usuario`, `Mod_Nome`, `Mod_Senha`, `Mod_Email`, `Mod_Telefone`, `Mod_CPF`, `Mod_Situacao`) VALUES
(1, 'caioedu@cinemep', 'Caio Eduardo', 'admin', 'souza.caioeduardo@gmail.com', '99581-3691', '12345678912', 'Ativo');

-- --------------------------------------------------------


-- Estrutura da tabela `perfil`
CREATE TABLE `perfil` (
  `Prf_Codigo` int(11) NOT NULL,
  `Prf_Descricao` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Extraindo dados da tabela `perfil`
INSERT INTO `perfil` (`Prf_Codigo`, `Prf_Descricao`) VALUES
(1, 'Usuario'),
(2, 'Moderador'),
(3, 'Administrador');

-- --------------------------------------------------------

-- Estrutura da tabela `reacaocomentario`
CREATE TABLE `reacaocomentario` (
  `Rc_Usuario` int(11) NOT NULL,
  `Rc_Comentario` int(11) NOT NULL,
  `Rc_like` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Rc_Dislike` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Extraindo dados da tabela `reacaocomentario`
INSERT INTO `reacaocomentario` (`Rc_Usuario`, `Rc_Comentario`, `Rc_like`, `Rc_Dislike`) VALUES
(1, 1, 'True', 'False'),
(1, 2, 'False', 'False'),
(1, 3, 'False', 'True'),
(1, 14, 'False', 'True'),
(1, 16, 'True', 'False'),
(1, 17, 'False', 'False'),
(1, 24, 'True', 'False'),
(1, 26, 'True', 'False'),
(1, 27, 'True', 'False'),
(1, 28, 'False', 'False'),
(1, 29, 'False', 'True'),
(2, 1, 'True', 'False'),
(2, 3, 'True', 'False'),
(2, 15, 'True', 'False'),
(6, 2, 'False', 'True'),
(6, 3, 'True', 'False'),
(6, 16, 'True', 'False'),
(6, 27, 'False', 'True'),
(6, 28, 'True', 'False');

-- --------------------------------------------------------

-- Estrutura da tabela `usuario`
CREATE TABLE `usuario` (
  `Usu_Codigo` int(11) NOT NULL,
  `Usu_Usuario` varchar(25) NOT NULL,
  `Usu_Nome` varchar(50) DEFAULT NULL,
  `Usu_Senha` varchar(20) DEFAULT NULL,
  `Usu_Email` varchar(100) DEFAULT NULL,
  `Usu_Situacao` varchar(7) DEFAULT NULL,
  `Usu_Perfil` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Extraindo dados da tabela `usuario`
INSERT INTO `usuario` (`Usu_Codigo`, `Usu_Usuario`, `Usu_Nome`, `Usu_Senha`, `Usu_Email`, `Usu_Situacao`, `Usu_Perfil`) VALUES
(1, 'caio', 'Caio3', '123456', 'souzacaiodu@cinemep.com', 'Ativo', 1),
(2, 'dudu', 'Eduardo Du', '123456', 'dudu@cinemep.br', 'Ativo', 2),
(3, 'igor', 'Igor Eduardo', '123456', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Inativo', 1),
(5, 'caioedu', 'Caio Admin', 'admin', 'caio@caio', 'Ativo', 3),
(6, 'vitor', 'Vitor', 'vitor', 'vitor@tamujunto.br', 'Ativo', 0),
(7, 'vitor', 'Vitor', 'vitor', 'vitor@tamujunto.br', 'Ativo', 0),
(8, 'caio2', 'Alann', '1234', '123@123', 'Ativo', 0);

-- Indexes for dumped tables
-- Indexes for table `ator`
ALTER TABLE `ator`
  ADD PRIMARY KEY (`Atr_Codigo`);


-- Indexes for table `atorfilme`
ALTER TABLE `atorfilme`
  ADD PRIMARY KEY (`Atfl_Codigo`),
  ADD KEY `Atfl_Atr_Codigo` (`Atfl_Atr_Codigo`),
  ADD KEY `Atfl_Fil_Codigo` (`Atfl_Fil_Codigo`);


-- Indexes for table `classificacao`
ALTER TABLE `classificacao`
  ADD PRIMARY KEY (`Cla_Codigo`);

-- Indexes for table `comentario`
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`Com_Codigo`),
  ADD KEY `Com_Usuario` (`Com_Usuario`),
  ADD KEY `Com_Filme` (`Com_Filme`);


-- Indexes for table `distribuidora`
ALTER TABLE `distribuidora`
  ADD PRIMARY KEY (`Dis_Codigo`);


-- Indexes for table `filmes`
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`Fil_Codigo`),
  ADD KEY `Fil_Genero` (`Fil_Genero`),
  ADD KEY `Fil_Distribuidora` (`Fil_Distribuidora`),
  ADD KEY `Fil_Classificacao` (`Fil_Classificacao`);


-- Indexes for table `genero`
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Gen_Codigo`);

-- Indexes for table `moderador`
ALTER TABLE `moderador`
  ADD PRIMARY KEY (`Mod_Codigo`);

-- Indexes for table `perfil`
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`Prf_Codigo`);

-- Indexes for table `reacaocomentario`
ALTER TABLE `reacaocomentario`
  ADD PRIMARY KEY (`Rc_Usuario`,`Rc_Comentario`),
  ADD KEY `Rc_Comentario` (`Rc_Comentario`);

-- Indexes for table `usuario`
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Usu_Codigo`);

-- AUTO_INCREMENT for dumped tables

-- AUTO_INCREMENT for table `ator`
ALTER TABLE `ator`
  MODIFY `Atr_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `atorfilme`
ALTER TABLE `atorfilme`
  MODIFY `Atfl_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `classificacao`
ALTER TABLE `classificacao`
  MODIFY `Cla_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- AUTO_INCREMENT for table `comentario`
ALTER TABLE `comentario`
  MODIFY `Com_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

-- AUTO_INCREMENT for table `distribuidora`
ALTER TABLE `distribuidora`
  MODIFY `Dis_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT for table `filmes`
ALTER TABLE `filmes`
  MODIFY `Fil_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `genero`
ALTER TABLE `genero`
  MODIFY `Gen_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- AUTO_INCREMENT for table `moderador`
ALTER TABLE `moderador`
  MODIFY `Mod_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT for table `perfil`
ALTER TABLE `perfil`
  MODIFY `Prf_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `usuario`
ALTER TABLE `usuario`
  MODIFY `Usu_Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- Constraints for dumped tables

-- Limitadores para a tabela `atorfilme`
ALTER TABLE `atorfilme`
  ADD CONSTRAINT `AtorFilme_ibfk_1` FOREIGN KEY (`Atfl_Atr_Codigo`) REFERENCES `ator` (`Atr_Codigo`),
  ADD CONSTRAINT `AtorFilme_ibfk_2` FOREIGN KEY (`Atfl_Fil_Codigo`) REFERENCES `filmes` (`Fil_Codigo`);

-- Limitadores para a tabela `comentario`
ALTER TABLE `comentario`
  ADD CONSTRAINT `Comentario_ibfk_1` FOREIGN KEY (`Com_Usuario`) REFERENCES `usuario` (`Usu_Codigo`),
  ADD CONSTRAINT `Comentario_ibfk_2` FOREIGN KEY (`Com_Filme`) REFERENCES `filmes` (`Fil_Codigo`);


-- Limitadores para a tabela `filmes`
ALTER TABLE `filmes`
  ADD CONSTRAINT `Filmes_ibfk_1` FOREIGN KEY (`Fil_Genero`) REFERENCES `genero` (`Gen_Codigo`),
  ADD CONSTRAINT `Filmes_ibfk_2` FOREIGN KEY (`Fil_Distribuidora`) REFERENCES `distribuidora` (`Dis_Codigo`),
  ADD CONSTRAINT `Filmes_ibfk_3` FOREIGN KEY (`Fil_Classificacao`) REFERENCES `classificacao` (`Cla_Codigo`);

-- Limitadores para a tabela `reacaocomentario`
ALTER TABLE `reacaocomentario`
  ADD CONSTRAINT `reacaocomentario_ibfk_1` FOREIGN KEY (`Rc_Usuario`) REFERENCES `usuario` (`Usu_Codigo`),
  ADD CONSTRAINT `reacaocomentario_ibfk_2` FOREIGN KEY (`Rc_Comentario`) REFERENCES `comentario` (`Com_Codigo`);
COMMIT;
