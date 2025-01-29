-- Criar banco 
create database ecommerce;
use ecommerce;


-- criar tabelas

create table PARCEIRO_NEGOCIOS (
		PAR_Mat int auto_increment primary key,
		PAR_Descricao varchar(50) not null,
        PAR_IdentificacaoFiscal varchar(14) not null,
        PAR_Tipo boolean,
        constraint unique_IF_PAR unique (PAR_IdentificacaoFiscal)
);


create table ENDERECO (
		END_Mat int auto_increment primary key,
        END_Descricao varchar(50) not null, 
        END_PARMat int,
        constraint PARMat foreign key (END_PARMat) references PARCEIRO_NEGOCIOS (PAR_Mat)
);

create table COND_PAGAMENTO (
		CON_Mat int auto_increment primary key,
        CON_Entrada varchar(2),
        CON_Porcentagem float,
        CON_MesInicio varchar(2)
);

create table PRODUTO (
		PRO_Mat int auto_increment primary key,
        PRO_Descricao varchar(45) not null,
        PRO_Tipo varchar(10),
        PRO_Vendedor int not null,
        PRO_Fabricante int,
        constraint PARMat foreign key (PRO_Vendedor) references PARCEIRO_NEGOCIOS (PAR_Mat)
);

create table PEDIDO (
        PED_Mat int,
        PED_Linha int,
        PED_ValorUnitario float,
        PED_Quantidade varchar(10),
        PED_Frete Float,
        PED_Status boolean default 0,
        PED_CONMat int,
        PED_PARMat int,
        PED_Item int,
        primary key (PED_Mat, PED_Linha),  -- Chave primária composta
        constraint ConMat foreign key (PED_CONMat) references COND_PAGAMENTO (CON_Mat),
        constraint PedMat foreign key (PED_PARMat) references PARCEIRO_NEGOCIOS (PAR_Mat),
        constraint ProMat foreign key (PED_Item) references PRODUTO (PRO_Mat)
);

create table ENTREGA (
		ENT_Mat int auto_increment primary key,
        ENT_Status varchar(1) default 1,
        ENT_Rastreio varchar(10),
        PEDIDO_Mat int,
        ENDERECO_Mat int,
        constraint PedMat foreign key (PEDIDO_Mat) references PEDIDO (PED_Mat),
        constraint EndMat foreign key (ENDERECO_Mat) references ENDERECO (END_Mat)
);

create table ESTOQUE (
		EST_Mat int auto_increment primary key,
        EST_Descricao varchar(45),
        EST_Posicao varchar(10),
        EST_PRDMat int,
        EST_Quantidade varchar(10) not null,
        constraint PrdMat foreign key (EST_PRDMat) references ESTOQUE (EST_Mat)
);

create table CATALOGO (
		CAT_Mat int auto_increment primary key,
        CAT_PARMat int,
        CAT_PROMat int, 
        CAT_Quantidade varchar(10) not null,
        constraint ParMat foreign key (CAT_PARMat) references PARCEIRO_NEGOCIOS (PAR_Mat),
        constraint ProMat foreign key (CAT_PROMat) references PRODUTO (PRO_Mat)
);

desc ecommerce;

show databases;

show tables;

INSERT INTO PARCEIRO_NEGOCIOS (PAR_Descricao, PAR_IdentificacaoFiscal, PAR_Tipo) VALUES 
('Lojas SSA', '12345678000195', true),   
('Fornecedor 44', '98765432000185', false), 
('Supermercado', '27836489000112', true), 
('Restaurante ovvo', '35781533000110', true), 
('METAIS METAIS', '76234567000189', true), 
('João Limão', '12345678909', false), 
('Luiz Limão', '23456789012', false), 
('Lucas Almeida', '34567890123', false), 
('Indústria Beta', '45678901234567', true), 
('Distribuidora', '56789012345678', false); 

