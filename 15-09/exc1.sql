use faculdade1adsc;

create table Cliente (
	idCliente int primary key auto_increment,
	nome varchar(45),
	telFixo char(10),
	telCel char(11),
    endereco varchar(60)
);

create table Pet (
	idPet int primary key auto_increment,
    tipo varchar(40),
	nome varchar(45),
	raca varchar(45),
	dtNasc date,
    fkCliente int,
    foreign key (fkCliente) references Cliente (idCliente)
)auto_increment=101;

-- - Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente,
-- e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
-- menos 2 clientes diferentes que tenham o mesmo sobrenome.

insert into Cliente (nome, telFixo, telCel, endereco) values
	('Augusto César', '1123074379', '12992176259', 'Rua Rolarite, 37'),
	('Cleber Rocha',  '2390192019', '19998361839', 'Av. Paraná, 1.456'),
	('César Rocha',   '1123456789', '12345678990', 'Rua Osvaldo Valle, 137');

insert into Pet (nome, tipo, raca, dtNasc, fkCliente) values 
	('Rex', 'Cachorro', 'Vira-Lata', '2018-01-26', 1),
	('Nemo', 'Peixe', 'Palhaço', '2020-01-15', 1),
	('Splinter', 'Rato', 'Twister', '2022-01-13', 2),
	('Petter', 'Gato', 'Egipicio', '2022-04-30', 3);
    
    
    -- Exibir todos os dados de cada tabela criada, separadamente.
    select * from Cliente;
    select * from Pet;
    
    -- Fazer os acertos da chave estrangeira, caso não tenha feito no momento dacriação.
    -- Feito na criação!
    
    -- - Altere o tamanho da coluna nome do cliente.
    alter table Cliente modify column nome varchar (50);
    
	-- - Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from Pet where tipo = 'Rato';

-- - Exibir apenas os nomes e as datas de nascimento dos pets.
select nome, dtNasc from Pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
select * from Pet order by nome;


-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.

-- (obs: Não fiz a tabela com bairro diretamente, vou adicionar agora)

alter table Cliente add column bairro varchar(45);

update Cliente set bairro = 'Jardim Maringá' where idCliente = 1;
update Cliente set bairro = 'Broonklin' where idCliente = 2;
update Cliente set bairro = 'Lo Angeles' where idCliente = 3;

select * from Cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from Pet where nome like 'r%';


-- - Exibir os dados dos clientes que têm o mesmo sobrenome.
 select * from Cliente where nome like '% rocha';
 
 -- Alterar o telefone de um determinado cliente.
 update Cliente set telFixo = '1278624534' where idCliente = 1;
 
 -- Exibir os dados dos clientes para verificar se alterou.
select * from Cliente;

-- - Exibir os dados dos pets e dos seus respectivos donos
select * from Cliente join Pet on idCliente = fkCliente;


-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from Cliente join Pet on idCliente = fkCliente where idCliente = 1;

--  Excluir algum pet
delete from Pet where idPet = 103;

-- Exibir os dados dos pets para verificar se excluiu.
select * from Pet;

-- - Excluir as tabelas.
drop table Cliente, Pet;







