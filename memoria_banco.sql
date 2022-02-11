-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Fev-2022 às 02:30
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `memoria_banco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_administrador`
--

CREATE TABLE `tb_administrador` (
  `id` int(11) NOT NULL,
  `nm_nome` varchar(90) NOT NULL,
  `email` varchar(110) NOT NULL,
  `estado` char(2) NOT NULL,
  `senha` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_familiares`
--

CREATE TABLE `tb_familiares` (
  `id` int(11) NOT NULL,
  `nm_nome` varchar(90) NOT NULL,
  `email` varchar(110) NOT NULL,
  `senha` varchar(65) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `dt_nascimento` datetime NOT NULL,
  `ano_trabalho` datetime NOT NULL,
  `parentesco` varchar(65) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_jogos`
--

CREATE TABLE `tb_jogos` (
  `id` int(11) NOT NULL,
  `nm_jogo` varchar(90) DEFAULT NULL,
  `num_pontuacao` int(4) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_medicos`
--

CREATE TABLE `tb_medicos` (
  `id` int(11) NOT NULL,
  `nm_nome` varchar(90) NOT NULL,
  `email` varchar(110) NOT NULL,
  `senha` varchar(65) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `dt_nascimento` datetime NOT NULL,
  `ano_trabalho` datetime NOT NULL,
  `especialidade` varchar(65) NOT NULL,
  `id_instituicao` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE `tb_paciente` (
  `id` int(11) NOT NULL,
  `nm_nome` varchar(80) NOT NULL,
  `tel_telefone` varchar(13) DEFAULT NULL,
  `dt_nascimento` datetime DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `patologia` varchar(90) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `senha` varchar(60) DEFAULT NULL,
  `id_familiar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_paciente`
--

INSERT INTO `tb_paciente` (`id`, `nm_nome`, `tel_telefone`, `dt_nascimento`, `email`, `patologia`, `estado`, `senha`, `id_familiar`) VALUES
(1, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(2, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(3, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(4, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(5, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(6, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(7, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(8, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(9, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123', NULL),
(10, '9', '9', '0000-00-00 00:00:00', '9', '9', '9', '123', NULL),
(11, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '$2y$10$xyyzjwix7uUHb0C890qTz.BjaAtccte9H2I4oz7CsFn8eC1./NLZG', NULL),
(12, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '$2y$10$Gyegwadq/e6nXrRKqZl7uu47lu4HA9YDfNCEqVIKAW0uK4E5wtJUW', NULL),
(13, '7', '7', '0000-00-00 00:00:00', '7', '7', '7', '$2y$10$3WBHuzsRR1G9deO8jkNebuagjr3Iga3O.EY5IA.JEL.aZeT.ISeNi', NULL),
(14, '789', '789', '0000-00-00 00:00:00', '789', '789', '78', '$2y$10$4/gCQn3udlagOsmZkt.OK.hNRNaXFi79tfpEbxZFpcIu13h98i1P.', NULL),
(15, '159', '159', '0000-00-00 00:00:00', '159', '159', '15', '$2y$10$XQIi1/bQzT8.xyBqW9w9FO8pRfH.MUwS7hUPIXTmhLBX.zd8Mzvpy', NULL),
(16, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$s1CDMqsuB6N.k8mP9jRf8uXhWvy8hGoopqQWIhXFtTjnTWuknEsQG', NULL),
(17, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$s1CDMqsuB6N.k8mP9jRf8uXhWvy8hGoopqQWIhXFtTjnTWuknEsQG', NULL),
(18, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$E3eWH3Peg/ntDfnXmP4AJOcfiTu2U3XrYP0hFMV8K6HoYZbtUS8fu', NULL),
(19, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$E3eWH3Peg/ntDfnXmP4AJOcfiTu2U3XrYP0hFMV8K6HoYZbtUS8fu', NULL),
(20, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$bD9aynCQm54Hw9cpuEuOMuMutQ2DYGrsbwtXBaxCot4KJzilrQ1Le', NULL),
(21, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$bD9aynCQm54Hw9cpuEuOMuMutQ2DYGrsbwtXBaxCot4KJzilrQ1Le', NULL),
(22, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$6taSkCal28fYjTU54abQhushJlMGSs8NxbsoxuDdXjBSnRrPCxBfG', NULL),
(23, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$6taSkCal28fYjTU54abQhushJlMGSs8NxbsoxuDdXjBSnRrPCxBfG', NULL),
(24, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$NgGel8eVxdM9kCkNMtrvBujIEfrP7hBO6PHynkuH2Sq33WFhvDFIe', NULL),
(25, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$NgGel8eVxdM9kCkNMtrvBujIEfrP7hBO6PHynkuH2Sq33WFhvDFIe', NULL),
(26, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$XZclSoKJf8kwsJIS.fXGC.KUBvC9VfOo14jes3p7biiHgp189QVtS', NULL),
(27, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$XZclSoKJf8kwsJIS.fXGC.KUBvC9VfOo14jes3p7biiHgp189QVtS', NULL),
(28, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$Q1zHVC5CpxZoEf2i2L1hROvqhF9eROVMdKj1D/VrTRcjW97CHBohq', NULL),
(29, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$Q1zHVC5CpxZoEf2i2L1hROvqhF9eROVMdKj1D/VrTRcjW97CHBohq', NULL),
(30, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$rx0leyY1blmujXm/NKnXeuWUWmbreycRlKD6Slr4o84T8PTZgQ4Oy', NULL),
(31, '4546', '4546', '0000-00-00 00:00:00', '4546', '4546', '45', '$2y$10$rx0leyY1blmujXm/NKnXeuWUWmbreycRlKD6Slr4o84T8PTZgQ4Oy', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_administrador`
--
ALTER TABLE `tb_administrador`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_familiares`
--
ALTER TABLE `tb_familiares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Índices para tabela `tb_jogos`
--
ALTER TABLE `tb_jogos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_medicos`
--
ALTER TABLE `tb_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente_medico` (`id_paciente`);

--
-- Índices para tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_administrador`
--
ALTER TABLE `tb_administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_familiares`
--
ALTER TABLE `tb_familiares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_jogos`
--
ALTER TABLE `tb_jogos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_medicos`
--
ALTER TABLE `tb_medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_familiares`
--
ALTER TABLE `tb_familiares`
  ADD CONSTRAINT `id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_medicos`
--
ALTER TABLE `tb_medicos`
  ADD CONSTRAINT `id_paciente_medico` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