INSERT INTO ENDERECO (END_Descricao, END_PARMat) VALUES  
('Rua das Flores, 123, Centro, São Paulo, SP', 1),  
('Avenida Central, 456, Zona Industrial, Rio de Janeiro, RJ', 2),  
('Rua das Palmeiras, 789, Bairro Verde, Belo Horizonte, MG', 3), 
('Rua da Paz, 102, Vila Nova, Porto Alegre, RS', 4), 
('Avenida Paulista, 1000, Bela Vista, São Paulo, SP', 5),  
('Avenida Rio Branco, 200, Centro, Rio de Janeiro, RJ', 6), 
('Rua do Sol, 250, Jardim das Flores, Salvador, BA', 7),  
('Rua do Ouro, 356, Bairro São João, Recife, PE', 8), 
('Avenida Brasil, 1234, Centro Comercial, São Paulo, SP', 9), 
('Rua das Acácias, 432, Bairro Santa Rita, Fortaleza, CE', 10);

-- Listar todos os endereços
SELECT * FROM ENDERECOS;

-- Visualizar parceiros de negócios e seus respectivos endereços 
SELECT T1.PAR_Mat, T1. Descicao, T2.END_Descricao FROM PARCEIRO_NEGOCIOS T1
INNER JOIN ENDERECOS T2 ON  T1.PAR_Mat = T2.END_PARMat;

-- listar todos os fornecedores localizados em São Paulo
SELECT T1.PAR_Mat, T1. Descricao, T2.END_Descricao FROM PARCEIRO_NEGOCIOS T1
INNER JOIN ENDERECOS T2 ON  T1.PAR_Mat = T2.END_PARMat 
WHERE T2.END_Descricao LIKE '%São Paulo%';

INSERT INTO COND_PAGAMENTO (CON_Entrada, CON_Porcentagem, CON_MesInicio) VALUES
('10', 30.0, '01'),  -- Entrada de 10% e o pagamento inicia no mês 1
('20', 50.0, '02'),  -- Entrada de 20% e o pagamento inicia no mês 2
('15', 40.0, '03'),  -- Entrada de 15% e o pagamento inicia no mês 3
('30', 60.0, '04'),  -- Entrada de 30% e o pagamento inicia no mês 4
('25', 70.0, '05');  -- Entrada de 25% e o pagamento inicia no mês 5

INSERT INTO PRODUTO (PRO_Descricao, PRO_Tipo, PRO_Vendedor, PRO_Fabricante) VALUES 
('Smartphone XYZ Pro', 'Eletrônicos', 1, 2),
('Camiseta Masculina Estampada', 'Roupas', 1, 3),
('Cadeira Escritório Ergonômica', 'Móveis', 2, 4),
('Mouse Óptico Gamer', 'Eletrônicos', 2, 5),
('Tênis Running Adidas', 'Calçados', 3, 6),
('Bolsa Feminina de Couro', 'Acessórios', 3, 7),
('Geladeira Inox 500L', 'Eletrodomésticos', 4, 8),
('Notebook Dell Inspiron', 'Eletrônicos', 4, 9),
('Cafeteira Elétrica', 'Eletrodomésticos', 5, 10),
('Fritadeira Elétrica', 'Eletrodomésticos', 5, 11),
('Cadeira Gamer Racing', 'Móveis', 6, 12),
('Relógio de Pulso Digital', 'Acessórios', 6, 13),
('Ventilador de Torre', 'Eletrodomésticos', 7, 14),
('Batedeira Planetária', 'Eletrodomésticos', 7, 15),
('Mesa de Jantar de Vidro', 'Móveis', 8, 16),
('Poltrona Reclinável', 'Móveis', 8, 17),
('Câmera Fotográfica Canon', 'Eletrônicos', 9, 18),
('Impressora Multifuncional', 'Eletrônicos', 9, 19),
('Sofá 3 Lugares', 'Móveis', 10, 20),
('Mesa de Escritório', 'Móveis', 10, 21);


-- Listar todos os produtos e seus respectivos fabricantes e vendedores
SELECT T1.PRO_Descricao, T1.PRO_Tipo, T2.PAR_Descricao AS Vendedor, T2.PAR_Descricao AS Fabricante FROM PRODUTOS T1 
INNER JOIN PARCEIRO_NEGOCIOS T2 ON T2.PAR_Mat = T1.PRO_Vendedor
INNER JOIN PARCEIRO_NEGOCIOS T3 ON T3.PAR_Mat = T1.PRO_Vendedor;

