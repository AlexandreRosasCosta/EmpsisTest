SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/* Criando o banco */
CREATE DATABASE empsis;
USE empsis;

/* Tabela endereço */
CREATE TABLE `endereco` (
  `cpf` varchar(11) NOT NULL,
  `cep` int(11) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `numero` int(11) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `pais` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `endereco`
  ADD PRIMARY KEY (`cep`),
  ADD KEY `fk_cliente` (`cpf`);

/* Tabela Cliente */
CREATE TABLE `cliente` (
  `nome` varchar(60) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `data_nascimento` date NOT NULL,
  `status` tinyint NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);
COMMIT;

/* Adicionando a FK em endereço */
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`);
COMMIT;
