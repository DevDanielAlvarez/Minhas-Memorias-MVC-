
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Maio-2022 às 04:24
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `memoria_banco`
--
CREATE DATABASE IF NOT EXISTS `memoria_banco` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `memoria_banco`;

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Idade_e_pontuacao_maior_que` (IN `idade` INT(2), IN `pontuacao` INT(2))  begin
if(idade>6 and pontuacao>0) then
select tb_pac_jogo.dt_partida as 'data da partida',nm_familiar as 'nome do familiar',FLOOR(DATEDIFF( NOW(),tb_fam.dt_nascimento ) / 365.25) as 'idade do familiar'
,tb_pac.nm_paciente,FLOOR(DATEDIFF( NOW(),tb_pac.dt_nascimento ) / 365.25) as 'idade do paciente' , num_pontuacao as 'pontuação',nm_tipo_jogo as 'tipo de jogo' from tb_familiar tb_fam inner join tb_paciente tb_pac on tb_fam.cd_paciente=tb_pac.cd_paciente inner join tb_jogo_paciente tb_pac_jogo on tb_pac_jogo.cd_paciente=tb_pac.cd_paciente inner join tb_tipo_jogo where FLOOR(DATEDIFF( NOW(),tb_pac.dt_nascimento ) / 365.25)>idade and num_pontuacao>pontuacao;

else select 'valores inválidos';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Pontuacao_maior_que` (IN `pontuation` INT(2))  begin
/* if to search based of pontuations games of users */
if(pontuation>0) then
select nm_jogo as 'nome do jogo',nm_paciente as 'nome do paciente',tb_jogopac.num_pontuacao as 'pontuação',dt_partida as 'data da partida'
from tb_jogo_paciente tb_jogopac
inner join tb_paciente tb_pac on tb_jogopac.cd_paciente= tb_pac.cd_paciente
inner join tb_jogos tb_jogos on tb_jogos.cd_jogo=tb_jogopac.cd_jogo where tb_jogopac.num_pontuacao>pontuation;

else select 'pontuação inválida';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_por_parentesco` (IN `parent` VARCHAR(35))  begin
if(parent='primo') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=1;

elseif(parent='pai') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=2;

elseif(parent='mãe') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=3;

elseif(parent='filho') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=4;

elseif(parent='tio') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=5;

elseif(parent='esposa') then
select nm_familiar,nm_parentesco,nm_paciente from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=6;

elseif(parent='marido') then
select nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco',nm_paciente as 'nome do paciente' from tb_paciente pac inner join tb_familiar fam on fam.cd_paciente=pac.cd_paciente inner join tb_parentesco paren on paren.cd_parentesco=fam.cd_parentesco where paren.cd_parentesco=7;

else select 'parentesco não encontrado';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busca_estagio_parentesco` (IN `estagio` VARCHAR(30))  begin
if(estagio='inicial') then
select nm_paciente as 'nome do paciente',nm_estagio as 'estágio',nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco' from tb_paciente tb_pac inner join tb_familiar tb_fam
on tb_fam.cd_paciente=tb_pac.cd_paciente inner join tb_parentesco tb_paren on tb_fam.cd_parentesco=tb_paren.cd_parentesco inner join tb_estagio tb_est on tb_pac.cd_estagio=tb_est.cd_estagio where tb_est.cd_estagio=1;

elseif(estagio='intermediário') then
select nm_paciente as 'nome do paciente',nm_estagio as 'estágio',nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco' from tb_paciente tb_pac inner join tb_familiar tb_fam
on tb_fam.cd_paciente=tb_pac.cd_paciente inner join tb_parentesco tb_paren on tb_fam.cd_parentesco=tb_paren.cd_parentesco inner join tb_estagio tb_est on tb_pac.cd_estagio=tb_est.cd_estagio where tb_est.cd_estagio=2;

elseif(estagio='avançado') then
select nm_paciente as 'nome do paciente',nm_estagio as 'estágio',nm_familiar as 'nome do familiar',nm_parentesco as 'parentesco' from tb_paciente tb_pac inner join tb_familiar tb_fam
on tb_fam.cd_paciente=tb_pac.cd_paciente inner join tb_parentesco tb_paren on tb_fam.cd_parentesco=tb_paren.cd_parentesco inner join tb_estagio tb_est on tb_pac.cd_estagio=tb_est.cd_estagio where tb_est.cd_estagio=3;

else
select 'Este estágio é inexistente, use: 1- incial, 2- intermediário, 3- avançado' as 'mensagem de erro';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criação_de_bloco_data_inicial_data_final` (IN `dt_ini` DATE, IN `dt_final` DATE)  begin
if(dt_ini<dt_final) then
select nt.dt_criacao as 'data da criação da nota',nm_paciente as 'nome do paciente',nm_estagio as 'estágio',nm_email as 'email' from tb_notes nt inner join tb_paciente pac on nt.cd_paciente=pac.cd_paciente inner join tb_estagio est on pac.cd_estagio=est.cd_estagio inner join tb_contato ctt on ctt.cd_paciente=pac.cd_paciente
where nt.dt_criacao>dt_ini and nt.dt_criacao<dt_final;

else select 'a data de início é menor que a final';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `jogo_jogado` (IN `jogo` VARCHAR(30))  begin
if(jogo='jogo da memoria') then
select nm_paciente as 'nome do paciente',nm_estagio as 'nome do estágio',dt_partida as 'data da partida',nm_jogo as 'nome do jogo' from tb_paciente pac inner join tb_jogo_paciente pac_jogo on pac_jogo.cd_paciente=pac.cd_paciente inner join tb_estagio estag on pac.cd_estagio=estag.cd_estagio inner join tb_jogos on tb_jogos.cd_jogo=pac_jogo.cd_jogo where tb_jogos.cd_jogo=1;

elseif(jogo='genius') then
select nm_paciente as 'nome do paciente',nm_estagio as 'nome do estágio',dt_partida as 'data da partida',nm_jogo as 'nome do jogo' from tb_paciente pac inner join tb_jogo_paciente pac_jogo on pac_jogo.cd_paciente=pac.cd_paciente inner join tb_estagio estag on pac.cd_estagio=estag.cd_estagio inner join tb_jogos on tb_jogos.cd_jogo=pac_jogo.cd_jogo where tb_jogos.cd_jogo=2;
elseif(jogo='maps') then
select nm_paciente as 'nome do paciente',nm_estagio as 'nome do estágio',dt_partida as 'data da partida',nm_jogo as 'nome do jogo' from tb_paciente pac inner join tb_jogo_paciente pac_jogo on pac_jogo.cd_paciente=pac.cd_paciente inner join tb_estagio estag on pac.cd_estagio=estag.cd_estagio inner join tb_jogos on tb_jogos.cd_jogo=pac_jogo.cd_jogo where tb_jogos.cd_jogo=3;
else select 'jogo não existente';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pesquisa_notas_por_genero` (IN `genre` VARCHAR(30))  begin
if(genre='masculino' ) then
select nm_titulo as 'titulo da nota',txt_note as 'texto da nota',nm_paciente as 'nome do paciente',nm_genero as 'genero',tb_notes.dt_criacao as 'data de criação' from tb_paciente pac inner join tb_genero genre on pac.cd_genero=genre.cd_genero inner join tb_notes on tb_notes.cd_paciente=pac.cd_paciente where genre.cd_genero=1;
elseif(genre='feminino' ) then
select nm_titulo as 'titulo da nota',txt_note as 'texto da nota',nm_paciente as 'nome do paciente',nm_genero as 'genero',tb_notes.dt_criacao as 'data de criação' from tb_paciente pac inner join tb_genero genre on pac.cd_genero=genre.cd_genero inner join tb_notes on tb_notes.cd_paciente=pac.cd_paciente where genre.cd_genero=2;
elseif(genre='outro' ) then
select nm_titulo as 'titulo da nota',txt_note as 'texto da nota',nm_paciente as 'nome do paciente',nm_genero as 'genero',tb_notes.dt_criacao as 'data de criação' from tb_paciente pac inner join tb_genero genre on pac.cd_genero=genre.cd_genero inner join tb_notes on tb_notes.cd_paciente=pac.cd_paciente where genre.cd_genero=3;
elseif(genre='prefiro não dizer' ) then
select nm_titulo as 'titulo da nota',txt_note as 'texto da nota',nm_paciente as 'nome do paciente',nm_genero as 'genero',tb_notes.dt_criacao as 'data de criação' from tb_paciente pac inner join tb_genero genre on pac.cd_genero=genre.cd_genero inner join tb_notes on tb_notes.cd_paciente=pac.cd_paciente where genre.cd_genero=4;

elseif(genre='não selecionado' ) then
select nm_titulo as 'titulo da nota',txt_note as 'texto da nota',nm_paciente as 'nome do paciente',nm_genero as 'genero',tb_notes.dt_criacao as 'data de criação' from tb_paciente pac inner join tb_genero genre on pac.cd_genero=genre.cd_genero inner join tb_notes on tb_notes.cd_paciente=pac.cd_paciente where genre.cd_genero=5;
else select 'Genêro inexistente';
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Tipo_Jogo` (IN `tp_jogo` VARCHAR(26))  begin

if(tp_jogo='memorização') then
select dt_partida as 'data da partida', nm_jogo as 'nome do jogo',nm_tipo_jogo as 'nome do tipo do jogo',nm_paciente as 'nome do paciente',jpac.num_pontuacao as 'pontuação feita' from tb_tipo_jogo tipjog inner join tb_jogos jog on jog.cd_tipo_jogo=tipjog.cd_tipo_jogo inner join tb_jogo_paciente jpac on jpac.cd_jogo=jog.cd_jogo inner join tb_paciente pac on pac.cd_paciente=jpac.cd_paciente where jpac.num_pontuacao>20 and tipjog.cd_tipo_jogo='1';

elseif(tp_jogo='geografia') then
select dt_partida as 'data da partida', nm_jogo as 'nome do jogo',nm_tipo_jogo as 'nome do tipo do jogo',nm_paciente as 'nome do paciente',jpac.num_pontuacao as 'pontuação feita' from tb_tipo_jogo tipjog inner join tb_jogos jog on jog.cd_tipo_jogo=tipjog.cd_tipo_jogo inner join tb_jogo_paciente jpac on jpac.cd_jogo=jog.cd_jogo inner join tb_paciente pac on pac.cd_paciente=jpac.cd_paciente where jpac.num_pontuacao>20 and tipjog.cd_tipo_jogo='2';

else select 'tipo de jogo não existente';
end if;

end$$

--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_media_comparacao` (`codigo_pac` INT(11)) RETURNS VARCHAR(20) CHARSET utf8mb4 begin
/* declare variavies*/
declare media_geral decimal(9,2);
declare media_individual decimal(9,2);
declare count decimal(9,2);

/* geral*/
select avg(num_pontuacao) into media_geral from tb_jogo_paciente tb_game inner join tb_paciente pac on pac.cd_paciente=tb_game.cd_paciente;
/* indiv*/
select avg(num_pontuacao) into media_individual from tb_jogo_paciente tb_game inner join tb_paciente pac on pac.cd_paciente=tb_game.cd_paciente where pac.cd_paciente=codigo_pac;

set count = media_individual-media_geral;

if count>0 then
return  "Acima da média";
else
 return "abaixo da média";
 end if;


end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_media_intermed` (`codigo_pac` INT(11)) RETURNS VARCHAR(35) CHARSET utf8mb4 begin

/*DECLARANDO VARIAVEIS*/
declare media_intermediario decimal (9,2);
declare media_individual decimal (9,2);
declare conta decimal (9,2);
/*SELECT INTERMEDIARIO*/
select avg (num_pontuacao) into media_intermediario from tb_jogo_paciente pacgame join 
tb_paciente pac on pac.cd_paciente = pacgame.cd_paciente
join tb_estagio est on pac.cd_estagio = est.cd_estagio
where pac.cd_estagio = 1;
/*SELECT INDIVIDUAL*/
select avg (num_pontuacao) into media_individual from tb_jogo_paciente pacgame
join tb_paciente pac on pac.cd_paciente = 
pacgame.cd_paciente
where pac.cd_paciente = codigo_pac;
set conta = media_individual - media_intermediario;
/*IF*/
if conta>0 then
return  "Acima da média dos intermediários";
else
 return "abaixo da média dos intermediários";
 end if;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `QTD_NOTES_APOS` (`datanote` DATE, `cod_pac` INT(11)) RETURNS VARCHAR(50) CHARSET utf8mb4 begin 
	/* declare */
    declare count_notes int(11);
   select count(cd_notes) into count_notes from tb_notes nt join tb_paciente pac on nt.cd_paciente=pac.cd_paciente where nt.cd_paciente=cod_pac and dt_criacao>=datanote;
   if count_notes>1 then
   return count_notes;
   
   else 
   return "Não existe nem um bloco de notas após esta data";
   end if;

end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `QTD_NOTES_ENTRE` (`data_inicial` DATE, `data_final` DATE, `cod_pac` INT(11)) RETURNS VARCHAR(50) CHARSET utf8mb4 begin 
	/* declare */
    declare count_notes int(11);
   select count(cd_notes) into count_notes from tb_notes nt join tb_paciente pac on nt.cd_paciente=pac.cd_paciente where nt.cd_paciente=cod_pac and dt_criacao>=data_inicial and dt_criacao<=data_final;
 
    if count_notes>1 then
   return count_notes;
   
   else 
   return "Não existe nem um bloco de notas entre estas data";
   end if;
   

end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `QTD_PONTOS_ENTRE` (`data_inicial` DATE, `data_final` DATE, `cod_pac` INT(11)) RETURNS INT(7) begin 
	/* declare */
    declare count_points int(11);
    SELECT SUM(num_pontuacao) as points into count_points from tb_jogo_paciente jp join tb_paciente pac on pac.cd_paciente=jp.cd_paciente where pac.cd_paciente=cod_pac and dt_partida>=data_inicial and dt_partida<=data_final;
	
    if count_points>0 then
    return count_points;
    else return 0;
    end if;
   

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contato`
--

