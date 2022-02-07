-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Fev-2022 às 10:20
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
CREATE DATABASE IF NOT EXISTS `memoria_banco` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `memoria_banco`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `nm_nome` varchar(80) NOT NULL,
  `tel_telefone` varchar(13) DEFAULT NULL,
  `dt_nascimento` datetime DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `patologia` varchar(90) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `senha` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`id`, `nm_nome`, `tel_telefone`, `dt_nascimento`, `email`, `patologia`, `estado`, `senha`) VALUES
(1, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(2, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(3, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(4, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(5, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(6, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(7, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(8, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(9, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '123'),
(10, '9', '9', '0000-00-00 00:00:00', '9', '9', '9', '123'),
(11, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '$2y$10$xyyzjwix7uUHb0C890qTz.BjaAtccte9H2I4oz7CsFn8eC1./NLZG'),
(12, '2', '2', '0000-00-00 00:00:00', '2', '2', '2', '$2y$10$Gyegwadq/e6nXrRKqZl7uu47lu4HA9YDfNCEqVIKAW0uK4E5wtJUW'),
(13, '7', '7', '0000-00-00 00:00:00', '7', '7', '7', '$2y$10$3WBHuzsRR1G9deO8jkNebuagjr3Iga3O.EY5IA.JEL.aZeT.ISeNi');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Banco de dados: `mvc`
--
CREATE DATABASE IF NOT EXISTS `mvc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mvc`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `texto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notes`
--

INSERT INTO `notes` (`id`, `titulo`, `texto`) VALUES
(25, '123', '123'),
(26, 'ads', 'asd'),
(27, 'Geovani gostoso me contrata prfv', 'S2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Daniel', 'ddd@gmail.com', '$2y$10$BV4k1ZeYma9nBjscl9RqCO5VINyFfz9MrxKPvQQisz0Envbn9zZZu'),
(2, 'dany', '123', '123'),
(3, 'Adriele', 'adriele@gmail.com', '$2y$10$7nCow41UymEzi5APp3vBr.aOJdhqO38974bTuv/LVGr0AZzTQM/zG'),
(4, '123', '123@123', '$2y$10$72L5smkj7HGP3x2N8NsI2OozDKSGXAmoXwvJHSHPh3qcLyDOxweWm'),
(5, '123', '123@123', '$2y$10$ro16vXzNjvhJSePMyJxv3.DsgCEqIgE2uWBifaqdUAVanustond1K'),
(6, '123', '123@123', '$2y$10$tkcg9mhgBtHZr6VemzDgC.MqCyTkgP0aGdT8XDZivhXT8QwrZ4s0q'),
(7, '123', '123@123', '$2y$10$4yYl1VnRfVcy69.YO2LJ3.K0zkwv/zpceKKNMDkpFvFDK1HI1nkCK'),
(8, 'abc', 'abc@abc', '$2y$10$Tx.rMsi5BEmd0z3hrxN2lexo6VnJg.dBn/KbhI4gyEMYp.Jsl..cO');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Banco de dados: `mvc_estudos`
--
CREATE DATABASE IF NOT EXISTS `mvc_estudos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mvc_estudos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Daniel', 'ddd@gmail.com', '123'),
(2, 'figueiredo', 'fig@hotmil.com', '123456789'),
(3, 'figueiredo', 'fig@hotmil.com', '123456789'),
(4, 'figueiredo', 'fig@hotmil.com', '123456789'),
(5, 'figueiredo', 'fig@hotmil.com', '123456789'),
(6, 'figueiredo', 'fig@hotmil.com', '123456789'),
(7, 'figueiredo', 'fig@hotmil.com', '123456789'),
(8, 'figueiredo', 'fig@hotmil.com', '123456789'),
(9, 'figueiredo', 'fig@hotmil.com', '123456789'),
(10, 'figueiredo', 'fig@hotmil.com', '123456789'),
(11, 'figueiredo', 'fig@hotmil.com', '123456789'),
(12, 'figueiredo', 'fig@hotmil.com', '123456789'),
(13, 'figueiredo', 'fig@hotmil.com', '123456789'),
(14, 'figueiredo', 'fig@hotmil.com', '123456789'),
(15, 'figueiredo', 'fig@hotmil.com', '123456789'),
(16, 'figueiredo', 'fig@hotmil.com', '123456789'),
(17, 'figueiredo', 'fig@hotmil.com', '123456789'),
(18, 'figueiredo', 'fig@hotmil.com', '123456789'),
(19, 'figueiredo', 'fig@hotmil.com', '123456789'),
(20, 'figueiredo', 'fig@hotmil.com', '123456789'),
(21, 'figueiredo', 'fig@hotmil.com', '123456789'),
(22, 'figueiredo', 'fig@hotmil.com', '123456789'),
(23, 'figueiredo', 'fig@hotmil.com', '123456789'),
(24, 'figueiredo', 'fig@hotmil.com', '123456789'),
(25, 'figueiredo', 'fig@hotmil.com', '123456789'),
(26, 'figueiredo', 'fig@hotmil.com', '123456789'),
(27, 'figueiredo', 'fig@hotmil.com', '123456789'),
(28, 'figueiredo', 'fig@hotmil.com', '123456789'),
(29, 'figueiredo', 'fig@hotmil.com', '123456789'),
(30, 'figueiredo', 'fig@hotmil.com', '123456789'),
(31, 'figueiredo', 'fig@hotmil.com', '123456789'),
(32, 'figueiredo', 'fig@hotmil.com', '123456789'),
(33, 'figueiredo', 'fig@hotmil.com', '123456789'),
(34, 'figueiredo', 'fig@hotmil.com', '123456789'),
(35, 'figueiredo', 'fig@hotmil.com', '123456789'),
(36, 'figueiredo', 'fig@hotmil.com', '123456789'),
(37, 'figueiredo', 'fig@hotmil.com', '123456789'),
(38, 'figueiredo', 'fig@hotmil.com', '123456789'),
(39, 'figueiredo', 'fig@hotmil.com', '123456789'),
(40, 'figueiredo', 'fig@hotmil.com', '123456789'),
(41, '123456789', 'figueiredo', 'fig@hotmil.com'),
(42, '123456789', 'figueiedo', 'fi52555g@ht'),
(43, 'figelkf', 'fi52555g@ht', '123456789'),
(44, 'figelkf', 'fi5555g@ht', '123456789'),
(45, '1234', 'asdassda', 'sadsad@sad'),
(46, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', '231321dssadsadadw'),
(47, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(48, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(49, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(50, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(51, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(52, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(53, 'asdsdsdsdsdsdsdsdsdsdsd', 'sdaaaaaaaa@sdsdsdsdsdsdsd', ''),
(54, 'Daniel', 'Danielgotosinsaasgayo@gmail.com', '123434578');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- Banco de dados: `pdo`
--
CREATE DATABASE IF NOT EXISTS `pdo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pdo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`) VALUES
(1, 'NoteBook Dell', 'i5,4gb'),
(2, 'NoteBook Dell', 'i5,4gb'),
(3, 'NoteBook Dell', 'i5,4gb'),
(4, 'NoteBook Dell', 'i5,4gb'),
(5, 'NoteBook Dell', 'i5,4gb'),
(8, 'PC GAMER', 'i7,8gb'),
(9, 'NoteBook Dell', 'i5,4gb'),
(10, 'NoteBook Dell', 'i5,4gb'),
(11, 'NoteBook Dell', 'i5,4gb'),
(12, 'NoteBook Dell', 'i5,4gb'),
(13, 'NoteBook Dell', 'i5,4gb'),
(14, 'NoteBook Dell', 'i5,4gb'),
(15, 'NoteBook Dell', 'i5,4gb'),
(16, 'NoteBook Dell', 'i5,4gb'),
(17, 'NoteBook Dell', 'i5,4gb'),
(18, 'NoteBook Dell', 'i5,4gb'),
(19, 'NoteBook Dell', 'i5,4gb'),
(20, 'NoteBook Dell', 'i5,4gb'),
(21, 'NoteBook Dell', 'i5,4gb'),
(22, 'NoteBook Dell', 'i5,4gb'),
(23, 'NoteBook Dell', 'i5,4gb'),
(24, 'NoteBook Dell', 'i5,4gb'),
(25, 'NoteBook Dell', 'i5,4gb'),
(26, 'NoteBook Dell', 'i5,4gb'),
(27, 'NoteBook Dell', 'i5,4gb'),
(28, 'NoteBook Dell', 'i5,4gb'),
(29, 'NoteBook Dell', 'i5,4gb'),
(30, 'NoteBook Dell', 'i5,4gb'),
(31, 'NoteBook Dell', 'i5,4gb'),
(32, 'NoteBook Dell', 'i5,4gb'),
(33, 'NoteBook Dell', 'i5,4gb'),
(34, 'NoteBook Dell', 'i5,4gb'),
(35, 'NoteBook Dell', 'i5,4gb'),
(36, 'NoteBook Dell', 'i5,4gb'),
(37, 'NoteBook Dell', 'i5,4gb'),
(38, 'NoteBook Dell', 'i5,4gb'),
(39, 'NoteBook Dell', 'i5,4gb'),
(40, 'NoteBook Dell', 'i5,4gb'),
(41, 'NoteBook Dell', 'i5,4gb'),
(42, 'NoteBook Dell', 'i5,4gb'),
(43, 'NoteBook Dell', 'i5,4gb'),
(44, 'NoteBook Dell', 'i5,4gb'),
(45, 'NoteBook Dell', 'i5,4gb'),
(46, 'NoteBook Dell', 'i5,4gb'),
(47, 'NoteBook Dell', 'i5,4gb'),
(48, 'NoteBook Dell', 'i5,4gb'),
(49, 'NoteBook Dell', 'i5,4gb'),
(50, 'NoteBook Dell', 'i5,4gb'),
(51, 'NoteBook Dell', 'i5,4gb'),
(52, 'NoteBook Dell', 'i5,4gb'),
(53, 'NoteBook Dell', 'i5,4gb'),
(54, 'NoteBook Dell', 'i5,4gb'),
(55, 'NoteBook Dell', 'i5,4gb'),
(56, 'NoteBook Dell', 'i5,4gb'),
(57, 'NoteBook Dell', 'i5,4gb'),
(58, 'NoteBook Dell', 'i5,4gb'),
(59, 'NoteBook Dell', 'i5,4gb'),
(60, 'NoteBook Dell', 'i5,4gb'),
(61, 'NoteBook Dell', 'i5,4gb'),
(62, 'NoteBook Dell', 'i5,4gb'),
(63, 'NoteBook Dell', 'i5,4gb'),
(64, 'NoteBook Dell', 'i5,4gb'),
(65, 'NoteBook Dell', 'i5,4gb'),
(66, 'NoteBook Dell', 'i5,4gb'),
(67, 'NoteBook Dell', 'i5,4gb'),
(68, 'NoteBook Dell', 'i5,4gb'),
(69, 'NoteBook Dell', 'i5,4gb'),
(70, 'NoteBook Dell', 'i5,4gb'),
(71, 'NoteBook Dell', 'i5,4gb'),
(72, 'NoteBook Dell', 'i5,4gb'),
(73, 'NoteBook Dell', 'i5,4gb'),
(74, 'NoteBook Dell', 'i5,4gb'),
(75, 'NoteBook Dell', 'i5,4gb'),
(76, 'NoteBook Dell', 'i5,4gb'),
(77, 'NoteBook Dell', 'i5,4gb'),
(78, 'NoteBook Dell', 'i5,4gb'),
(79, 'NoteBook Dell', 'i5,4gb'),
(80, 'NoteBook Dell', 'i5,4gb'),
(81, 'NoteBook Dell', 'i5,4gb'),
(82, 'NoteBook Dell', 'i5,4gb'),
(83, 'NoteBook Dell', 'i5,4gb'),
(84, 'NoteBook Dell', 'i5,4gb'),
(85, 'NoteBook Dell', 'i5,4gb'),
(86, 'NoteBook Dell', 'i5,4gb'),
(87, 'NoteBook Dell', 'i5,4gb'),
(88, 'NoteBook Dell', 'i5,4gb'),
(89, 'NoteBook Dell', 'i5,4gb'),
(90, 'NoteBook Dell', 'i5,4gb'),
(91, 'NoteBook Dell', 'i5,4gb'),
(92, 'NoteBook Dell', 'i5,4gb'),
(93, 'NoteBook Dell', 'i5,4gb'),
(94, 'NoteBook Dell', 'i5,4gb'),
(95, 'NoteBook Dell', 'i5,4gb'),
(96, 'NoteBook Dell', 'i5,4gb'),
(97, 'NoteBook Dell', 'i5,4gb'),
(98, 'NoteBook Dell', 'i5,4gb'),
(99, 'NoteBook Dell', 'i5,4gb'),
(100, 'NoteBook Dell', 'i5,4gb'),
(101, 'NoteBook Dell', 'i5,4gb'),
(102, 'NoteBook Dell', 'i5,4gb'),
(103, 'NoteBook Dell', 'i5,4gb'),
(104, 'NoteBook Dell', 'i5,4gb'),
(105, 'NoteBook Dell', 'i5,4gb'),
(106, 'NoteBook Dell', 'i5,4gb'),
(107, 'NoteBook Dell', 'i5,4gb'),
(108, 'NoteBook Dell', 'i5,4gb'),
(109, 'NoteBook Dell', 'i5,4gb');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'memory_bd', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"memoria_banco\",\"mvc\",\"mvc_estudos\",\"pdo\",\"phpmyadmin\",\"test\",\"viaturas\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuação)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Conteúdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"Conteúdo da tabela @TABLE@ (continuação)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"memoria_banco\",\"table\":\"tb_users\"},{\"db\":\"viaturas\",\"table\":\"corridas\"},{\"db\":\"mvc\",\"table\":\"users\"},{\"db\":\"mvc\",\"table\":\"notes\"},{\"db\":\"pdo\",\"table\":\"produtos\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'memoria_banco', 'tb_users', '{\"sorted_col\":\"`tb_users`.`dt_nascimento` DESC\",\"CREATE_TIME\":\"2022-02-06 10:04:44\",\"col_order\":[0,2,6,3,1,4,5,7],\"col_visib\":[1,1,1,1,1,1,1,1]}', '2022-02-06 16:40:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-02-07 09:18:18', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Banco de dados: `viaturas`
--
CREATE DATABASE IF NOT EXISTS `viaturas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `viaturas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corridas`
--

CREATE TABLE `corridas` (
  `id` int(11) NOT NULL,
  `vtr` varchar(15) NOT NULL,
  `odm_ini` float NOT NULL,
  `odm_final` float NOT NULL,
  `re` varchar(12) NOT NULL,
  `destino` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `corridas`
--
ALTER TABLE `corridas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `corridas`
--
ALTER TABLE `corridas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