INSERT INTO PEDIDO (PED_Mat, PED_Linha, PED_ValorUnitario, PED_Quantidade, PED_Frete, PED_Status, PED_CONMat, PED_PARMat, PED_Item) VALUES 
(1,	'2', 250.0, 15.0, '1.8',0, 1, 1, 1),
(1,	'1', 54.0, 10.0, '5.0',0, 2, 1, 2),
(2,	'3', 65.0, 20.0, '0',1, 3, 2, 3),
(3,	'5', 130.0, 25.0, '4.4',0, 4, 3, 4),
(3,	'2', 76.0, 12.0, '2,1',0, 5, 3, 5),
(4, '4', 5.0, 18.0, '10.5',1, 6, 4, 6),
(5, '6', 430.0, 30.0, '9.9',0, 7, 5, 7);

-- Listar todos os pedidos, sua condição de pagamento, status traduzido e o item pedido.  
SELECT PED_Mat, CON_Descricao, 
	case when PED_Status = 0 then 'ENVIANDO' 
		 when PED_Status = 1 then 'RECEBIDO'
         END AS 'STATUS'
,PRO_Descricao FROM PEDIDO T1
INNER JOIN COND_PAGAMENTO T2 ON T1.PED_CONMat = T2.CON_Mat
INNER JOIN PRODUTO T3 ON T1.PED_Item = T3.PRO_Mat;

-- Listar valor total de um pedido somando as linhas.
SELECT PED_Mat, SUM(Valor) AS 'Valor Total' FROM PEDIDO T2
INNER JOIN (SELECT PED_Mat, PED_Linha, SUM(T1.ValorUnitario*T1.PED_Quantidade) 'Valor', PED_Frete FROM PEDIDO T1) AS A ON A.PED_Mat = T2.PED_Mat
GROUP BY PED_Mat;

INSERT INTO ENTREGA (ENT_Status, ENT_Rastreio, PEDIDO_Mat, ENDERECO_Mat) VALUES
(0, 'RSTR123456', 1, 1),
(1, 'RSTR234567', 2, 2),
(0, 'RSTR345678', 3, 3),
(1, 'RSTR456789', 4, 4),
(0, 'RSTR567890', 5, 5);

-- Listar entregas e seu status traduzido 
SELECT ENT_Rastreio, 	
		 case when PED_Status = 0 then 'ENVIANDO' 
		 when PED_Status = 1 then 'RECEBIDO'
         END AS 'STATUS' FROM ENTREGAS T1
ORDER BY PED_Status;



INSERT INTO ESTOQUE (EST_Descricao, EST_Posicao, EST_Quantidade, EST_PRDMat) VALUES
('Depósito A - Seção 1', 'A1', '50', 1),
('Depósito B - Seção 2', 'B2', '100', 2),
('Depósito C - Seção 3', 'C3', '25', 3),
('Depósito D - Seção 4', 'D4', '60', 4),
('Depósito E - Seção 5', 'E5', '150', 5),
('Depósito F - Seção 6', 'F6', '80', 6),
('Depósito G - Seção 7', 'G7', '20', 7),
('Depósito H - Seção 8', 'H8', '30', 8),
('Depósito I - Seção 9', 'I9', '40', 9),
('Depósito J - Seção 10', 'J10', '35', 10);

INSERT INTO CATALOGO (CAT_PARMat, CAT_PROMat, CAT_Quantidade) VALUES
(1, 1, '50'),
(1, 2, '100'),
(2, 3, '25'),
(2, 4, '60'),
(3, 5, '150'),
(3, 6, '80'),
(4, 7, '20'),
(4, 8, '30'),
(5, 9, '40'),
(5, 10, '35'),
(6, 11, '15'),
(6, 12, '90'),
(7, 13, '45'),
(7, 14, '60'),
(8, 15, '25'),
(8, 16, '50'),
(9, 17, '30'),
(9, 18, '70'),
(10, 19, '10'),
(10, 20, '50');

-- Listar quais fornecedores tem determinado produto 

SELECT T2.PAR_Descricao, T1.CAT_Quantidade FROM CATALOGO T1
INNER JOIN PARCEIRO_NEGOCIOS T2 ON T2.PAR_Mat = T1.CAR_PARMat 
GROUP BY T2.PAR_Descricao
HAVING CAT_PROMat = 7;
