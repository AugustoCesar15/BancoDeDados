create database venda;

use venda;

create table Cliente(
	idCliente int primary key auto_increment,
    Nome varchar(45),
    Email varchar(45)
);

create table Indicado (
	idIndicado int auto_increment,
    fkCliente int,
    foreign key(fkCliente) references Cliente(idCliente),
    Nome varchar(45),
    Email varchar(45),
    primary key(idIndicado, fkCliente)
);

Create table Endereco (
	idEndereco int primary key auto_increment,
    CEP char(9),
    Logradouro varchar (45),
    Bairro varchar(45),
    Cidade varchar(45),
	Estado varchar(45)
);

create table enderecoCliente (
	fkEndereco int,
    foreign key (fkEndereco) references endereco(idEndereco),
    fkCliente int,
    foreign key (fkCliente)references Cliente(idCliente),
    Numero int,
    Complemento varchar(45),
    primary key (fkEndereco, fkCliente)
);

create table Venda (
	idVenda int primary key auto_increment,
    Total int,
    DataHora datetime,
    fkCliente int,
    foreign key(fkCliente)references Cliente(idCliente)
);

create table produto (
	idProduto int primary key auto_increment,
    Nome varchar(45),
    Descricao varchar(45),
    Preco decimal(5,2)
);

create table VendaProdutos (
	fkVenda int,
    foreign key(fkVenda) references Venda(idVenda),
    fkProduto int,
    foreign key(fkProduto) references Produto(idProduto),
    Quantidade int,
    Desconto Decimal(5,2)
);

-- Inserindo Dados nas tabelas criadas acima

insert into Cliente values
	(null, 'Augusto César', 'augusto.costa@sptech.school'),
	(null, 'Larissa Vieira', 'lari.vieira11@gmail.com'),
	(null, 'Ana Beatriz', 'ana.costa@gmail.com');

insert into Indicado values
	(null, 1, 'Erik Ferreira', 'erikinho@sptech.school'),
	(null, 1, 'Kátia Paranhos', 'katiakatia@gmail.com'),
	(null, 2, 'Rud', 'ruderval@gmail.com'),
	(null, 2, 'Vanda', 'vandaLinda@gmail.com'),
	(null, 3, 'Rebeka', 'rebeka@gmail.com'),
	(null, 3, 'Ohana', 'ohanaa@gmail.com');
    
insert into endereco values 
	(null, '03525-160', 'Rua Rolarite', 'Jardim Maringá', 'São Paulo', 'SP'),
	(null, '09872-130', 'Rua da Mais Linda', 'Mulher Virtuosa', 'Quem a Achará', 'BH'),
	(null, '08211-121', 'Rua Preta', 'Curver City', 'Los Angels', 'CA');
    
insert into enderecoCliente values
	(1, 1, 37, null),
	(2, 2, 314, 'Ao lado de uma merceara'),
	(3, 3, 29, 'Próximo ao Cinema');
    
insert into Venda values 
	(null, 2913, '2022-8-31 23-45-22', 1),
	(null, 2911, '2022-10-09 20-30-12', 1),
	(null, 3045, '2022-01-11 15-30-15', 2),
	(null, null, '2022-09-10', 2),
	(null, 29, '2022-09-02', 3),
	(null, 129, '2022-10-02', 3);
    
insert into Produto values
	(null, 'Livro', 'Conteúdo para leitura', '123.45'),
	(null, 'Camiseta', 'Para vestir', '23.99'),
	(null, 'Marmita', 'Para comer', '12.50'),
	(null, 'Notebooks', 'Para programar', '37.99');
    
insert into VendaProdutos values
	(1, 1, 35, '10.00'),
	(2, 1, 45, '12.05'),
	(3, 2, 90, '20.00'),
	(4, 3, 30, '5.00'),
	(5, 4, 3000, '50.00'),
	(6, 3, 3210, '15.00');
    
    
    
-- Exibir todos os dados de cada tabela criada, separadamente.
select * from Cliente;
select * from Indicado;
select * from Endereco;
select * from enderecoCliente;
select * from Venda;
select * from Produto;
select * from VendaProdutos;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
-- das tabelas.
 
 -- R: Já feitos durante a criaçao das tabelas
 
 
 -- Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from Cliente join Venda on idCliente = fkCliente;

--  Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
-- e os dados de suas respectivas vendas.

select * from Cliente join Venda on idCliente = fkCliente where Cliente.nome = 'Augusto César';


--  Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from Cliente join Indicado on idCliente = fkCliente;

-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta).
select * from Cliente join Indicado on idCliente = fkCliente where Cliente.idCliente = 2;

alter table Venda rename column fkCliente to fkClientes;
-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos.
select * from Cliente join indicado on fkCliente = idCliente
					join Venda on fkClientes = idCliente
					join VendaProdutos on fkVenda = idVenda
                    join Produto on fkProduto = idProduto;