CREATE TABLE `tb_contato` (
  `cd_contato` int(11) NOT NULL,
  `tel_contato` varchar(14) DEFAULT 'não cadastrado',
  `nm_email` varchar(90) DEFAULT NULL,
  `cd_paciente` int(11) DEFAULT NULL,
  `cd_familiar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_contato`
--

INSERT INTO `tb_contato` (`cd_contato`, `tel_contato`, `nm_email`, `cd_paciente`, `cd_familiar`) VALUES
(1, '(27)3757-4472', 'skyrimdani@gmail.com', 1, NULL),
(2, '(87)2471-6284', 'araujoFer@gmail.com', 2, NULL),
(3, '(67) 2240-4167', 'rodrig@gmail.com', 3, NULL),
(4, '(51) 2477-1322', 'jojo@gmail.com', 4, NULL),
(5, '(94) 3682-3848', 'gustmori@gmail.com', 5, NULL),
(6, '(96) 2632-7743', 'angel@gmail.com', NULL, 1),
(7, '(18) 3512-7104', 'claudinha@gmail.com', NULL, 2),
(12, '(16) 2524-8571', 'ferolive@gmail.com', NULL, 3),
(13, '(13) 2226-6461', 'souz@gmail.com', NULL, 4),
(14, '(19) 2131-5222', 'armand@gmail.com', NULL, 5),
(15, '(38)91231554', 'magna.suspendisse@outlook.net', 6, NULL),
(16, '(41)88533437', 'non.leo@protonmail.net', 7, NULL),
(17, '(39)86236384', 'a.odio@aol.couk', 8, NULL),
(18, '(97)49392266', 'lacus.vestibulum@google.ca', 9, NULL),
(19, '(63)47434143', 'cras@protonmail.ca', 10, NULL),
(20, '(41)88584523', 'proin@protonmail.ca', 11, NULL),
(21, '(58)85655273', 'elit.aliquam@outlook.ca', 12, NULL),
(22, '(84)65262776', 'amet.dapibus@outlook.com', 13, NULL),
(23, '(58)23757632', 'fermentum.risus@google.couk', 14, NULL),
(24, '(48)97836584', 'eleifend.egestas@yahoo.edu', 15, NULL),
(25, '(59)32306074', 'egestas.a@google.net', 16, NULL),
(26, '(81)85164174', 'metus.vitae@outlook.couk', 17, NULL),
(27, '(86)13641241', 'montes.nascetur@outlook.edu', 18, NULL),
(28, '(55)41825835', 'senectus.et.netus@yahoo.edu', 19, NULL),
(29, '(78)18844762', 'urna.nunc.quis@google.edu', 20, NULL),
(30, '(47)98632998', 'molestie.in@protonmail.net', 21, NULL),
(31, '(61)25155157', 'nulla.at@protonmail.ca', 22, NULL),
(32, '(51)27187035', 'ultrices.vivamus.rhoncus@yahoo.org', 23, NULL),
(33, '(65)48335364', 'vehicula.et@google.edu', 24, NULL),
(34, '(63)73226692', 'et.libero.proin@google.edu', 25, NULL),
(35, '(63)13336464', 'sit.amet@yahoo.couk', 26, NULL),
(36, '(32)75017764', 'erat.vivamus@protonmail.edu', 27, NULL),
(37, '(17)06723156', 'iaculis.enim.sit@google.edu', 28, NULL),
(38, '(53)52478075', 'fermentum@protonmail.couk', 29, NULL),
(39, '(47)46568687', 'id@hotmail.org', 30, NULL),
(40, '(72)42524465', 'eu.augue.porttitor@yahoo.com', 31, NULL),
(41, '(95)11107434', 'id.nunc@aol.com', 32, NULL),
(42, '(67)96667100', 'lectus@google.net', 33, NULL),
(43, '(68)41782956', 'phasellus.vitae@google.net', 34, NULL),
(44, '(44)53615122', 'nullam.lobortis@aol.couk', 35, NULL),
(45, '(58)83716837', 'ut.erat@outlook.net', 36, NULL),
(46, '(45)87846631', 'fames.ac@aol.net', 37, NULL),
(47, '(18)58284996', 'nec.leo@yahoo.ca', 38, NULL),
(48, '(76)12592877', 'dictum.eu@google.org', 39, NULL),
(49, '(81)48688310', 'volutpat.nunc@aol.net', 40, NULL),
(50, '(69)47511683', 'maecenas.libero@yahoo.edu', 41, NULL),
(51, '(16)83556802', 'facilisis.lorem.tristique@outlook.org', 42, NULL),
(52, '(16)51623792', 'donec.feugiat@icloud.com', 43, NULL),
(53, '(86)11388812', 'fringilla.est@icloud.couk', 44, NULL),
(54, '(10)83141601', 'tristique@outlook.couk', 45, NULL),
(55, '(35)77783142', 'amet.consectetuer@yahoo.couk', 46, NULL),
(56, '(69)55815443', 'dolor.sit@icloud.com', 47, NULL),
(57, '(25)55788267', 'semper@google.org', 48, NULL),
(58, '(84)14788303', 'tortor.nibh@yahoo.ca', 49, NULL),
(59, '(57)86471375', 'ut.erat@icloud.edu', 50, NULL),
(60, '(52)51677779', 'amet@google.org', 51, NULL),
(61, '(44)24670183', 'vehicula@google.org', 52, NULL),
(62, '(88)99378141', 'suspendisse.commodo@icloud.org', 53, NULL),
(63, '(31)75785641', 'mauris.quis@protonmail.com', 54, NULL),
(64, '(48)98581195', 'dictum@protonmail.couk', 55, NULL),
(65, '(82)99215548', 'et.magnis@yahoo.org', 56, NULL),
(66, '(04)31787723', 'sem.elit.pharetra@icloud.org', 57, NULL),
(67, '(57)85445946', 'lorem.vehicula.et@google.couk', 58, NULL),
(68, '(74)70135248', 'turpis.aliquam@yahoo.edu', 59, NULL),
(69, '(83)45611421', 'cum.sociis@yahoo.couk', 60, NULL),
(70, '(77)42664446', 'amet.ultricies@outlook.ca', 61, NULL),
(71, '(82)21161616', 'nunc.quisque@yahoo.net', 62, NULL),
(72, '(66)53782297', 'posuere@yahoo.com', 63, NULL),
(73, '(34)24862469', 'eu.tellus@icloud.edu', 64, NULL),
(74, '(36)16876539', 'diam.lorem@outlook.edu', 65, NULL),
(75, '(57)04278186', 'tortor.nunc@yahoo.edu', 66, NULL),
(76, '(42)13774883', 'ac@hotmail.org', 67, NULL),
(77, '(22)27184474', 'sed@protonmail.com', 68, NULL),
(78, '(65)35172491', 'maecenas@aol.net', 69, NULL),
(79, '(33)78076847', 'porttitor@aol.couk', 70, NULL),
(80, '(75)16879118', 'leo.cras@icloud.couk', 71, NULL),
(81, '(26)10731311', 'vel.sapien@outlook.ca', 72, NULL),
(82, '(07)17163626', 'nisi@google.org', 73, NULL),
(83, '(10)98823883', 'eget.metus@hotmail.com', 74, NULL),
(84, '(40)14699816', 'posuere.vulputate@yahoo.org', 75, NULL),
(85, '(84)16973722', 'nulla.donec.non@google.com', 76, NULL),
(86, '(74)42375656', 'lectus.pede@yahoo.couk', 77, NULL),
(87, '(27)70948857', 'molestie.arcu.sed@icloud.com', 78, NULL),
(88, '(77)66112658', 'libero.nec@outlook.com', 79, NULL),
(89, '(58)12468683', 'arcu.iaculis.enim@google.ca', 80, NULL),
(90, '(81)22927010', 'magna.ut.tincidunt@protonmail.couk', 81, NULL),
(91, '(26)43367492', 'lectus.rutrum@icloud.net', 82, NULL),
(92, '(30)16747174', 'nibh.dolor@yahoo.ca', 83, NULL),
(93, '(83)95245257', 'sem.magna.nec@yahoo.edu', 84, NULL),
(94, '(11)70812981', 'nascetur@outlook.couk', 85, NULL),
(95, '(64)67825358', 'commodo.at.libero@protonmail.couk', 86, NULL),
(96, '(36)66478796', 'sit.amet.orci@outlook.ca', 87, NULL),
(97, '(43)67604758', 'vitae@google.edu', 88, NULL),
(98, '(33)01230606', 'praesent.interdum@aol.org', 89, NULL),
(99, '(22)57197044', 'nullam.enim@protonmail.com', 90, NULL),
(100, '(95)21383424', 'nam.nulla@icloud.org', 91, NULL),
(101, '(02)48782337', 'augue.ac.ipsum@protonmail.couk', 92, NULL),
(102, '(18)90332817', 'nulla.magna@icloud.org', 93, NULL),
(103, '(45)65877341', 'a@protonmail.edu', 94, NULL),
(104, '(78)51611636', 'vel.sapien.imperdiet@icloud.com', 95, NULL),
(105, '(27)45885454', 'volutpat.nulla@outlook.com', 96, NULL),
(106, '(04)11238522', 'nunc.nulla@yahoo.com', 97, NULL),
(107, '(55)92265246', 'feugiat.sed@protonmail.org', 98, NULL),
(108, '(56)44637841', 'laoreet.libero@yahoo.ca', 99, NULL),
(109, '(09)05689237', 'nulla.cras.eu@outlook.com', 100, NULL),
(110, '(97)87835745', 'gravida.nunc@aol.couk', 101, NULL),
(111, '(72)12226162', 'sapien@aol.edu', 102, NULL),
(112, '(46)77834225', 'at.libero@hotmail.edu', 103, NULL),
(113, '(77)55867334', 'vestibulum.mauris@google.org', 104, NULL),
(114, '(64)24132622', 'diam.pellentesque.habitant@protonmail.edu', 105, NULL),
(115, '(91)69615318', 'malesuada.integer.id@protonmail.ca', 106, NULL),
(116, '(35)22842987', 'ligula.aliquam.erat@hotmail.net', 107, NULL),
(117, '(52)55366784', 'ipsum@outlook.edu', 108, NULL),
(118, '(73)32605718', 'vestibulum.lorem.sit@yahoo.couk', 109, NULL),
(119, '(11)75005566', 'in.tempus@icloud.org', 110, NULL),
(120, '(75)64052797', 'mi@yahoo.ca', 111, NULL),
(121, '(61)15212753', 'risus@icloud.ca', 112, NULL),
(122, '(01)27825744', 'in@yahoo.net', 113, NULL),
(123, '(98)91588034', 'non.magna.nam@google.ca', 114, NULL),
(124, '(13)17629661', 'eu.tempor@outlook.edu', 115, NULL),
(125, '(37)80781872', 'nec.imperdiet@aol.org', 116, NULL),
(126, '(37)17781875', 'eu@protonmail.couk', 117, NULL),
(127, '(77)64342375', 'non.nisi.aenean@protonmail.org', 118, NULL),
(128, '(34)24123325', 'ac.libero@outlook.edu', 119, NULL),
(129, '(50)35366993', 'proin.vel@google.com', 120, NULL),
(130, '(71)48358888', 'donec.tincidunt@icloud.ca', 121, NULL),
(131, '(30)39083641', 'semper@outlook.org', 122, NULL),
(132, '(21)15986241', 'pharetra.felis.eget@google.edu', 123, NULL),
(133, '(52)27673849', 'at.pede@protonmail.com', 124, NULL),
(134, '(17)75028723', 'dolor@outlook.org', 125, NULL),
(135, '(01)65400969', 'purus.gravida@protonmail.org', 126, NULL),
(136, '(52)71825885', 'non.hendrerit.id@icloud.net', 127, NULL),
(137, '(88)29768846', 'in.at@yahoo.edu', 128, NULL),
(138, '(76)93950548', 'tempus.scelerisque@hotmail.edu', 129, NULL),
(139, '(01)11016538', 'tellus.non@icloud.org', 130, NULL),
(140, '(87)78587834', 'nunc.est@hotmail.net', 131, NULL),
(141, '(68)33568740', 'eget.lacus.mauris@yahoo.ca', 132, NULL),
(142, '(34)86825802', 'rhoncus.proin@outlook.couk', 133, NULL),
(143, '(32)11377648', 'vulputate.velit.eu@google.ca', 134, NULL),
(144, '(06)28566359', 'vitae.erat@hotmail.org', 135, NULL),
(145, '(36)58656736', 'in.ornare@hotmail.ca', 136, NULL),
(146, '(23)40871565', 'nisi.magna.sed@hotmail.ca', 137, NULL),
(147, '(18)26526779', 'semper.pretium@google.edu', 138, NULL),
(148, '(33)32820716', 'conubia@aol.org', 139, NULL),
(149, '(21)81515334', 'convallis.ante@icloud.couk', 140, NULL),
(150, '(32)16176798', 'amet@protonmail.net', 141, NULL),
(151, '(55)53744346', 'magna@google.com', 142, NULL),
(152, '(37)47996217', 'morbi.non@hotmail.couk', 143, NULL),
(153, '(22)70176262', 'magna.cras.convallis@hotmail.edu', 144, NULL),
(154, '(22)38445323', 'at.auctor@outlook.com', 145, NULL),
(155, '(23)53757264', 'diam@hotmail.edu', 146, NULL),
(156, '(14)68435766', 'nulla.semper@aol.ca', 147, NULL),
(157, '(76)83469722', 'tempus.lorem@yahoo.org', 148, NULL),
(158, '(62)74766764', 'aliquet.phasellus@protonmail.net', 149, NULL),
(159, '(48)51984735', 'nisl.quisque@aol.ca', 150, NULL),
(160, '(48)23454322', 'daniel@gmail.com', 152, NULL),
(163, 'yui', 'yui', 159, NULL),
(165, '(13) 20022525', 'gustavo@gmail.com', 162, NULL),
(166, 'não cadastrado', 'Yuri@gmail.com', 164, NULL),
(167, 'não cadastrado', 'kayle@gmail.com', 165, NULL),
(168, 'não cadastrado', 'fer2@gmail.com', NULL, 151),
(169, 'não cadastrado', 'luizfernando@gmail.com', 166, NULL),
(170, 'não cadastrado', 'gabriel.gusto@gmail.com', 167, NULL),
(171, 'não cadastrado', 'rafa@gmail.com', 168, NULL),
(172, 'não cadastrado', 'gabs@gmail.com', NULL, 152),
(173, 'não cadastrado', 'sah@gmail.com', 169, NULL),
(174, 'não cadastrado', 'sah2@gmail.com', NULL, 153);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estagio`
--

CREATE TABLE `tb_estagio` (
  `cd_estagio` int(11) NOT NULL,
  `nm_estagio` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_estagio`
--

INSERT INTO `tb_estagio` (`cd_estagio`, `nm_estagio`) VALUES
(1, 'inicial'),
(2, 'intermediário'),
(3, 'avançado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_familiar`
--

CREATE TABLE `tb_familiar` (
  `cd_familiar` int(11) NOT NULL,
  `nm_familiar` varchar(90) DEFAULT NULL,
  `nm_senha` varchar(90) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `cd_parentesco` int(11) DEFAULT NULL,
  `cd_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_familiar`
--

INSERT INTO `tb_familiar` (`cd_familiar`, `nm_familiar`, `nm_senha`, `dt_nascimento`, `cd_parentesco`, `cd_paciente`) VALUES
(1, 'Elaine Hull', 'BIP50QKC0TJ', '1996-06-27', 6, 1),
(2, 'Marsden Lynch', 'DHJ67SUN5TA', '1970-01-02', 5, 2),
(3, 'Logan Wiggins', 'YZV20TEJ2EM', '1979-11-22', 2, 3),
(4, 'Lacey Craft', 'CQI01ZWU7PD', '1989-03-15', 2, 4),
(5, 'Kai Shepherd', 'KHR65NCW1NC', '1984-12-03', 4, 5),
(6, 'Roanna Justice', 'GTN41HNS7CK', '1951-06-27', 4, 6),
(7, 'Xavier Reid', 'TQI25CIY2OO', '1996-08-07', 2, 7),
(8, 'Linda Nieves', 'OXE93REK3CL', '1977-10-02', 3, 8),
(9, 'Forrest Goodman', 'SLM05LRJ4PI', '1980-08-10', 2, 9),
(10, 'Yuri Noel', 'RPN49FYQ6FU', '1992-06-02', 5, 10),
(11, 'Althea Dudley', 'BBI31FCL2TV', '1953-08-01', 2, 11),
(12, 'Martha Brennan', 'ESS55EYJ3YU', '1995-06-15', 4, 12),
(13, 'Sharon Roberts', 'JHP27BGY2MB', '1996-11-06', 7, 13),
(14, 'Timon Little', 'EKW13VLD3DK', '1957-06-03', 2, 14),
(15, 'Graiden Mitchell', 'BTJ47RLW3AI', '1980-07-31', 3, 15),
(16, 'Dorian Barrett', 'VGY58YSY1QN', '1966-02-12', 3, 16),
(17, 'Candice Parker', 'GSR28TOI2BQ', '1984-03-17', 1, 17),
(18, 'Piper Mathews', 'CKM40NMA1LO', '1983-10-01', 5, 18),
(19, 'Callie Benson', 'CQF35XIV6OO', '1952-06-25', 3, 19),
(20, 'Stacy Garrison', 'SNU36MYV7RV', '1954-09-17', 5, 20),
(21, 'Reed Castaneda', 'HEL42PJQ1MN', '1982-12-27', 3, 21),
(22, 'Brandon Arnold', 'AYY74UZL3MG', '1993-01-29', 4, 22),
(23, 'Katell Frank', 'KHX71PGO9HA', '1968-05-22', 3, 23),
(24, 'Destiny Barr', 'MJJ03JDG8KY', '1960-12-04', 6, 24),
(25, 'Amaya Orr', 'ECO44TSF5PM', '1977-08-24', 7, 25),
(26, 'Dorian Hill', 'MZW69CPA8IV', '1967-04-27', 3, 26),
(27, 'Hyacinth Evans', 'HEO21CNT7HG', '1983-08-28', 3, 27),
(28, 'Vera Mcleod', 'EVX72UXG2UQ', '1950-09-13', 5, 28),
(29, 'Brent Kinney', 'URQ61VJI2JR', '1990-02-28', 6, 29),
(30, 'Britanney Ferrell', 'PJB83SKK4DK', '1966-05-21', 4, 30),
(31, 'Stone Kirby', 'PPW21GGM3WK', '1962-01-18', 5, 31),
(32, 'Paloma Pena', 'XII32RFU7ID', '1957-11-22', 2, 32),
(33, 'Finn Workman', 'RSV21DGH8XN', '1959-10-07', 6, 33),
(34, 'Drew Johnson', 'YFT00BXL3SO', '1991-05-18', 4, 34),
(35, 'Norman Rosa', 'ASC14YGJ7PO', '1956-06-10', 2, 35),
(36, 'Silas Valentine', 'TTG47DOX4NN', '1963-04-28', 6, 36),
(37, 'Fitzgerald Stout', 'MIL18FKL2VM', '1962-09-26', 5, 37),
(38, 'Geraldine Mccray', 'PYJ39BNC2FI', '1956-05-23', 6, 38),
(39, 'Cody Watson', 'NWK59TYP2VU', '1948-03-19', 6, 39),
(40, 'Edward Hall', 'HTW22EQQ1UN', '1977-03-11', 3, 40),
(41, 'Eric Dalton', 'LWG88FZI9EO', '1981-02-15', 1, 41),
(42, 'Ebony Kinney', 'BST84NTY8YK', '1985-11-03', 3, 42),
(43, 'Castor Byers', 'HKI76HSM3TX', '1955-08-05', 7, 43),
(44, 'Lenore Mcclain', 'GCB34BEL6DN', '1976-09-24', 5, 44),
(45, 'Boris Knox', 'BZO35JXE8YS', '1970-02-19', 6, 45),
(46, 'Abra Campbell', 'NWT52BZI5FJ', '1973-09-21', 4, 46),
(47, 'Rhiannon Pugh', 'XBU72QRR6AH', '1962-05-23', 6, 47),
(48, 'Jolie Castillo', 'FDS25VLJ3CK', '1973-01-07', 5, 48),
(49, 'Audrey Grant', 'MBN61RBI0KP', '1987-11-13', 2, 49),
(50, 'Kasimir Carver', 'EMP45YPK8KR', '1987-07-04', 2, 50),
(51, 'Erica Blevins', 'NPV70SIL7KV', '1977-10-23', 5, 51),
(52, 'Hamish Austin', 'LFP07JSW1JK', '1983-12-07', 7, 52),
(53, 'Shoshana O\'Neill', 'SUV37UER6PI', '1955-02-20', 5, 53),
(54, 'Paloma Park', 'YJV71UQC5HU', '1990-06-08', 5, 54),
(55, 'Melvin Morse', 'XIN30HOJ1XH', '1946-06-01', 3, 55),
(56, 'Joseph Justice', 'EDC18ESJ1SH', '1949-07-23', 1, 56),
(57, 'Ignatius Cervantes', 'RBU27MXH8OI', '1965-12-06', 4, 57),
(58, 'Nathan Mejia', 'BFF30MXX2DI', '1962-04-21', 6, 58),
(59, 'Tate Hamilton', 'RYW78QJO7JJ', '1977-04-06', 4, 59),
(60, 'Inez Key', 'RRM73HSY0MJ', '1992-03-23', 1, 60),
(61, 'Kyla Rose', 'QQS18HBW9CL', '1986-12-22', 3, 61),
(62, 'Althea Stevens', 'FZU68FBN5OJ', '1975-02-22', 1, 62),
(63, 'Lacey Phelps', 'QUL84RVP6YG', '1972-08-12', 3, 63),
(64, 'Yardley Snow', 'DMF15HCC0PU', '1987-02-25', 5, 64),
(65, 'Delilah Flores', 'YKB46MHM5XO', '1958-04-16', 3, 65),
(66, 'September Fuller', 'ETY87PXI4AS', '1953-10-31', 3, 66),
(67, 'Yardley Short', 'LGF75KOL5CB', '1985-12-30', 4, 67),
(68, 'Denise Harding', 'SJW04GVS2KI', '1986-04-07', 5, 68),
(69, 'Piper Spence', 'IMS88OQS0VW', '1991-12-23', 4, 69),
(70, 'Hermione Burgess', 'ZMM88FLS8OD', '1995-02-08', 4, 70),
(71, 'Buffy Christensen', 'MKX13WPG7LQ', '1948-05-20', 7, 71),
(72, 'Herrod Buckley', 'LVX61UEJ3TH', '1981-08-19', 3, 72),
(73, 'Patience Brady', 'NDK75WLG2PX', '1987-10-20', 3, 73),
(74, 'Jaime Hays', 'BGU77MWD1EF', '1981-03-17', 2, 74),
(75, 'September Hester', 'QYD89QCC5KG', '1983-12-31', 1, 75),
(76, 'Armando Roy', 'JAB22UOX0MN', '1994-07-17', 3, 76),
(77, 'Basil Heath', 'RMM69PWV7JT', '1981-08-27', 3, 77),
(78, 'Wanda Gallagher', 'MOD85SVS1WY', '1954-08-26', 1, 78),
(79, 'Ella Donovan', 'VCB15NJS7XR', '1951-01-11', 3, 79),
(80, 'Xanthus Kramer', 'PEG47XVV7PJ', '1951-03-31', 5, 80),
(81, 'Kimberly Leon', 'ERE52FSN6ZH', '1956-04-15', 2, 81),
(82, 'Aspen Bean', 'PSV86WXV7XO', '1945-11-19', 5, 82),
(83, 'Shellie Boone', 'ZSJ25DNW6XS', '1999-07-02', 4, 83),
(84, 'Rigel Parrish', 'XWQ61VAC7VE', '1974-01-13', 7, 84),
(85, 'Janna Leach', 'MCU78CRO9GD', '1950-07-16', 3, 85),
(86, 'Lois Gardner', 'DFT79MDS6TT', '1980-09-27', 3, 86),
(87, 'Judah Acosta', 'XOF88ZNO5QS', '1999-08-31', 3, 87),
(88, 'Oprah Morse', 'HTZ53XDP7WI', '1965-01-06', 2, 88),
(89, 'Yvonne Roberts', 'HFD43QXH1RJ', '1952-08-19', 6, 89),
(90, 'Tanya Mendoza', 'CWH73AVM4CZ', '1952-10-01', 5, 90),
(91, 'Briar Padilla', 'QIN47WPZ1XV', '1984-09-10', 4, 91),
(92, 'Quemby Workman', 'NKT52UFG5WZ', '1975-08-05', 5, 92),
(93, 'Cade Carney', 'JBX67PVV6EQ', '1979-07-25', 4, 93),
(94, 'Julian Stuart', 'YDM12FRP9DQ', '1953-09-06', 5, 94),
(95, 'Colby Page', 'LDW67TFK2HS', '1980-11-30', 1, 95),
(96, 'Hanna Stevens', 'PGF83NVS0UD', '1970-02-08', 3, 96),
(97, 'Shellie Smith', 'YJQ66UQL0WP', '1966-01-30', 2, 97),
(98, 'Drake Freeman', 'QSH82QQB8RD', '1953-09-13', 6, 98),
(99, 'Jenette Boyer', 'WBU82GCV2YD', '1958-06-06', 6, 99),
(100, 'Caldwell Simon', 'TOK07VGI0BK', '1968-12-06', 1, 100),
(101, 'Giacomo Stevenson', 'YBE97JDZ9IO', '1965-12-17', 2, 101),
(102, 'Cara Garner', 'UKB12FXL7HY', '1958-12-11', 6, 102),
(103, 'Herman Carroll', 'VPW62IKI7CI', '1998-09-24', 4, 103),
(104, 'Ryder Evans', 'BDI49MTD3GG', '1969-05-21', 6, 104),
(105, 'Jorden Santiago', 'SAA05GAR8XP', '1996-01-11', 3, 105),
(106, 'Berk Galloway', 'JMO21LJX5BD', '1965-01-16', 6, 106),
(107, 'Tate Patrick', 'PBZ41UPS5TY', '1955-02-16', 2, 107),
(108, 'Penelope Talley', 'EYN82SGF1OH', '1997-06-15', 5, 108),
(109, 'Iola Abbott', 'PIA32HOX6JK', '1980-01-26', 3, 109),
(110, 'Melissa Waller', 'OHK36EOK1UQ', '1998-07-15', 5, 110),
(111, 'Geraldine Wyatt', 'AKE83KHS0DY', '1947-11-20', 4, 111),
(112, 'Faith Wright', 'AIK86GEJ5BW', '1972-12-06', 7, 112),
(113, 'Fletcher Hale', 'VGB11RTU8TL', '1979-07-22', 5, 113),
(114, 'Constance Ferrell', 'IQP17NCR7QN', '1946-05-09', 3, 114),
(115, 'Graham Hunt', 'VTI16QLE5NS', '1966-01-04', 4, 115),
(116, 'Merritt Ray', 'IVY16JHS2YY', '1995-11-30', 6, 116),
(117, 'Micah Craig', 'LWH94KKU5WQ', '1992-12-01', 7, 117),
(118, 'Beck Hendricks', 'KIG54FFZ4WU', '1968-12-11', 2, 118),
(119, 'Amethyst Sampson', 'VTM86UGK2YX', '1951-12-20', 5, 119),
(120, 'Anika Deleon', 'USU83CJY2WF', '1987-06-20', 3, 120),
(121, 'Idona Griffith', 'KRD62CNM1TA', '1946-03-31', 4, 121),
(122, 'Garrett Merrill', 'OTN47PPT2SH', '1967-07-19', 4, 122),
(123, 'Avram Elliott', 'YBU41FSR9ZU', '1982-09-11', 4, 123),
(124, 'Dillon Burton', 'RKV39YQM6WK', '1998-11-13', 3, 124),
(125, 'Sage Serrano', 'VJY82IUO8XR', '1990-03-31', 2, 125),
(126, 'Jordan Foster', 'THC62IPT5GO', '1994-05-21', 3, 126),
(127, 'Alec Nguyen', 'HFE33LYW5QB', '1991-02-27', 6, 127),
(128, 'Talon Gutierrez', 'PMB90GEH3OP', '1965-10-01', 2, 128),
(129, 'Ciaran Mays', 'LUC44CZJ5AU', '1980-07-23', 2, 129),
(130, 'Wallace Daugherty', 'YZT65UMW5AP', '1996-04-04', 1, 130),
(131, 'Jack Hudson', 'UIW65IAG2DM', '1953-04-16', 3, 131),
(132, 'Sophia Dejesus', 'CML16XIF1NL', '1997-05-03', 5, 132),
(133, 'Davis Bartlett', 'GYP52MHZ7KO', '1979-04-13', 3, 133),
(134, 'Kirestin Hines', 'PUB21ANT2KE', '1967-11-28', 2, 134),
(135, 'Warren Paul', 'LKF01WYY8EK', '1952-05-26', 2, 135),
(136, 'Lael Vincent', 'RIP31NHO2DJ', '1953-07-25', 2, 136),
(137, 'Connor Whitney', 'WSP24LPF3IH', '1974-12-02', 4, 137),
(138, 'Merrill Salas', 'CPL30QMZ5VI', '1976-04-15', 7, 138),
(139, 'Hanna Barber', 'PQF40RNZ8MB', '1966-12-10', 5, 139),
(140, 'Nathan Gamble', 'TPU86YUX5UU', '1970-02-01', 5, 140),
(141, 'Duncan Erickson', 'UPC31XLA7PB', '1978-11-23', 6, 141),
(142, 'Channing Valdez', 'CSB78YPF1UE', '1964-09-25', 6, 142),
(143, 'Joel Bernard', 'FJI78PUB6JQ', '1954-10-15', 3, 143),
(144, 'Alea Haney', 'KEV00FTU6CH', '1988-06-14', 2, 144),
(145, 'Zephania Mayer', 'TQP69KOB8BE', '1985-10-10', 5, 145),
(146, 'Brett Lyons', 'CDD53VKW3PD', '1955-07-17', 5, 146),
(147, 'Wade Alford', 'UTI66UET6KR', '1959-10-25', 6, 147),
(148, 'Chadwick Kirk', 'NKS58TMV3EK', '1975-02-02', 1, 148),
(149, 'Daquan Floyd', 'FRK72BGU8EU', '1986-06-26', 2, 149),
(150, 'Kenyon Nieves', 'CNJ15FTH0WO', '1951-04-20', 1, 150),
(151, 'Fernando Alavrez', '$2y$10$1WOQ9Uj/5WEuN/2HFH10durrkO2O.aLy/2W93C7Gki78HrYpjLyG2', '1991-04-09', 1, 152),
(152, 'Gabreil souza', '$2y$10$VTyHMZVfOTrQQPYnxxqF7uY5bQ8JgvzLQ5xfkoV7G/b5tWAfWFQBS', '1996-03-06', 2, 168),
(153, 'Jordele Silva', '$2y$10$O7SArflzQjHrAJPEkYSc9uutpzzhxUka1MlnGWGLjTfqippJ6dLFG', '1998-04-07', 1, 169);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_galeria`
--

CREATE TABLE `tb_galeria` (
  `cd_galeria` int(11) NOT NULL,
  `nm_titulo` varchar(90) DEFAULT NULL,
  `nm_caminho` varchar(110) DEFAULT NULL,
  `cd_paciente` int(11) DEFAULT NULL,
  `ds_resumo` varchar(120) DEFAULT NULL,
  `dt_galeria` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_galeria`
--

INSERT INTO `tb_galeria` (`cd_galeria`, `nm_titulo`, `nm_caminho`, `cd_paciente`, `ds_resumo`, `dt_galeria`) VALUES
(14, 'Meus Amores', 'http://localhost:8080/uploads/6279c76e0d3b7.jpg', 165, 'Os amores da minha maravilhosa vida', '2022-01-15'),
(15, 'Meus amores', 'http://localhost:8080/uploads/627a9eb67dd66.jpg', 168, 'obrigado Deus', '2022-02-17'),
(16, 'Filhinho querido', 'http://localhost:8080/uploads/627fef9239347.jpg', 152, 'meu amado filho', '2022-03-05'),
(17, 'teste', 'http://localhost:8080/uploads/62813f202c166.jpg', 152, 'teste', '2022-02-16'),
(18, 'Coringa', 'http://localhost:8080/uploads/6281a2e090101.jpg', 152, 'vilão do batman, do filme que vi hoje', '2022-01-19'),
(19, 'Meu carro', 'http://localhost:8080/uploads/43702375204726.jpg', 132, 'meu carro lindo', '2022-04-13'),
(20, 'celular novo', 'http://localhost:8080/uploads/98324nh324oiug.jpg', 16, 'meu novo celular', '2002-03-26'),
(21, 'céu hoje', 'http://localhost:8080/uploads/29384h324u3290.jpg', 164, 'hoje o céu estava lindo', '2022-05-29'),
(22, 'futebol', 'http://localhost:8080/uploads/873214h24uhsdhf.jpg', 133, 'jogo de futebol', '2022-05-07'),
(23, 'musica', 'http://localhost:8080/uploads/98edsfhdskj65ds4f.jpg', 124, 'minha musica favorita', '2022-01-06'),
(24, 'meu filho', 'http://localhost:8080/uploads/ds987fysdfd654fds.jpg', 14, 'meu querido filho', '2022-04-19'),
(25, 'moto', 'http://localhost:8080/uploads/98uewrnewrjsd098.jpg', 17, 'moto muito bonita', '2022-04-25'),
(26, 'casa', 'http://localhost:8080/uploads/98dsayfaljsfdh321.jpg', 64, 'Minha casa', '2022-03-22'),
(27, 'piscina', 'http://localhost:8080/uploads/563244fes24dasd.jpg', 67, 'dia da piscina', '2022-02-10'),
(28, 'parque', 'http://localhost:8080/uploads/879sadkjsadh2134.jpg', 125, 'dia que fomos ao parque', '2022-03-05'),
(29, 'museu', 'http://localhost:8080/uploads/6fd5g49fd87gsd32f.jpg', 124, 'fotos do museu', '2022-01-08'),
(30, 'pintura', 'http://localhost:8080/uploads/fds564gsfd43532146,jpg', 67, 'pinturas bonitas', '2022-03-14'),
(31, 'escultura', 'http://localhost:8080/uploads/4325564gfdssdf3249d.jpg', 21, 'esculturas interessantes', '2022-05-09'),
(32, 'mercado', 'http://localhost:8080/uploads/ds56f43w341sdf6543.jpg', 14, 'dia de compras com minha familia', '2022-05-22'),
(33, 'amigos', 'http://localhost:8080/uploads/32564fds685f7s3248.jpg', 74, 'dia na casa do meu amigo', '2022-04-19'),
(34, 'churrasco', 'http://localhost:8080/uploads/83724h32iu4y3287dsi.jpg', 52, 'churrasco em familia', '2022-03-26'),
(35, 'escola', 'http://localhost:8080/uploads/565434613fds24g654.jpg', 47, 'material escolar do meu filho', '2022-02-21'),
(36, 'natal', 'http://localhost:8080/uploads/64535744324ds65f7sd.jpg', 26, 'natal com minha familia', '2022-04-29'),
(37, 'ano novo', 'http://localhost:8080/uploads/65ds4f89ds7435564g.jpg', 21, 'ano novo na praia', '2022-02-02'),
(38, 'novela', 'http://localhost:8080/uploads/685443589dsgf165f49,jpg', 69, 'assistindo novela com minha familia', '2022-05-06'),
(39, 'cinema', 'http://localhost:8080/uploads/8574fd65g14h6574fgh.jpg', 54, 'cinema com minha familia', '2022-05-09'),
(40, 'museu', 'http://localhost:8080/uploads/8747387409273042765.jpg', 32, 'lindo museu que visitei', '2022-04-12'),
(41, 'computador', 'http://localhost:8080/uploads/5389265392693569865.jpg', 45, 'computador novo que comprei', '2022-05-25'),
(42, 'amigos', 'http://localhost:8080/uploads/6376543285639784659.jpg', 45, 'eu e meus amigos', '2022-04-06'),
(43, 'churrasco', 'http://localhost:8080/uploads/5382452386753652468.jpg', 45, 'churrasco na minha casa', '2022-04-06'),
(44, 'almoço em familia', 'http://localhost:8080/uploads/4655438652658293456.jpg', 45, 'almoço na casa da minha mãe', '2022-04-12'),
(45, 'jogo novo', 'http://localhost:8080/uploads/dgfksgr7436596396508.jpg', 44, 'jogo novo que comprei para meu neto', '2022-05-19'),
(46, 'filme', 'http://localhost:8080/uploads/5436536357433278165.jpg', 45, 'assistindo filme durante a tarde', '2022-03-07'),
(47, 'bolo de cenoura', 'http://localhost:8080/uploads/429769sgt934ht900887.jpg', 45, 'bolo de cenoura muito gostoso', '2022-01-30'),
(48, 'celular', 'http://localhost:8080/uploads/643576439875639jgkjh.jpg', 45, 'aprendendo a mexer no celular', '2022-05-05'),
(49, 'matematica', 'http://localhost:8080/uploads/6543206580635032565.jpg', 73, 'ajudando neto nas contas da escola', '2022-04-15'),
(50, 'viagem', 'http://localhost:8080/uploads/6576943293404368038.jpg', 73, 'viagem ao campo', '2022-02-07'),
(51, 'academia', 'http://localhost:8080/uploads/7403658076438607380.jpg', 73, 'treino de perna', '2022-03-04'),
(52, 'bolo de chocolate', 'http://localhost:8080/uploads/gfsg736298562965652.jpg', 89, 'fiz um bolo de chocolate', '2022-04-13'),
(53, 'musica', 'http://localhost:8080/uploads/gfhdsgjfgwi462564375.jpg', 89, 'ouvindo musicas novas', '2022-05-21'),
(54, 'leitura', 'http://localhost:8080/uploads/639763297567294365y.jpg', 89, 'lendo um bom livro', '2022-04-23'),
(55, 'festa', 'http://localhost:8080/uploads/7y4650yheutjhdg40y07.jpg', 78, 'festa da familia', '2022-01-02'),
(56, 'casa nova', 'http://localhost:8080/uploads/hdsfushg543776548037.jpg', 78, 'minha casa nova', '2022-01-02'),
(57, 'carro dos sonhos', 'http://localhost:8080/uploads/gfks54w652065026580h.jpg', 78, 'carro que semprei sonhei em ter', '2022-01-14'),
(58, 'aula de inglês', 'http://localhost:8080/uploads/96275ty32g5gohfh0043.jpg', 34, 'minha primeira aula de inglês', '2022-02-16'),
(59, 'bolo de banana', 'http://localhost:8080/uploads/3765632706570376525.jpg', 34, 'fiz um bolinho de banana delicioso', '2022-05-21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_genero`
--

CREATE TABLE `tb_genero` (
  `cd_genero` int(11) NOT NULL,
  `nm_genero` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_genero`
--

INSERT INTO `tb_genero` (`cd_genero`, `nm_genero`) VALUES
(1, 'masculino'),
(2, 'feminino'),
(3, 'outro'),
(4, 'prefiro não dizer'),
(5, 'não selecionado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_jogos`
--

CREATE TABLE `tb_jogos` (
  `cd_jogo` int(11) NOT NULL,
  `nm_jogo` varchar(70) DEFAULT NULL,
  `cd_tipo_jogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_jogos`
--

INSERT INTO `tb_jogos` (`cd_jogo`, `nm_jogo`, `cd_tipo_jogo`) VALUES
(1, 'jogo da memória', 1),
(2, 'genius', 1),
(3, 'maps', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_jogo_paciente`
--

CREATE TABLE `tb_jogo_paciente` (
  `cd_jogo_paciente` int(11) NOT NULL,
  `cd_jogo` int(11) DEFAULT NULL,
  `cd_paciente` int(11) DEFAULT NULL,
  `num_pontuacao` int(6) DEFAULT NULL,
  `dt_partida` date DEFAULT NULL,
  `num_erros` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_jogo_paciente`
--

INSERT INTO `tb_jogo_paciente` (`cd_jogo_paciente`, `cd_jogo`, `cd_paciente`, `num_pontuacao`, `dt_partida`, `num_erros`) VALUES
(1, 1, 1, 7, '2022-01-13', NULL),
(2, 2, 1, 10, '2022-01-13', NULL),
(3, 1, 2, 4, '2022-01-12', NULL),
(4, 1, 3, 2, '2022-01-15', NULL),
(5, 2, 4, 1, '2022-01-17', NULL),
(6, 1, 16, 19, '2021-08-20', NULL),
(7, 3, 18, 3, '2022-04-23', NULL),
(8, 1, 1, 22, '2021-07-04', NULL),
(9, 3, 18, 3, '2022-04-30', NULL),
(10, 1, 12, 23, '2022-06-22', NULL),
(11, 2, 3, 7, '2021-07-12', NULL),
(12, 1, 15, 23, '2022-05-08', NULL),
(13, 1, 13, 22, '2022-01-18', NULL),
(14, 1, 5, 12, '2022-10-01', NULL),
(15, 3, 12, 16, '2022-11-03', NULL),
(26, 1, 16, 19, '2021-08-20', NULL),
(27, 2, 18, 3, '2022-04-23', NULL),
(28, 2, 1, 22, '2021-07-04', NULL),
(29, 1, 18, 3, '2022-04-30', NULL),
(30, 1, 12, 23, '2022-06-22', NULL),
(31, 3, 3, 7, '2021-07-12', NULL),
(32, 1, 15, 23, '2022-05-08', NULL),
(33, 1, 13, 22, '2022-01-18', NULL),
(34, 3, 5, 12, '2022-10-01', NULL),
(35, 1, 12, 16, '2022-11-03', NULL),
(56, 1, 66, 17, '2021-05-14', NULL),
(57, 2, 78, 24, '2022-01-01', NULL),
(58, 1, 138, 21, '2021-04-01', NULL),
(59, 1, 2, 11, '2021-07-14', NULL),
(60, 1, 15, 15, '2021-07-22', NULL),
(61, 1, 70, 6, '2021-07-04', NULL),
(62, 1, 58, 22, '2021-12-04', NULL),
(63, 1, 104, 20, '2022-02-27', NULL),
(64, 1, 103, 14, '2021-05-05', NULL),
(65, 3, 103, 20, '2021-09-10', NULL),
(66, 1, 121, 16, '2021-09-16', NULL),
(67, 1, 46, 15, '2021-03-28', NULL),
(68, 2, 38, 8, '2022-01-27', NULL),
(69, 1, 120, 13, '2021-04-23', NULL),
(70, 1, 146, 9, '2022-02-27', NULL),
(71, 1, 50, 25, '2021-04-15', NULL),
(72, 1, 74, 18, '2021-09-09', NULL),
(73, 1, 82, 25, '2021-11-22', NULL),
(74, 1, 38, 13, '2021-06-01', NULL),
(75, 1, 136, 22, '2021-04-10', NULL),
(76, 2, 52, 13, '2021-12-19', NULL),
(77, 3, 39, 11, '2022-01-20', NULL),
(78, 1, 73, 24, '2021-09-16', NULL),
(79, 3, 87, 20, '2021-09-13', NULL),
(80, 1, 115, 14, '2022-02-10', NULL),
(81, 2, 2, 13, '2021-05-04', NULL),
(82, 1, 20, 23, '2021-12-07', NULL),
(83, 2, 123, 12, '2021-12-25', NULL),
(84, 1, 97, 10, '2022-02-20', NULL),
(85, 1, 134, 5, '2021-07-18', NULL),
(86, 1, 12, 19, '2021-05-08', NULL),
(87, 1, 101, 12, '2021-09-07', NULL),
(88, 1, 39, 8, '2021-09-01', NULL),
(89, 1, 110, 18, '2021-10-08', NULL),
(90, 3, 23, 1, '2022-01-20', NULL),
(91, 1, 137, 21, '2021-10-07', NULL),
(92, 2, 129, 12, '2021-05-23', NULL),
(93, 1, 24, 7, '2021-09-07', NULL),
(94, 1, 27, 12, '2022-03-13', NULL),
(95, 2, 132, 21, '2021-12-09', NULL),
(96, 3, 62, 22, '2021-09-29', NULL),
(97, 3, 148, 7, '2021-08-27', NULL),
(98, 3, 36, 2, '2021-08-03', NULL),
(99, 3, 81, 3, '2021-06-06', NULL),
(100, 2, 28, 24, '2022-02-23', NULL),
(101, 1, 83, 9, '2021-12-12', NULL),
(102, 2, 92, 3, '2021-04-28', NULL),
(103, 1, 108, 22, '2021-04-05', NULL),
(104, 1, 97, 8, '2021-09-18', NULL),
(105, 2, 137, 6, '2022-02-07', NULL),
(106, 1, 133, 21, '2021-07-30', NULL),
(107, 2, 116, 24, '2021-07-18', NULL),
(108, 1, 96, 9, '2021-07-15', NULL),
(109, 1, 126, 19, '2021-11-17', NULL),
(110, 2, 40, 11, '2021-07-02', NULL),
(111, 2, 95, 15, '2021-07-29', NULL),
(112, 3, 109, 7, '2021-09-04', NULL),
(113, 1, 50, 11, '2021-09-08', NULL),
(114, 1, 19, 19, '2021-10-12', NULL),
(115, 3, 133, 6, '2021-10-25', NULL),
(116, 1, 88, 11, '2021-06-28', NULL),
(117, 3, 145, 24, '2022-01-18', NULL),
(118, 1, 126, 10, '2021-09-07', NULL),
(119, 1, 7, 13, '2021-06-04', NULL),
(120, 2, 12, 21, '2022-02-18', NULL),
(121, 1, 127, 21, '2021-04-13', NULL),
(122, 2, 16, 23, '2021-05-14', NULL),
(123, 1, 140, 7, '2021-08-19', NULL),
(124, 1, 69, 3, '2021-08-02', NULL),
(125, 1, 131, 15, '2021-08-13', NULL),
(126, 3, 82, 21, '2021-08-31', NULL),
(127, 1, 54, 7, '2021-04-25', NULL),
(128, 1, 82, 18, '2021-05-24', NULL),
(129, 2, 17, 18, '2021-07-03', NULL),
(130, 1, 126, 3, '2021-06-15', NULL),
(131, 3, 138, 10, '2021-06-17', NULL),
(132, 1, 8, 8, '2021-09-25', NULL),
(133, 2, 31, 11, '2021-10-15', NULL),
(134, 1, 112, 8, '2021-12-15', NULL),
(135, 2, 55, 12, '2021-07-20', NULL),
(136, 2, 128, 18, '2021-04-16', NULL),
(137, 2, 75, 14, '2022-01-09', NULL),
(138, 1, 33, 13, '2021-05-19', NULL),
(139, 3, 6, 13, '2021-12-03', NULL),
(140, 1, 60, 21, '2022-03-11', NULL),
(141, 3, 24, 10, '2021-09-04', NULL),
(142, 1, 129, 6, '2021-07-16', NULL),
(143, 2, 101, 16, '2021-04-06', NULL),
(144, 1, 78, 15, '2021-12-31', NULL),
(145, 2, 6, 11, '2021-04-04', NULL),
(146, 1, 100, 3, '2021-05-15', NULL),
(147, 3, 68, 22, '2021-07-06', NULL),
(148, 1, 71, 20, '2021-06-21', NULL),
(149, 1, 105, 1, '2022-03-02', NULL),
(150, 1, 92, 5, '2021-09-16', NULL),
(151, 2, 35, 18, '2021-11-12', NULL),
(152, 1, 90, 23, '2021-04-25', NULL),
(153, 1, 48, 16, '2022-03-05', NULL),
(154, 3, 116, 20, '2021-06-20', NULL),
(155, 2, 62, 21, '2022-03-03', NULL),
(156, 1, 74, 10, '2021-05-05', NULL),
(157, 3, 15, 2, '2021-11-23', NULL),
(158, 1, 16, 4, '2022-01-07', NULL),
(159, 1, 115, 10, '2021-06-05', NULL),
(160, 2, 69, 20, '2021-12-23', NULL),
(161, 1, 6, 2, '2021-07-12', NULL),
(162, 1, 27, 4, '2022-01-19', NULL),
(163, 2, 79, 16, '2021-04-10', NULL),
(164, 1, 124, 9, '2021-07-18', NULL),
(165, 1, 124, 8, '2021-10-28', NULL),
(166, 1, 119, 22, '2021-10-14', NULL),
(167, 1, 130, 16, '2021-11-25', NULL),
(168, 1, 141, 16, '2021-08-06', NULL),
(169, 3, 18, 24, '2021-09-07', NULL),
(170, 1, 65, 6, '2021-05-29', NULL),
(171, 1, 137, 18, '2021-06-29', NULL),
(172, 3, 101, 5, '2022-02-08', NULL),
(173, 1, 74, 22, '2021-11-10', NULL),
(174, 2, 3, 22, '2022-01-23', NULL),
(175, 1, 37, 5, '2022-01-14', NULL),
(176, 1, 100, 8, '2021-05-15', NULL),
(177, 1, 120, 2, '2021-12-04', NULL),
(178, 2, 95, 6, '2021-09-15', NULL),
(179, 1, 1, 15, '2021-08-22', NULL),
(180, 3, 148, 13, '2021-03-21', NULL),
(181, 1, 146, 18, '2021-12-21', NULL),
(182, 2, 126, 18, '2021-03-23', NULL),
(183, 3, 58, 16, '2021-08-12', NULL),
(184, 1, 8, 12, '2021-09-20', NULL),
(185, 1, 130, 18, '2022-03-13', NULL),
(186, 3, 112, 24, '2021-09-16', NULL),
(187, 1, 99, 11, '2021-06-21', NULL),
(188, 1, 44, 22, '2021-07-19', NULL),
(189, 3, 82, 13, '2021-07-10', NULL),
(190, 1, 124, 1, '2021-05-22', NULL),
(191, 1, 14, 12, '2021-10-07', NULL),
(192, 1, 65, 10, '2021-04-21', NULL),
(193, 1, 105, 19, '2021-10-15', NULL),
(194, 2, 57, 19, '2021-06-14', NULL),
(195, 1, 22, 10, '2021-11-24', NULL),
(196, 2, 68, 1, '2021-10-06', NULL),
(197, 1, 127, 18, '2021-03-19', NULL),
(198, 1, 5, 3, '2022-01-24', NULL),
(199, 3, 44, 11, '2021-12-09', NULL),
(200, 1, 54, 8, '2021-09-14', NULL),
(201, 2, 149, 23, '2021-08-22', NULL),
(202, 3, 87, 23, '2021-06-30', NULL),
(203, 1, 64, 10, '2021-12-03', NULL),
(204, 1, 88, 20, '2022-03-11', NULL),
(205, 1, 130, 22, '2022-03-06', NULL),
(206, 1, 152, 4, '2022-04-20', 3),
(207, 1, 152, 4, '2022-04-20', 3),
(208, 1, 152, 4, '2022-04-20', 3),
(209, 1, 152, 4, '2022-04-20', 3),
(210, 1, 152, 4, '2022-04-20', 2),
(211, 1, 152, 4, '2022-04-20', 3),
(212, 1, 152, 4, '2022-04-20', 3),
(213, 1, 152, 4, '2022-04-20', 5),
(214, 1, 152, 4, '2022-04-20', 3),
(215, 1, 152, 4, '2022-04-20', 4),
(216, 1, 152, 4, '2022-04-20', 4),
(217, 1, 152, 4, '2022-04-20', 3),
(218, 1, 152, 4, '2022-04-20', 12),
(219, 1, 152, 4, '2022-04-21', 2),
(220, 1, 152, 4, '2022-04-30', 3),
(221, 1, 167, 4, '2022-05-05', 2),
(222, 1, 167, 4, '2022-05-05', 2),
(223, 1, 167, 4, '2022-05-05', 1),
(224, 1, 167, 4, '2022-05-05', 2),
(225, 1, 167, 4, '2022-05-05', 3),
(226, 1, 168, 4, '2022-05-10', 2),
(227, 1, 152, 4, '2022-05-15', 3),
(228, 1, 152, 4, '2022-05-17', 10),
(229, 1, 152, 4, '2022-05-17', 2),
(230, 1, 152, 7, '2022-01-02', 8),
(231, 1, 152, 9, '2022-02-02', 6),
(232, 1, 169, 4, '2022-02-22', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notes`
--

CREATE TABLE `tb_notes` (
  `cd_notes` int(11) NOT NULL,
  `nm_titulo` varchar(40) DEFAULT NULL,
  `txt_note` text DEFAULT NULL,
  `dt_criacao` date DEFAULT NULL,
  `cd_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_notes`
--

INSERT INTO `tb_notes` (`cd_notes`, `nm_titulo`, `txt_note`, `dt_criacao`, `cd_paciente`) VALUES
(1, 'Uma Vida Amada', 'É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de \"Conteúdo aqui, conteúdo aqui\", fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por lorem ipsum mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).\n', '2022-02-21', 1),
(2, 'A última chance', 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.\n', '2022-01-15', 2),
(3, 'A prmeira vista', 'O trecho padrão original de Lorem Ipsum, usado desde o século XVI, está reproduzido abaixo para os interessados. Seções 1.10.32 e 1.10.33 de \"de Finibus Bonorum et Malorum\" de Cicero também foram reproduzidas abaixo em sua forma exata original, acompanhada das versões para o inglês da tradução feita por H. Rackham em 1914.\n', '2022-05-21', 3),
(4, 'Lista de compra', '1-Sabão,2-Arroz,3-coca\n', '2022-01-21', 4),
(5, 'Musiquinhas', '1-Adele,2-Rise(lol),3-amber\n', '2022-03-10', 5),
(6, 'Filmes', 'O porque vivemos\n', '2022-02-08', 2),
(7, 'Minhas Memórias de hoje', 'Hoje fui até a padaria comprar deliciosos pães de forma que minha mãe sempre comprava no café da manhã\n', '2022-01-04', 2),
(8, 'Memórias de ontem', 'Ontem comi uma comida muito saborosa junto ao molho bastante picante \n', '2022-02-17', 4),
(9, 'Minha amada família', 'Minha mãe é uma deusa, meu pai é um batalhador e meu irmão é bastante dedicado', '2022-01-26', 1),
(11, 'Shopping', 'Essa semana fui ao shopping e comprei um tênis', '2022-02-22', 2),
(12, 'Assistir filme', 'Domingo eu assisti um filme com meu neto', '2022-02-20', 5),
(13, 'Visita da familia', 'Hoje faz um ano que meus irmãos me visitaram', '2022-02-20', 4),
(14, 'Casamento do Gabriel', 'Ontem eu fui ao casamento do meu filho Gabriel, foi muito legal!', '2022-03-01', 1),
(15, 'Comer Feijoada', 'No almoço comi uma feijoada com minha filha, e a feijoada estava muito gostosa', '2022-03-11', 5),
(16, 'Dia de Hoje', 'Hoje eu não fiz muita coisa, só fiquei em casa o dia inteiro', '2022-02-27', 5),
(17, 'Primeira vez na praia', 'Lembrei da primeira vez que fui à praia, foi um momento espetacular', '2022-03-13', 1),
(18, 'Primeiro Emprego', 'Estava lembrando do primeiro emprego, trabalhei em uma empresa no interior de São Paulo', '2022-03-05', 3),
(19, 'Curitiba', 'Esse final de semana meu filho e minha nora me levaram a Curitiba, é uma bela cidade!', '2022-02-28', 4),
(20, 'Saudade', 'Estou com saudade dos meus irmãos', '2022-03-02', 5),
(21, 'Assistir desenho', 'Hoje eu assisti um desenho com meu neto', '2022-02-15', 2),
(22, 'Aniversário', 'Hoje é meu aniversário, à noite meus familiares e amigos vão vir me ver', '2022-02-20', 1),
(23, 'Celular', 'Hoje comprei um celular para mim, mas não sei mexer', '2022-02-24', 4),
(24, 'Infância', 'Lembrei de quando eu era criança e brincava no sitio', '2022-02-08', 5),
(25, 'Mãe', 'Hoje estava pensando na minha mãezinha, tenho muitas saudades dela', '2022-02-21', 1),
(26, 'aliquet, metus', 'dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae', '2021-01-23', 129),
(27, 'fames ac', 'nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc', '2021-11-07', 11),
(28, 'nonummy ut,', 'nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula', '2021-09-05', 6),
(29, 'blandit mattis.', 'ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet', '2022-03-01', 95),
(30, 'auctor odio', 'Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id,', '2021-08-02', 60),
(31, 'eleifend non,', 'enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras', '2021-02-27', 43),
(32, 'luctus et', 'elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis.', '2021-11-22', 7),
(33, 'lacinia. Sed', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu', '2021-03-16', 97),
(34, 'sem magna', 'sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.', '2021-12-21', 80),
(35, 'nonummy. Fusce', 'parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero', '2021-11-22', 112),
(36, 'orci. Ut', 'malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum', '2021-06-04', 20),
(37, 'Proin non', 'erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla', '2022-02-22', 81),
(38, 'pede, malesuada', 'at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae', '2021-09-09', 54),
(39, 'id nunc', 'amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a', '2021-03-12', 45),
(40, 'Nam consequat', 'nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui.', '2021-03-28', 50),
(41, 'massa rutrum', 'consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu', '2021-06-09', 59),
(42, 'eu dolor', 'eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,', '2022-02-27', 117),
(43, 'enim. Etiam', 'vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In', '2021-01-18', 94),
(44, 'ligula. Aenean', 'Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis', '2022-01-17', 82),
(45, 'ultricies adipiscing,', 'metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.', '2021-04-19', 93),
(46, 'hendrerit. Donec', 'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce', '2022-03-02', 82),
(47, 'dictum. Phasellus', 'Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,', '2021-11-30', 65),
(48, 'ante lectus', 'ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non', '2021-09-26', 106),
(49, 'at, iaculis', 'lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis', '2021-11-22', 55),
(50, 'tellus. Phasellus', 'semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras', '2021-12-29', 55),
(51, 'porttitor eros', 'augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et', '2021-12-28', 133),
(52, 'nibh vulputate', 'mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', '2021-09-04', 74),
(53, 'nec tellus.', 'vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis', '2022-02-08', 137),
(54, 'Sed neque.', 'egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus', '2021-09-29', 137),
(55, 'consectetuer adipiscing', 'diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus', '2021-06-10', 107),
(56, 'Donec vitae', 'euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum', '2021-08-08', 117),
(57, 'laoreet lectus', 'fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel,', '2021-02-09', 31),
(58, 'ut ipsum', 'vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat', '2021-05-06', 54),
(59, 'Sed pharetra,', 'porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis', '2022-02-06', 13),
(60, 'hendrerit consectetuer,', 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque', '2021-02-12', 13),
(61, 'Aenean gravida', 'ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque', '2022-02-07', 24),
(62, 'posuere, enim', 'eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam', '2021-07-13', 146),
(63, 'tempor diam', 'urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam,', '2021-03-12', 57),
(64, 'Nam consequat', 'Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit', '2022-03-12', 109),
(65, 'a felis', 'libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper', '2021-05-20', 28),
(66, 'magna a', 'consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum', '2021-06-08', 8),
(67, 'dolor quam,', 'laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer', '2021-02-08', 36),
(68, 'ligula consectetuer', 'nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula', '2021-01-10', 1),
(69, 'massa. Quisque', 'dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat', '2021-08-19', 142),
(70, 'ornare, elit', 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.', '2021-10-24', 33),
(71, 'quis urna.', 'Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a', '2022-01-02', 102),
(72, 'amet, dapibus', 'mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.', '2021-01-23', 94),
(73, 'convallis, ante', 'felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In', '2021-03-05', 142),
(74, 'lacus. Aliquam', 'luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu,', '2021-06-19', 39),
(75, 'Phasellus at', 'at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet', '2021-05-07', 35),
(76, 'orci. Ut', 'fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et', '2021-02-21', 28),
(77, 'luctus sit', 'nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede', '2022-01-23', 85),
(78, 'Cras lorem', 'non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum', '2022-02-08', 46),
(79, 'dui quis', 'aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris', '2021-03-08', 89),
(80, 'sodales purus,', 'eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi', '2021-12-17', 84),
(81, 'fringilla purus', 'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum', '2021-07-12', 148),
(82, 'mattis velit', 'gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis', '2021-05-21', 114),
(83, 'accumsan interdum', 'risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a,', '2021-01-11', 74),
(84, 'interdum. Nunc', 'quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim', '2021-07-13', 34),
(85, 'ut, sem.', 'Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer', '2021-09-11', 15),
(86, 'leo. Morbi', 'et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis', '2021-08-12', 69),
(87, 'Nunc pulvinar', 'consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor', '2021-09-05', 100),
(88, 'a, facilisis', 'et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo', '2021-05-20', 67),
(89, 'Mauris vestibulum,', 'orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum', '2021-08-20', 19),
(90, 'Curae Phasellus', 'erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar', '2021-10-25', 136),
(91, 'dictum. Proin', 'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula.', '2022-01-27', 22),
(92, 'ac sem', 'Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi', '2021-10-25', 109),
(93, 'consectetuer mauris', 'velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu', '2021-08-09', 8),
(94, 'erat volutpat.', 'Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et', '2021-11-29', 50),
(95, 'dictum augue', 'semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.', '2021-10-15', 74),
(96, 'egestas blandit.', 'pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi.', '2021-10-26', 83),
(97, 'aliquet. Proin', 'ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel', '2022-03-01', 18),
(98, 'semper, dui', 'scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,', '2021-07-14', 64),
(99, 'non, feugiat', 'nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae', '2021-06-27', 133),
(100, 'Morbi accumsan', 'aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est.', '2021-08-07', 25),
(101, 'magna, malesuada', 'ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut', '2022-01-14', 72),
(102, 'hymenaeos. Mauris', 'nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim.', '2021-04-20', 131),
(103, 'lacus. Ut', 'Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio.', '2021-09-16', 45),
(104, 'eu tellus', 'elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.', '2021-07-25', 120),
(105, 'diam at', 'nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,', '2021-10-30', 36),
(106, 'nec, eleifend', 'Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna', '2021-07-06', 124),
(107, 'malesuada vel,', 'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,', '2021-05-11', 147),
(108, 'eu sem.', 'eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.', '2021-06-02', 55),
(109, 'aliquet vel,', 'in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis', '2021-10-16', 60),
(110, 'elementum purus,', 'magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque,', '2021-07-16', 138),
(111, 'elit, pellentesque', 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu', '2021-11-03', 95),
(112, 'lectus. Cum', 'tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.', '2021-06-14', 147),
(113, 'nibh. Phasellus', 'vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec', '2021-08-06', 42),
(114, 'Nulla semper', 'scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,', '2021-07-29', 3),
(115, 'vulputate dui,', 'imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.', '2021-01-31', 59),
(116, 'non arcu.', 'fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae', '2021-01-12', 90),
(117, 'non dui', 'mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam', '2021-05-22', 99),
(118, 'vel pede', 'dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam', '2022-01-19', 106),
(119, 'nec orci.', 'nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla', '2021-11-21', 76),
(120, 'id, mollis', 'semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras', '2021-12-10', 65),
(121, 'amet diam', 'mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', '2021-08-15', 13),
(122, 'dolor sit', 'iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique', '2021-05-05', 18),
(123, 'ac nulla.', 'Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed', '2021-03-20', 97),
(124, 'ornare, facilisis', 'Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac', '2021-03-27', 83),
(125, 'Nunc sollicitudin', 'cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non', '2021-12-09', 132),
(132, 'ssssss', 'ss <br>', '2022-04-16', 152),
(133, 'feee', ' jeee', '2022-04-16', 152),
(134, '1', '1', '2022-04-16', 152),
(135, 'Meu ', '<div align=\\\"\\\\\"\\\\\\\\\"\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"center\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\"\\\\\\\\\"\\\\\"\\\"> <span style=\\\"\\\\\"\\\\\\\\\"background-color:\\\\\"\\\" rgb(255,=\\\"\\\\\"\\\\\"\\\" 204,=\\\"\\\\\"\\\\\"\\\" 153);\\\\\\\\\\\\\\\"=\\\"\\\\\"\\\\\"\\\"><font size=\\\"\\\\\"\\\\\\\\\"\\\\\\\\\\\\\\\\\"7\\\\\\\\\\\\\\\\\"\\\\\\\\\"\\\\\"\\\"><b>aaaaaaaaaaaa<span style=\\\"background-color: rgb(153, 153, 0);\\\">aaaaaaaaaaaaaaaa</span><span style=\\\"\\\\\"background-color:\\\" rgb(255,=\\\"\\\" 204,=\\\"\\\" 0);\\\\\\\"=\\\"\\\"><span style=\\\"background-color: rgb(153, 153, 0);\\\">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>aa</span></b></font></span><br></div>', '2022-04-16', 152),
(136, 'oi', '<font color=\"#ff6600\"><u>oi</u></font>', '2022-04-16', 152),
(137, '123fdddddfv', '123jdd', '2022-04-16', 152),
(138, '741', '52222<span style=\"background-color: rgb(255, 0, 0);\">222<span style=\"\\&quot;background-color:\" rgb(255,=\"\" 255,=\"\" 102);\\\"=\"\">2</span><u>2</u></span>', '2022-04-16', 152),
(139, 'asd', 'asd', '2022-04-18', 152),
(141, 'Listinha de compras do mês', '<ol><li><div align=\"center\">arroz</div></li><li><font color=\"#ff9900\">Feijão</font></li><li><span style=\"background-color: rgb(255, 255, 102);\">Café</span><br></li></ol>', '2022-04-30', 152),
(142, 'compras', '<div align=\"center\"><b>Comprar hoje:</b></div><ul><li><u>arroz;</u><i>feijão;</i></li></ul>', '2022-05-04', 166),
(143, 'fazer hoje', '<div align=\"left\"><ul><li><b>arrumar minha cama;</b></li></ul></div><ul><li><i>fazer</i> <u>almoço;</u></li></ul>', '2022-05-04', 166),
(150, 'Meu primeiro bloco', '<div align=\"center\"><u><i><b>Oi pessoal!</b></i></u><br></div>', '2022-05-05', 167),
(151, 'Meu dia', 'Hoje o dia foi lindo', '2022-05-09', 165),
(152, 'Meu dia a dia', '<div style=\"text-align: center;\">MEU DIA</div><div style=\"text-align: left;\">OI PES</div>', '2022-05-10', 168),
(153, 'Meu ', '<div style=\"text-align: left;\"><font color=\"#ff0000\"><u>oi pessoal</u></font></div>', '2022-05-10', 168),
(154, '2', '22', '2022-05-14', 152);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE `tb_paciente` (
  `cd_paciente` int(11) NOT NULL,
  `nm_paciente` varchar(90) DEFAULT NULL,
  `nm_senha` varchar(99) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `cd_estagio` int(11) DEFAULT NULL,
  `cd_genero` int(11) DEFAULT 5,
  `ds_resumo` varchar(250) DEFAULT 'oi pessoal!'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_paciente`
--

INSERT INTO `tb_paciente` (`cd_paciente`, `nm_paciente`, `nm_senha`, `dt_nascimento`, `cd_estagio`, `cd_genero`, `ds_resumo`) VALUES
(1, 'Samuel Horn', 'XCO28RGC7HO', '1978-05-03', 3, 2, 'oi pessoal!'),
(2, 'Adria Glenn', 'NUV73XIU4QA', '1975-10-11', 2, 1, 'oi pessoal!'),
(3, 'Stacy Compton', 'LLR89ITH8RB', '1987-08-12', 1, 2, 'oi pessoal!'),
(4, 'Jelani Mayo', 'MHI38BKG4HC', '1979-10-21', 2, 2, 'oi pessoal!'),
(5, 'Wyoming Daugherty', 'EWF46SIE2FC', '1970-09-30', 2, 1, 'oi pessoal!'),
(6, 'Valentine Burch', 'WMT74NUE6GT', '1985-03-09', 2, 2, 'oi pessoal!'),
(7, 'Natalie Conner', 'GHG36RCP4FL', '1993-02-18', 2, 2, 'oi pessoal!'),
(8, 'Avye Parsons', 'QOO86WTJ4BO', '1972-09-13', 2, 2, 'oi pessoal!'),
(9, 'Hilel Underwood', 'TND61PMQ4QD', '1958-04-04', 3, 2, 'oi pessoal!'),
(10, 'Kirby Lawrence', 'EUX05QHO7DB', '1979-05-29', 2, 2, 'oi pessoal!'),
(11, 'Azalia Wheeler', 'DNX72UFG7LM', '1969-05-28', 3, 1, 'oi pessoal!'),
(12, 'Alfonso Goodwin', 'XUZ81YQL5XW', '1970-11-06', 3, 1, 'oi pessoal!'),
(13, 'Michael Alvarez', 'YHF41XKV4JV', '1989-10-14', 3, 1, 'oi pessoal!'),
(14, 'Solomon O\'connor', 'FPW78QBJ8HU', '1974-11-30', 2, 1, 'oi pessoal!'),
(15, 'Fuller Graves', 'JDY91MEE6UW', '1984-03-24', 3, 1, 'oi pessoal!'),
(16, 'Ivan Kelley', 'YHH32GBG0FK', '1985-01-11', 3, 1, 'oi pessoal!'),
(17, 'Fay Huber', 'YDB77ZPJ5XY', '1977-06-02', 2, 2, 'oi pessoal!'),
(18, 'Halla Kidd', 'JLQ87TZQ6HN', '1989-11-08', 1, 1, 'oi pessoal!'),
(19, 'Arthur Parrish', 'IKU54SNJ8PX', '1989-09-20', 1, 1, 'oi pessoal!'),
(20, 'Leigh Valencia', 'TOO10EWH4LI', '1990-05-21', 2, 1, 'oi pessoal!'),
(21, 'Isadora Rodriguez', 'RMO33ABP8TR', '1957-12-31', 2, 1, 'oi pessoal!'),
(22, 'Isaiah Jones', 'QVC67YEM8VH', '1971-11-21', 2, 2, 'oi pessoal!'),
(23, 'Angela Chase', 'QHP83LFZ0MB', '1971-10-06', 1, 2, 'oi pessoal!'),
(24, 'Whilemina Petersen', 'LEF72JWO4CU', '1966-06-04', 2, 2, 'oi pessoal!'),
(25, 'Amena Davis', 'GYP36KXQ5FU', '1989-01-12', 3, 2, 'oi pessoal!'),
(26, 'Blythe Walsh', 'JPV79QVA3XJ', '1970-05-18', 2, 2, 'oi pessoal!'),
(27, 'Kennan Lawrence', 'JLZ84KJF1CP', '1952-05-30', 2, 3, 'oi pessoal!'),
(28, 'Olga Camacho', 'WRC56IHC2KO', '1963-10-23', 2, 3, 'oi pessoal!'),
(29, 'Karen Tyson', 'DDV68VRJ0BE', '1952-05-09', 1, 1, 'oi pessoal!'),
(30, 'Gareth Crane', 'FPF13PZR1PE', '1972-03-25', 2, 2, 'oi pessoal!'),
(31, 'Paki Swanson', 'BRB25AGQ4AL', '1950-05-18', 1, 2, 'oi pessoal!'),
(32, 'Graham Doyle', 'QGB38XPL5QD', '1982-01-31', 2, 4, 'oi pessoal!'),
(33, 'Eagan Jensen', 'UKF82RYT3AK', '1971-08-25', 2, 5, 'oi pessoal!'),
(34, 'Emerson Mcdaniel', 'BOM85FKJ0JX', '1962-05-07', 3, 5, 'oi pessoal!'),
(35, 'Nolan Cobb', 'RHU49ELI5RU', '1952-03-29', 2, 5, 'oi pessoal!'),
(36, 'Chandler Pugh', 'LPQ86QRB1NH', '1992-04-18', 1, 5, 'oi pessoal!'),
(37, 'Kevin England', 'PZY15NEE1ZD', '1961-10-08', 2, 5, 'oi pessoal!'),
(38, 'Elijah Reilly', 'QHT72JFO6JO', '1978-01-26', 3, 5, 'oi pessoal!'),
(39, 'Dustin Strong', 'WHP53OWD6VF', '1952-07-25', 1, 5, 'oi pessoal!'),
(40, 'Carter Tillman', 'WLB21EOQ3EB', '1962-07-01', 2, 2, 'oi pessoal!'),
(41, 'Kyla Gallagher', 'ZTV13KYM1YP', '1984-05-26', 1, 1, 'oi pessoal!'),
(42, 'Mona Burt', 'URP51WYV1IX', '1963-12-22', 2, 5, 'oi pessoal!'),
(43, 'Kaseem Hunter', 'OLN02GYP7YF', '1970-10-15', 3, 5, 'oi pessoal!'),
(44, 'Melyssa Walters', 'PQV38AXI1TW', '1977-07-04', 3, 5, 'oi pessoal!'),
(45, 'Stewart House', 'LGE72KIJ3RU', '1961-01-30', 3, 2, 'oi pessoal!'),
(46, 'David Deleon', 'JJN28ITH6SR', '1958-08-30', 2, 2, 'oi pessoal!'),
(47, 'Isadora Cooper', 'MHR11FWB5OB', '1972-08-27', 2, 1, 'oi pessoal!'),
(48, 'Lila Valdez', 'OHY07OXH7XN', '1985-07-30', 2, 2, 'oi pessoal!'),
(49, 'Desirae Rose', 'ILC08INW3TH', '1982-04-26', 3, 3, 'oi pessoal!'),
(50, 'Elvis Emerson', 'QPS04RFG2CF', '1975-09-16', 3, 2, 'oi pessoal!'),
(51, 'Jana Huffman', 'NMD04UOT3II', '1977-05-27', 1, 5, 'oi pessoal!'),
(52, 'Kelsey Peterson', 'DUC47JOT2DE', '1967-11-13', 3, 2, 'oi pessoal!'),
(53, 'Rae Moran', 'SAY73IWJ0XL', '1970-09-07', 1, 2, 'oi pessoal!'),
(54, 'Quamar Buchanan', 'ZBX38PSM0YL', '1950-05-21', 2, 2, 'oi pessoal!'),
(55, 'Bradley Calderon', 'VYL68FCC3BK', '1958-04-14', 1, 2, 'oi pessoal!'),
(56, 'Lila Tanner', 'BXK63SBW5CO', '1975-11-08', 3, 2, 'oi pessoal!'),
(57, 'Sybil Hoover', 'ZLU03WUB5ST', '1978-01-05', 1, 1, 'oi pessoal!'),
(58, 'Vance Sanders', 'RSO14RBU9LK', '1956-04-15', 1, 1, 'oi pessoal!'),
(59, 'Noelani Manning', 'UOT43NNF5NA', '1993-06-14', 3, 1, 'oi pessoal!'),
(60, 'Brody Richmond', 'SEX76WWT6KG', '1984-10-16', 2, 1, 'oi pessoal!'),
(61, 'Cody Kidd', 'TGC87QUU2KB', '1968-04-05', 2, 1, 'oi pessoal!'),
(62, 'Juliet Soto', 'NIJ43OOO2SF', '1974-06-25', 1, 2, 'oi pessoal!'),
(63, 'Alice Flynn', 'UYQ27PEU7VB', '1984-09-01', 3, 3, 'oi pessoal!'),
(64, 'Eve Garza', 'HTB71WGF4BN', '1980-12-24', 1, 4, 'oi pessoal!'),
(65, 'Finn Larsen', 'FFP05FKJ8CP', '1984-06-07', 2, 4, 'oi pessoal!'),
(66, 'Jacqueline Atkinson', 'JON24VVB2HT', '1954-12-15', 2, 4, 'oi pessoal!'),
(67, 'Christian Perkins', 'MNW78STT3RH', '1977-08-17', 2, 4, 'oi pessoal!'),
(68, 'Diana Riggs', 'YTB80OLS5OI', '1965-04-23', 3, 4, 'oi pessoal!'),
(69, 'Jarrod Short', 'QBQ83WIL8LW', '1967-09-01', 2, 4, 'oi pessoal!'),
(70, 'Madaline Calhoun', 'EUI33UAQ2HA', '1974-05-04', 3, 5, 'oi pessoal!'),
(71, 'Chaim Stanley', 'YHH17VED7BX', '1969-08-28', 2, 2, 'oi pessoal!'),
(72, 'Maile Stone', 'QLH18KXI8BF', '1959-03-21', 2, 3, 'oi pessoal!'),
(73, 'Kareem Guzman', 'HWJ88WIQ0LO', '1991-10-05', 2, 5, 'oi pessoal!'),
(74, 'Hasad Cook', 'HOU71OZV4WG', '1955-10-30', 2, 5, 'oi pessoal!'),
(75, 'Clark Banks', 'FEK62EKP1XO', '1954-09-12', 2, 5, 'oi pessoal!'),
(76, 'Kimberley Tate', 'JFH66VMY3WL', '1969-01-13', 2, 5, 'oi pessoal!'),
(77, 'Bianca Ramos', 'ZTJ43VFA1HR', '1984-10-13', 2, 5, 'oi pessoal!'),
(78, 'Fritz Wong', 'XGO80SIP1EN', '1976-02-10', 3, 5, 'oi pessoal!'),
(79, 'Oliver Merrill', 'CDM38LAM2DC', '1970-12-16', 3, 5, 'oi pessoal!'),
(80, 'Carson Snow', 'HGG01FPF8YR', '1961-06-14', 2, 2, 'oi pessoal!'),
(81, 'Gannon Santos', 'COG11HDL4WQ', '1989-04-18', 2, 2, 'oi pessoal!'),
(82, 'Porter Craig', 'AKY18CXO3FR', '1970-01-20', 3, 2, 'oi pessoal!'),
(83, 'Nita Knight', 'RXV18JYN6JB', '1981-02-20', 2, 2, 'oi pessoal!'),
(84, 'Buckminster Shaw', 'LSW35QWW5LB', '1960-01-23', 2, 2, 'oi pessoal!'),
(85, 'Ciaran Ware', 'KZJ52THM3QF', '1979-01-04', 3, 1, 'oi pessoal!'),
(86, 'Mechelle Mercado', 'QVR14TQN7DW', '1992-06-26', 2, 1, 'oi pessoal!'),
(87, 'Aristotle Bishop', 'GJX42ONF2LH', '1980-09-08', 1, 2, 'oi pessoal!'),
(88, 'Yoshio Figueroa', 'AZY66QZX4TD', '1973-12-15', 2, 1, 'oi pessoal!'),
(89, 'Ann Ruiz', 'QNI61IMT3AW', '1958-08-01', 2, 3, 'oi pessoal!'),
(90, 'Coby Sullivan', 'KKV78UKU5JI', '1986-02-23', 1, 2, 'oi pessoal!'),
(91, 'Maryam Garner', 'QIS38NRP8SP', '1978-01-06', 1, 3, 'oi pessoal!'),
(92, 'Mary Franklin', 'NIG80AJN4JF', '1969-07-28', 2, 2, 'oi pessoal!'),
(93, 'Tanner Boyd', 'HCT15EFH3FT', '1960-08-17', 3, 1, 'oi pessoal!'),
(94, 'Edward Price', 'VVK30TNT6YX', '1958-08-03', 3, 5, 'oi pessoal!'),
(95, 'Inez Rowe', 'BQI20RQL1GW', '1964-12-08', 2, 5, 'oi pessoal!'),
(96, 'Gareth Cox', 'KDK75NDQ3BE', '1980-08-11', 1, 5, 'oi pessoal!'),
(97, 'Reed Henry', 'LPJ83WQD7MS', '1983-03-18', 2, 2, 'oi pessoal!'),
(98, 'Dacey Mercado', 'VLF69KOC8MJ', '1967-11-09', 2, 2, 'oi pessoal!'),
(99, 'Meredith Sosa', 'JGT68NWC4CU', '1953-11-30', 1, 3, 'oi pessoal!'),
(100, 'Louis Bird', 'DJZ54SDY3QR', '1952-02-16', 2, 2, 'oi pessoal!'),
(101, 'Christian Barber', 'RAW15YBL8RG', '1987-09-17', 3, 1, 'oi pessoal!'),
(102, 'Eagan Henderson', 'DQR86JEP4II', '1964-05-10', 1, 2, 'oi pessoal!'),
(103, 'Camilla Roach', 'ZOF40EVL8GR', '1973-10-22', 3, 3, 'oi pessoal!'),
(104, 'Clio Solis', 'IPN22TYY2UL', '1992-11-18', 3, 2, 'oi pessoal!'),
(105, 'Elton Curtis', 'LLD94YBC5UC', '1986-06-09', 2, 5, 'oi pessoal!'),
(106, 'Philip Bolton', 'BMV10WIE8FF', '1993-06-09', 2, 5, 'oi pessoal!'),
(107, 'Basil Young', 'MAF06TBU7ED', '1971-04-23', 2, 5, 'oi pessoal!'),
(108, 'Prescott Patton', 'EFN53GKM7CG', '1976-08-07', 2, 5, 'oi pessoal!'),
(109, 'Ali Hart', 'ITF52UPO3XE', '1967-06-17', 1, 2, 'oi pessoal!'),
(110, 'Galena Wall', 'NIV74CXG1YJ', '1982-09-07', 2, 2, 'oi pessoal!'),
(111, 'Travis Luna', 'EDC86LFX8VO', '1981-05-02', 2, 2, 'oi pessoal!'),
(112, 'Conan Savage', 'FIK46XEA2SL', '1962-01-08', 1, 3, 'oi pessoal!'),
(113, 'Jemima Cervantes', 'SBQ74FCR5SW', '1968-10-12', 1, 3, 'oi pessoal!'),
(114, 'Lisandra Stein', 'EBS46SXU2TX', '1953-05-15', 2, 3, 'oi pessoal!'),
(115, 'Shoshana Schneider', 'XTG29ZNS4PN', '1951-06-19', 3, 3, 'oi pessoal!'),
(116, 'Adria Banks', 'MMO82IVQ2IE', '1971-02-13', 2, 3, 'oi pessoal!'),
(117, 'Teagan Mathews', 'NJF48OLB2EN', '1983-01-01', 1, 2, 'oi pessoal!'),
(118, 'Kieran Harper', 'PQL22UEP3FP', '1980-01-10', 2, 1, 'oi pessoal!'),
(119, 'Shad Reyes', 'YQF42OML8PI', '1988-02-01', 2, 2, 'oi pessoal!'),
(120, 'Dustin Dennis', 'ADC83SNP1XM', '1974-05-30', 2, 2, 'oi pessoal!'),
(121, 'Brenden Green', 'RPD54ZCC6ST', '1955-06-23', 3, 2, 'oi pessoal!'),
(122, 'Mariam Frost', 'SQD96KKQ9NX', '1988-10-15', 2, 1, 'oi pessoal!'),
(123, 'Ronan Mcbride', 'DDX71RPJ6UR', '1958-08-18', 2, 1, 'oi pessoal!'),
(124, 'Leah Graves', 'XVA44KOY3ST', '1970-05-12', 2, 1, 'oi pessoal!'),
(125, 'Jordan Emerson', 'ICT66RDT1TS', '1969-03-17', 2, 1, 'oi pessoal!'),
(126, 'Rooney Barber', 'EFS45MMG4PQ', '1993-02-27', 3, 2, 'oi pessoal!'),
(127, 'Noel Mendoza', 'PFR73HOQ8ZC', '1973-03-15', 2, 4, 'oi pessoal!'),
(128, 'Emi Boyd', 'BUU38TMP3GK', '1954-01-01', 3, 1, 'oi pessoal!'),
(129, 'Miriam Robbins', 'LVJ34VPU7UG', '1981-06-05', 1, 4, 'oi pessoal!'),
(130, 'Frances Stokes', 'TAJ35USR1SS', '1954-09-13', 1, 4, 'oi pessoal!'),
(131, 'Dominic Gaines', 'YBK50WGC8EW', '1960-01-31', 2, 4, 'oi pessoal!'),
(132, 'Marah Strickland', 'ZXN45KBH6WR', '1962-12-19', 2, 4, 'oi pessoal!'),
(133, 'Lionel Slater', 'PXC87FHY6LH', '1978-05-19', 3, 3, 'oi pessoal!'),
(134, 'Helen Bush', 'CQM07LMF5ML', '1961-04-19', 3, 3, 'oi pessoal!'),
(135, 'Francesca Duran', 'XMI21CDC3CX', '1990-09-23', 2, 3, 'oi pessoal!'),
(136, 'Faith Saunders', 'XLW22KUH6JX', '1969-10-05', 3, 3, 'oi pessoal!'),
(137, 'Nelle Weber', 'BJH26PIH4TG', '1962-04-21', 3, 3, 'oi pessoal!'),
(138, 'Dane Ramsey', 'OXG67CYU3WP', '1990-07-05', 1, 1, 'oi pessoal!'),
(139, 'Candice Hernandez', 'NYT63WJD3WH', '1968-12-15', 2, 1, 'oi pessoal!'),
(140, 'Gareth Hobbs', 'UTS54IVS1CG', '1981-02-23', 3, 2, 'oi pessoal!'),
(141, 'Dai Pittman', 'OZV48QKR0FY', '1967-01-29', 3, 2, 'oi pessoal!'),
(142, 'Sydnee Byers', 'GIO25IZU3TB', '1979-07-30', 3, 2, 'oi pessoal!'),
(143, 'Callie Carter', 'NNL71VDU3UX', '1950-11-08', 1, 3, 'oi pessoal!'),
(144, 'Elliott Heath', 'SCO50VNT1EU', '1953-12-11', 3, 2, 'oi pessoal!'),
(145, 'Carly Jones', 'SNK48HPH8NI', '1950-12-02', 2, 1, 'oi pessoal!'),
(146, 'Plato Ramirez', 'HWY53FBU2FE', '1980-12-18', 2, 2, 'oi pessoal!'),
(147, 'Cherokee Lane', 'BSE79FWB6LH', '1963-05-16', 1, 5, 'oi pessoal!'),
(148, 'Alice Mills', 'CBJ48VDJ2II', '1973-08-16', 3, 5, 'oi pessoal!'),
(149, 'Graiden Mcguire', 'ESS75BLE4GM', '1971-02-12', 2, 5, 'oi pessoal!'),
(150, 'Clarke Watts', 'LUM72ROO3LD', '1975-11-23', 3, 5, 'oi pessoal!'),
(152, 'Daniel Alvarez de Almeida', '$2y$10$VU9FNOl/Zf.La35Ox7wuze5Ij2Y4yeRaMhVXsowXMTZUf6HicFqBC', '1989-11-22', 1, 1, 'oi gente! meu nome é Daniel...'),
(161, NULL, NULL, NULL, NULL, 5, 'oi pessoal!'),
(162, 'Gustavo Ferreria da Silva', '$2y$10$1Gzt/A1QI/3mI0SAnn8uuOzoU/xHr7OyAcDfuChdBQ65hYY3iDRdC', '1966-11-08', NULL, 1, 'asasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasasasasasasasasasaasa'),
(163, 'Gabreil Souza Ribeiro', '$2y$10$r9dTV3nN79Lw.Zg05n1Ytug.ZcmGFqHzg17RxeF1uiy.90vLKSOli', '1962-12-20', NULL, 5, 'oi pessoal!'),
(164, 'Yuri Afonso Pena', '$2y$10$cSGN9LkdgIDtMZq35YJaeu2JMeZ/S8Y9CrCRyOjbG2ndvY/dtYJO6', '1960-02-09', NULL, 5, 'oi pessoal!'),
(165, 'Kayle da Silva', '$2y$10$UmkKEQu3rbG8PWBbk/3K1.Pzjk23Bmqs4e31HN3R2my1X6wFtK4CO', '2022-04-15', NULL, 5, 'oi pessoal'),
(166, 'Luiz', '$2y$10$eY.UbNHUr98F1qvS/IvU8eDfHFf3qP3S/IlK5iMsopojFsOhsPMlC', '1972-05-02', NULL, 5, 'oi pessoal!'),
(167, 'Gabriel Augusto', '$2y$10$qYLXrlQYtBrsUunajtV.yOCal9qEcHisSrwhz/DjNGTlkVs6Y0pz2', '1970-05-05', NULL, 5, 'oi pessoal!'),
(168, 'Rafaela Alves da Silva', '$2y$10$D1bBjnkfocLWu5Gds9pLgO/g6FTb1t8jkac1qhWMf1olUXPpw1J1.', '1956-06-11', NULL, 2, 'oi pessoal!'),
(169, 'Sah', '$2y$10$IK6jekcrullX01kByOqnDegtpRWRcIOckWgBHB6dNIAN1wuVEt0FO', '1938-05-03', NULL, 5, 'oi pessoal!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_parentesco`
--

CREATE TABLE `tb_parentesco` (
  `cd_parentesco` int(11) NOT NULL,
  `nm_parentesco` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_parentesco`
--

INSERT INTO `tb_parentesco` (`cd_parentesco`, `nm_parentesco`) VALUES
(1, 'primo'),
(2, 'pai'),
(3, 'mãe'),
(4, 'filho'),
(5, 'tio'),
(6, 'esposa'),
(7, 'marido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_jogo`
--

CREATE TABLE `tb_tipo_jogo` (
  `cd_tipo_jogo` int(11) NOT NULL,
  `nm_tipo_jogo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_tipo_jogo`
--

INSERT INTO `tb_tipo_jogo` (`cd_tipo_jogo`, `nm_tipo_jogo`) VALUES
(1, 'memorização'),
(2, 'geografia'),
(3, 'aventura');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_avancado`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_avancado` (
`nome do familiar` varchar(90)
,`nome do paciente` varchar(90)
,`estagio` varchar(90)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_idade`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_idade` (
`nome do familiar` varchar(90)
,`idade do familiar` int(10)
,`nome do paciente` varchar(90)
,`idade do paciente` int(10)
,`pontuacao` int(6)
,`tipo de jogo` varchar(80)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mae`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mae` (
`nome do paciente` varchar(90)
,`estagio` varchar(90)
,`nome do familiar` varchar(90)
,`parentesco` varchar(90)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_memorizacao`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_memorizacao` (
`data da partida` date
,`nome do jogo` varchar(70)
,`tipo do jogo` varchar(80)
,`nome do paciente` varchar(90)
,`pontuação` int(6)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_notes_inverno`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_notes_inverno` (
`data de criação` date
,`nome do paciente` varchar(90)
,`estagio` varchar(90)
,`email` varchar(90)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_pontuacao15`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_pontuacao15` (
`nome do jogo` varchar(70)
,`nome do paciente` varchar(90)
,`pontuacao` int(6)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_pontuacao_intermediario`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_pontuacao_intermediario` (
`nome do paciente` varchar(90)
,`estagio` varchar(90)
,`pontuacao` int(6)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_verao`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_verao` (
`nome do paciente` varchar(90)
,`data` date
,`nome do familiar` varchar(90)
,`parentesco` varchar(90)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_avancado`
--
DROP TABLE IF EXISTS `vw_avancado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_avancado`  AS SELECT `tb_fam`.`nm_familiar` AS `nome do familiar`, `tb_pac`.`nm_paciente` AS `nome do paciente`, `tb_est`.`nm_estagio` AS `estagio` FROM ((`tb_familiar` `tb_fam` join `tb_paciente` `tb_pac` on(`tb_fam`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_estagio` `tb_est` on(`tb_pac`.`cd_estagio` = `tb_est`.`cd_estagio`)) WHERE `tb_est`.`nm_estagio` = 'avancado' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_idade`
--
DROP TABLE IF EXISTS `vw_idade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_idade`  AS SELECT `tb_fam`.`nm_familiar` AS `nome do familiar`, floor((to_days(current_timestamp()) - to_days(`tb_fam`.`dt_nascimento`)) / 365.25) AS `idade do familiar`, `tb_pac`.`nm_paciente` AS `nome do paciente`, floor((to_days(current_timestamp()) - to_days(`tb_pac`.`dt_nascimento`)) / 365.25) AS `idade do paciente`, `tb_pac_jogo`.`num_pontuacao` AS `pontuacao`, `tb_tipo_jogo`.`nm_tipo_jogo` AS `tipo de jogo` FROM (((`tb_familiar` `tb_fam` join `tb_paciente` `tb_pac` on(`tb_fam`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_jogo_paciente` `tb_pac_jogo` on(`tb_pac_jogo`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_tipo_jogo`) WHERE floor((to_days(current_timestamp()) - to_days(`tb_pac`.`dt_nascimento`)) / 365.25) > 60 AND `tb_pac_jogo`.`num_pontuacao` > 10 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mae`
--
DROP TABLE IF EXISTS `vw_mae`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mae`  AS SELECT `tb_pac`.`nm_paciente` AS `nome do paciente`, `tb_est`.`nm_estagio` AS `estagio`, `tb_fam`.`nm_familiar` AS `nome do familiar`, `tb_paren`.`nm_parentesco` AS `parentesco` FROM (((`tb_paciente` `tb_pac` join `tb_familiar` `tb_fam` on(`tb_fam`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_parentesco` `tb_paren` on(`tb_fam`.`cd_parentesco` = `tb_paren`.`cd_parentesco`)) join `tb_estagio` `tb_est` on(`tb_pac`.`cd_estagio` = `tb_est`.`cd_estagio`)) WHERE `tb_est`.`cd_estagio` = 1 AND `tb_paren`.`cd_parentesco` = 3 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_memorizacao`
--
DROP TABLE IF EXISTS `vw_memorizacao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_memorizacao`  AS SELECT `jpac`.`dt_partida` AS `data da partida`, `jog`.`nm_jogo` AS `nome do jogo`, `tipjog`.`nm_tipo_jogo` AS `tipo do jogo`, `pac`.`nm_paciente` AS `nome do paciente`, `jpac`.`num_pontuacao` AS `pontuação` FROM (((`tb_tipo_jogo` `tipjog` join `tb_jogos` `jog` on(`jog`.`cd_tipo_jogo` = `tipjog`.`cd_tipo_jogo`)) join `tb_jogo_paciente` `jpac` on(`jpac`.`cd_jogo` = `jog`.`cd_jogo`)) join `tb_paciente` `pac` on(`pac`.`cd_paciente` = `jpac`.`cd_paciente`)) WHERE `jpac`.`num_pontuacao` > 20 AND `tipjog`.`cd_tipo_jogo` = '1' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_notes_inverno`
--
DROP TABLE IF EXISTS `vw_notes_inverno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_notes_inverno`  AS SELECT `nt`.`dt_criacao` AS `data de criação`, `pac`.`nm_paciente` AS `nome do paciente`, `est`.`nm_estagio` AS `estagio`, `ctt`.`nm_email` AS `email` FROM (((`tb_notes` `nt` join `tb_paciente` `pac` on(`nt`.`cd_paciente` = `pac`.`cd_paciente`)) join `tb_estagio` `est` on(`pac`.`cd_estagio` = `est`.`cd_estagio`)) join `tb_contato` `ctt` on(`ctt`.`cd_paciente` = `pac`.`cd_paciente`)) WHERE `nt`.`dt_criacao` > '21-06-2021' AND `nt`.`dt_criacao` < '2021-09-22' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_pontuacao15`
--
DROP TABLE IF EXISTS `vw_pontuacao15`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pontuacao15`  AS SELECT `tb_jogos`.`nm_jogo` AS `nome do jogo`, `tb_pac`.`nm_paciente` AS `nome do paciente`, `tb_jogopac`.`num_pontuacao` AS `pontuacao` FROM ((`tb_jogo_paciente` `tb_jogopac` join `tb_paciente` `tb_pac` on(`tb_jogopac`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_jogos` on(`tb_jogos`.`cd_jogo` = `tb_jogopac`.`cd_jogo`)) WHERE `tb_jogopac`.`num_pontuacao` > 15 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_pontuacao_intermediario`
--
DROP TABLE IF EXISTS `vw_pontuacao_intermediario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pontuacao_intermediario`  AS SELECT DISTINCT `pac`.`nm_paciente` AS `nome do paciente`, `est`.`nm_estagio` AS `estagio`, `jogopac`.`num_pontuacao` AS `pontuacao` FROM ((`tb_paciente` `pac` join `tb_estagio` `est` on(`pac`.`cd_estagio` = `est`.`cd_estagio`)) join `tb_jogo_paciente` `jogopac` on(`jogopac`.`cd_paciente` = `pac`.`cd_paciente`)) WHERE `jogopac`.`num_pontuacao` > 10 AND `est`.`nm_estagio` = 'intermediario' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_verao`
--
DROP TABLE IF EXISTS `vw_verao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_verao`  AS SELECT `tb_pac`.`nm_paciente` AS `nome do paciente`, `tb_jogpac`.`dt_partida` AS `data`, `tb_fam`.`nm_familiar` AS `nome do familiar`, `tb_parentesco`.`nm_parentesco` AS `parentesco` FROM (((`tb_paciente` `tb_pac` join `tb_jogo_paciente` `tb_jogpac` on(`tb_jogpac`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_familiar` `tb_fam` on(`tb_fam`.`cd_paciente` = `tb_pac`.`cd_paciente`)) join `tb_parentesco` on(`tb_fam`.`cd_parentesco` = `tb_parentesco`.`cd_parentesco`)) WHERE `tb_jogpac`.`dt_partida` > '2021-12-21' AND `tb_jogpac`.`dt_partida` < '2022-03-20' ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD PRIMARY KEY (`cd_contato`),
  ADD KEY `fk_paciente_idx` (`cd_paciente`),
  ADD KEY `fk_fam_id_idx` (`cd_familiar`);

--
-- Índices para tabela `tb_estagio`
--
ALTER TABLE `tb_estagio`
  ADD PRIMARY KEY (`cd_estagio`);

--
-- Índices para tabela `tb_familiar`
--
ALTER TABLE `tb_familiar`
  ADD PRIMARY KEY (`cd_familiar`),
  ADD KEY `fk_parentesco_idx` (`cd_parentesco`),
  ADD KEY `fk_paciente_idx` (`cd_paciente`);

--
-- Índices para tabela `tb_galeria`
--
ALTER TABLE `tb_galeria`
  ADD PRIMARY KEY (`cd_galeria`),
  ADD KEY `fk_pac_galery` (`cd_paciente`);

--
-- Índices para tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  ADD PRIMARY KEY (`cd_genero`);

--
-- Índices para tabela `tb_jogos`
--
ALTER TABLE `tb_jogos`
  ADD PRIMARY KEY (`cd_jogo`),
  ADD KEY `tipoJogo` (`cd_tipo_jogo`);

--
-- Índices para tabela `tb_jogo_paciente`
--
ALTER TABLE `tb_jogo_paciente`
  ADD PRIMARY KEY (`cd_jogo_paciente`),
  ADD KEY `fk_paciente_idx` (`cd_paciente`),
  ADD KEY `fk_jogo_idx` (`cd_jogo`);

--
-- Índices para tabela `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD PRIMARY KEY (`cd_notes`),
  ADD KEY `fk_paciente` (`cd_paciente`);

--
-- Índices para tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD PRIMARY KEY (`cd_paciente`),
  ADD KEY `fk_estagio_idx` (`cd_estagio`),
  ADD KEY `tb_paciente_ibfk_1` (`cd_genero`);

--
-- Índices para tabela `tb_parentesco`
--
ALTER TABLE `tb_parentesco`
  ADD PRIMARY KEY (`cd_parentesco`);

--
-- Índices para tabela `tb_tipo_jogo`
--
ALTER TABLE `tb_tipo_jogo`
  ADD PRIMARY KEY (`cd_tipo_jogo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  MODIFY `cd_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT de tabela `tb_estagio`
--
ALTER TABLE `tb_estagio`
  MODIFY `cd_estagio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_familiar`
--
ALTER TABLE `tb_familiar`
  MODIFY `cd_familiar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de tabela `tb_galeria`
--
ALTER TABLE `tb_galeria`
  MODIFY `cd_galeria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  MODIFY `cd_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_jogos`
--
ALTER TABLE `tb_jogos`
  MODIFY `cd_jogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_jogo_paciente`
--
ALTER TABLE `tb_jogo_paciente`
  MODIFY `cd_jogo_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT de tabela `tb_notes`
--
ALTER TABLE `tb_notes`
  MODIFY `cd_notes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  MODIFY `cd_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de tabela `tb_parentesco`
--
ALTER TABLE `tb_parentesco`
  MODIFY `cd_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_tipo_jogo`
--
ALTER TABLE `tb_tipo_jogo`
  MODIFY `cd_tipo_jogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD CONSTRAINT `fk_fam_id` FOREIGN KEY (`cd_familiar`) REFERENCES `tb_familiar` (`cd_familiar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pac_id` FOREIGN KEY (`cd_paciente`) REFERENCES `tb_paciente` (`cd_paciente`);

--
-- Limitadores para a tabela `tb_familiar`
--
ALTER TABLE `tb_familiar`
  ADD CONSTRAINT `fk_parentesco` FOREIGN KEY (`cd_parentesco`) REFERENCES `tb_parentesco` (`cd_parentesco`);

--
-- Limitadores para a tabela `tb_galeria`
--
ALTER TABLE `tb_galeria`
  ADD CONSTRAINT `fk_pac_galery` FOREIGN KEY (`cd_paciente`) REFERENCES `tb_paciente` (`cd_paciente`);

--
-- Limitadores para a tabela `tb_jogos`
--
ALTER TABLE `tb_jogos`
  ADD CONSTRAINT `tipoJogo` FOREIGN KEY (`cd_tipo_jogo`) REFERENCES `tb_tipo_jogo` (`cd_tipo_jogo`);

--
-- Limitadores para a tabela `tb_jogo_paciente`
--
ALTER TABLE `tb_jogo_paciente`
  ADD CONSTRAINT `fk_jogo` FOREIGN KEY (`cd_jogo`) REFERENCES `tb_jogos` (`cd_jogo`),
  ADD CONSTRAINT `fk_pacient` FOREIGN KEY (`cd_paciente`) REFERENCES `tb_paciente` (`cd_paciente`);

--
-- Limitadores para a tabela `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`cd_paciente`) REFERENCES `tb_paciente` (`cd_paciente`);

--
-- Limitadores para a tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD CONSTRAINT `fk_estagio` FOREIGN KEY (`cd_estagio`) REFERENCES `tb_estagio` (`cd_estagio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_paciente_ibfk_1` FOREIGN KEY (`cd_genero`) REFERENCES `tb_genero` (`cd_genero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
