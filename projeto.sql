--
-- Database: `hawk`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE IF NOT EXISTS `avaliacao` (
	`cod_avaliacao` int(10) NOT NULL AUTO_INCREMENT,
	`cpf_cliente` int(13) NOT NULL,
	`cpf_entregador` int(13) NOT NULL,
	`cnpj` varchar(30) NOT NULL,
	PRIMARY KEY (cod_avaliacao),
	-- CONSTRAINT pk_avaliacao PRIMARY KEY (cpf_cliente, cpf_entregador, cnpj),
	FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
	FOREIGN KEY (cpf_entregador) REFERENCES entregador(cpf_entregador)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bar`
--

CREATE TABLE IF NOT EXISTS `bar` (
	`cnpj` varchar(30) NOT NULL,
	`nome`varchar(50) NOT NULL,
	PRIMARY KEY (cnpj),
	UNIQUE (cnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bebida`
--

CREATE TABLE IF NOT EXISTS `bebida` (
	`cod_produto` int(4) NOT NULL AUTO_INCREMENT,
	`nome`varchar(20) NOT NULL,
	`quantidade` int(4) NOT NULL DEFAULT 0,
	`tipo` varchar(20) NOT NULL,
	PRIMARY KEY (cod_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
	`cpf_cliente` int(15) NOT NULL,
	`nome` varchar(50) NOT NULL,
	`telefone` int(11) NOT NULL,
	PRIMARY KEY (cpf_cliente),
	UNIQUE (cpf_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cod_produto`
--

CREATE TABLE IF NOT EXISTS `cod_produto` (
	`cod_produto` int(4) NOT NULL AUTO_INCREMENT,
	`nome`varchar(20) NOT NULL,
	`tipo` varchar(20) NOT NULL,
	PRIMARY KEY (cod_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE IF NOT EXISTS `entregador` (
	`cpf_entregador` int(13) NOT NULL,
	`nome`varchar(50) NOT NULL,
	`placa`varchar(30) NOT NULL,
	PRIMARY KEY (cpf_entregador),
	UNIQUE (cpf_entregador, placa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE IF NOT EXISTS `item` (
	`cod_item` int(4) NOT NULL AUTO_INCREMENT,
	`cod_produto` int(4) NOT NULL,
	`quantidade` int(3) NOT NULL DEFAULT 1,
	PRIMARY KEY (cod_item)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
	`cod_pedido` int(5) NOT NULL AUTO_INCREMENT,
	`cpf_cliente` int(13) NOT NULL,
	`valor_total` int(3) NOT NULL DEFAULT 0,
	`cpf_entregador` int(13) NOT NULL,
	`forma_pagamento` varchar(10) NOT NULL,
	PRIMARY KEY (cod_pedido),
	FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
	FOREIGN KEY (cpf_entregador) REFERENCES entregador(cpf_entregador)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_item`
--

CREATE TABLE IF NOT EXISTS `pedido_item` (
	`cod_pedido` int(5) NOT NULL,
	`cod_item` int(4) NOT NULL,
	`quantidade` int(3) NOT NULL DEFAULT 1,
	PRIMARY KEY (cod_pedido, cod_item),
	FOREIGN KEY (cod_pedido) REFERENCES pedido(cod_pedido),
	FOREIGN KEY (cod_item) REFERENCES item(cod_item)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
	`cod_produto` int(4) NOT NULL,
	`cnpj` varchar(30) NOT NULL,
	`preco` float(3,2) NOT NULL,
	PRIMARY KEY (cod_produto, cnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Preenchimento de dados: Clientes
--

INSERT INTO `cliente`(`cpf_cliente`, `nome`, `telefone`)
VALUES (06738573014, "Joana Teixeira", 81988884444), (08134086012, "Bruno Braga", 81988887777),
(96399294096, "Rafael Montes", 81988881111), (26755536032, "Manuela Luz", 81988882222), (82374920054, "Beatriz Santos", 81988883333),
(45136287071, "Marcilio Almeida", 81988889999), (64253999026, "Jaqueline Braz", 81988885555), (57476701070, "Antonio Cunha", 81988886666);

-- --------------------------------------------------------

--
-- Preenchimento de dados: Bares
--

INSERT INTO `bar`(`cnpj`, `nome`) VALUES (61361780000190, "Barzao"), (61361787854960, "Boteco Romeira"),
(61356987412001, "Restaurante Caetano"), (61361412369890, "Braza Comedoria"), (61367841239190, "Bar Recanto");

-- --------------------------------------------------------

--
-- Preenchimento de dados: Entregadores
--

INSERT INTO `entregador`(`cpf_entregador`, `nome`, `placa`) VALUES (57486901070, "Mario Cuba", "GSD8956"),
(57456391070, "Carla Vasconselos", "GSD8956"), (545369801070, "Heitor Eduardo", "TRK2536"), (57486452136, "Diana Marinho", "LAP4719"),
(57436121070, "Fabio Tiano", "ERT2873"), (57412589070, "Laiane Foz", "FKL2854"), (42106901070, "Dario Triz", "PLM6912");

-- --------------------------------------------------------

--
-- Preenchimento de dados: Bebidas
--

INSERT INTO `bebida`(`nome`, `quantidade`, `tipo`)
VALUES ('agua mineral', 250, 'mineral'),
	('skol', 320, 'cerveja'),
	('brahma', 280, 'cerveja'),
	('itaipava', 450, 'cerveja'),
	('coca-cola', 240, 'refrigerante'),
	('fanta', 150, 'refrigerante'),
	('tampico', 80, 'suco');


-- --------------------------------------------------------

--
-- Preenchimento de dados: 
--
