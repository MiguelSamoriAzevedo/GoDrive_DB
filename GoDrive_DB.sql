-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 11:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `locadora`
--

-- --------------------------------------------------------

--
-- Table structure for table `cidade`
--

CREATE TABLE `cidade` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `ESTADO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cidade`
--

INSERT INTO `cidade` (`ID`, `NOME`, `ESTADO_ID`) VALUES
(1, 'PARNAIBA', 1),
(2, 'SÃO PAULO', 3),
(3, 'RIBEIRÃO PRETO', 3),
(4, 'ILHEUS', 2),
(5, 'SÃO BERNARDO DO CAMPO', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cliente_fornecedor`
--

CREATE TABLE `cliente_fornecedor` (
  `ID` int(11) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  `NOME` varchar(45) NOT NULL,
  `CLIENTE_FORNECEDOR` char(1) NOT NULL,
  `DATA_NASC` date DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `CNH` char(15) DEFAULT NULL,
  `VALIDADE_CNH` date DEFAULT NULL,
  `TELEFONE` varchar(45) DEFAULT NULL,
  `ENDERECO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente_fornecedor`
--

INSERT INTO `cliente_fornecedor` (`ID`, `CPF`, `CNPJ`, `NOME`, `CLIENTE_FORNECEDOR`, `DATA_NASC`, `EMAIL`, `CNH`, `VALIDADE_CNH`, `TELEFONE`, `ENDERECO_ID`) VALUES
(1, '554927031-8', NULL, 'MIGUEL SAMORI', 'C', '1973-11-12', 'miguelsanzevedo@gmail.com', '23663697223123', '2024-12-12', '11994094400,', 2),
(2, NULL, '358900000107', 'OWLINES LTDA', 'C', NULL, 'admin@owlines.com.br', '112233445566789', '2025-06-05', '86999303251', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contrato`
--

CREATE TABLE `contrato` (
  `ID` int(11) NOT NULL,
  `DT_CONTRATO` date NOT NULL,
  `DT_RETIRADA` datetime NOT NULL,
  `DT_PREVISTA` datetime NOT NULL,
  `DT_DEVOLUCAO` datetime NOT NULL,
  `STATUS` char(1) NOT NULL,
  `TERMO_ACEITE` text NOT NULL,
  `CLIENTE_FORNCEDOR_ID` int(11) NOT NULL,
  `TRANSACAO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contrato`
--

INSERT INTO `contrato` (`ID`, `DT_CONTRATO`, `DT_RETIRADA`, `DT_PREVISTA`, `DT_DEVOLUCAO`, `STATUS`, `TERMO_ACEITE`, `CLIENTE_FORNCEDOR_ID`, `TRANSACAO_ID`) VALUES
(1, '2024-04-20', '2024-04-20 08:00:00', '2024-04-21 08:00:00', '2024-04-20 22:00:00', 'A', 'Lorem ipsum dolor sit amet', 2, 1),
(2, '2024-02-05', '2024-02-05 08:00:00', '2024-02-06 08:00:00', '2024-02-08 10:00:00', 'A', 'ACEITEI', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contrato_veiculos`
--

CREATE TABLE `contrato_veiculos` (
  `CONTRATO_ID` int(11) NOT NULL,
  `VEICULOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contrato_veiculos`
--

INSERT INTO `contrato_veiculos` (`CONTRATO_ID`, `VEICULOS_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `endereco`
--

CREATE TABLE `endereco` (
  `ID` int(11) NOT NULL,
  `LOGRADOURO` varchar(45) NOT NULL,
  `BAIRRO` varchar(45) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `TIPO_LOGRADOURO_ID` int(11) NOT NULL,
  `CIDADE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `endereco`
--

INSERT INTO `endereco` (`ID`, `LOGRADOURO`, `BAIRRO`, `NUMERO`, `TIPO_LOGRADOURO_ID`, `CIDADE_ID`) VALUES
(1, 'JAMES CLARK', 'SÃO BENEDITO', '1498', 1, 1),
(2, 'BRAGA', 'VILA LUZITANIA', '202', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `SIGLA` char(2) NOT NULL,
  `PAIS_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`ID`, `NOME`, `SIGLA`, `PAIS_ID`) VALUES
(1, 'PIAUI', 'PI', 1),
(2, 'BAHIA', 'BA', 1),
(3, 'SÃO PAULO', 'SP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `manutencao`
--

CREATE TABLE `manutencao` (
  `ID` int(11) NOT NULL,
  `TIPO` char(1) NOT NULL,
  `DT_MANUTENCAO` date NOT NULL,
  `DESCRICAO_SERV` varchar(50) NOT NULL,
  `CUSTO` float(5,2) NOT NULL,
  `CLIENTE_FORNCEDOR_ID` int(11) NOT NULL,
  `VEICULOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `SIGLA` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`id`, `NOME`, `SIGLA`) VALUES
(1, 'BRASIL', 'BRA'),
(2, 'ARGENTEINA', 'ARG'),
(3, 'PERU', 'PE');

-- --------------------------------------------------------

--
-- Table structure for table `plano_pgt`
--

CREATE TABLE `plano_pgt` (
  `ID` int(11) NOT NULL,
  `FORMA_PGT` char(1) NOT NULL,
  `PARCELAS` int(11) NOT NULL,
  `VALOR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plano_pgt`
--

INSERT INTO `plano_pgt` (`ID`, `FORMA_PGT`, `PARCELAS`, `VALOR`) VALUES
(1, 'P', 1, 500),
(2, 'B', 2, 500),
(3, 'C', 5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_logradouro`
--

CREATE TABLE `tipo_logradouro` (
  `ID` int(11) NOT NULL,
  `DESCRICAO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_logradouro`
--

INSERT INTO `tipo_logradouro` (`ID`, `DESCRICAO`) VALUES
(1, 'RUA'),
(2, 'AVENIDA');

-- --------------------------------------------------------

--
-- Table structure for table `transacao`
--

CREATE TABLE `transacao` (
  `ID` int(11) NOT NULL,
  `DT_PG` date NOT NULL,
  `VALOR_PAGO` float(5,2) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `MULTAS` float DEFAULT NULL,
  `DESCONTOS` float DEFAULT NULL,
  `PLANO_PGT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transacao`
--

INSERT INTO `transacao` (`ID`, `DT_PG`, `VALOR_PAGO`, `STATUS`, `MULTAS`, `DESCONTOS`, `PLANO_PGT_ID`) VALUES
(1, '2024-10-10', 500.00, 'B', NULL, NULL, 2),
(2, '2024-07-22', 0.00, 'E', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `veiculos`
--

CREATE TABLE `veiculos` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(45) NOT NULL,
  `TIPO_VEICULO` varchar(45) NOT NULL,
  `ESPECIE` varchar(45) NOT NULL,
  `PLACA` varchar(45) NOT NULL,
  `COR` varchar(45) NOT NULL,
  `KM` int(11) NOT NULL,
  `TIPO_COMBUST` char(1) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `DT_AQUISICAO` date NOT NULL,
  `CATEGORIA` varchar(45) NOT NULL,
  `MODELO` varchar(45) NOT NULL,
  `CHASSI` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `veiculos`
--

INSERT INTO `veiculos` (`ID`, `MARCA`, `TIPO_VEICULO`, `ESPECIE`, `PLACA`, `COR`, `KM`, `TIPO_COMBUST`, `STATUS`, `DT_AQUISICAO`, `CATEGORIA`, `MODELO`, `CHASSI`) VALUES
(1, 'RENAOUT', 'AUTOMÓVEL', 'PASSAGEIRO', 'EFF6298', 'PRATA', 18000, 'F', 'I', '2020-12-18', 'RET', 'KWID', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ESTADO` (`ESTADO_ID`);

--
-- Indexes for table `cliente_fornecedor`
--
ALTER TABLE `cliente_fornecedor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CLIENTE_FORNECEDOR` (`CLIENTE_FORNCEDOR_ID`),
  ADD KEY `FK_TRANSACAO` (`TRANSACAO_ID`);

--
-- Indexes for table `contrato_veiculos`
--
ALTER TABLE `contrato_veiculos`
  ADD PRIMARY KEY (`CONTRATO_ID`,`VEICULOS_ID`),
  ADD KEY `FK_CONTRATOS_VEICULOS_VEICULOS` (`VEICULOS_ID`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CIDADE` (`CIDADE_ID`),
  ADD KEY `FK_TIPO_LOGRADOURO` (`TIPO_LOGRADOURO_ID`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PAIS` (`PAIS_ID`);

--
-- Indexes for table `manutencao`
--
ALTER TABLE `manutencao`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CLIENTE_FORNCEDOR` (`CLIENTE_FORNCEDOR_ID`),
  ADD KEY `FK_VEICULOS` (`VEICULOS_ID`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plano_pgt`
--
ALTER TABLE `plano_pgt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tipo_logradouro`
--
ALTER TABLE `tipo_logradouro`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transacao`
--
ALTER TABLE `transacao`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PLANO_PGT` (`PLANO_PGT_ID`);

--
-- Indexes for table `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cliente_fornecedor`
--
ALTER TABLE `cliente_fornecedor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manutencao`
--
ALTER TABLE `manutencao`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plano_pgt`
--
ALTER TABLE `plano_pgt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_logradouro`
--
ALTER TABLE `tipo_logradouro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transacao`
--
ALTER TABLE `transacao`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `FK_ESTADO` FOREIGN KEY (`ESTADO_ID`) REFERENCES `estado` (`ID`);

--
-- Constraints for table `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `FK_CLIENTE_FORNECEDOR` FOREIGN KEY (`CLIENTE_FORNCEDOR_ID`) REFERENCES `cliente_fornecedor` (`ID`),
  ADD CONSTRAINT `FK_TRANSACAO` FOREIGN KEY (`TRANSACAO_ID`) REFERENCES `transacao` (`ID`);

--
-- Constraints for table `contrato_veiculos`
--
ALTER TABLE `contrato_veiculos`
  ADD CONSTRAINT `FK_CONTRATOS_VEICULOS_CONTRATO` FOREIGN KEY (`CONTRATO_ID`) REFERENCES `contrato` (`ID`),
  ADD CONSTRAINT `FK_CONTRATOS_VEICULOS_VEICULOS` FOREIGN KEY (`VEICULOS_ID`) REFERENCES `veiculos` (`ID`);

--
-- Constraints for table `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `FK_CIDADE` FOREIGN KEY (`CIDADE_ID`) REFERENCES `cidade` (`ID`),
  ADD CONSTRAINT `FK_TIPO_LOGRADOURO` FOREIGN KEY (`TIPO_LOGRADOURO_ID`) REFERENCES `tipo_logradouro` (`ID`);

--
-- Constraints for table `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `FK_PAIS` FOREIGN KEY (`PAIS_ID`) REFERENCES `pais` (`id`);

--
-- Constraints for table `manutencao`
--
ALTER TABLE `manutencao`
  ADD CONSTRAINT `FK_CLIENTE_FORNCEDOR` FOREIGN KEY (`CLIENTE_FORNCEDOR_ID`) REFERENCES `cliente_fornecedor` (`ID`),
  ADD CONSTRAINT `FK_VEICULOS` FOREIGN KEY (`VEICULOS_ID`) REFERENCES `veiculos` (`ID`);

--
-- Constraints for table `transacao`
--
ALTER TABLE `transacao`
  ADD CONSTRAINT `FK_PLANO_PGT` FOREIGN KEY (`PLANO_PGT_ID`) REFERENCES `plano_pgt` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
