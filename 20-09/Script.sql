create database atividade2009;

use atividade2009;

create table projeto(
	idProj int primary key auto_increment,
    nome varchar(45),
    descricao varchar(100)
);

CREATE TABLE Aluno (
ra char(8) primary key,
nome varchar(45),
tel varchar(12),
fkRep char(8),
constraint fkRepresenteante foreign key (fkRep)
	references aluno(ra)
);

alter table aluno add column fkProj int;
alter table aluno add constraint fkProjeto foreign key (fkProj) references Projeto (idProj);

CREATE TABLE Acompanhante (
idAcomp int,
fkAluno char(8), 
foreign key (fkAluno) references aluno(ra),
primary key (idAcomp, fkAluno),
nome varchar(45),
relacao varchar(45)
);

-- - Inserir dados nas tabelas.

insert into projeto (nome, descricao) values
	('Pentateuco', 'Estudo dos 5 primeiros livros da biblía'),
	('Profetas', 'Estudo dos 12 profetas, maiores e menores'),
	('Igreja Primitiva', 'Estudos da primeira igreja, que teve seu inicío em 33 d.C'),
	('Escatologia', 'Estudo dos fins do tempo segundo a biblía');
    
insert into Aluno values
	('01222007', 'Augusto César', '12992176259', null, 3),
	('01222008', 'Larissa Vieira', '11931232822', '01222007', 3),
	('01222201', 'Deivid Maria', '11998762517', '01222007', 1),
	('01222009', 'Dominic Toretto', '5011182729', '01222007', 2),
	('01222010', 'Luke Hobbs', '5011827192', '01222007', 4),
	('01222011', 'Brian O.Conner', '50192812018', '01222008', 4),
	('01222012', 'Gisele Harabo', '50192821246', '01222008', 4),
	('01222013', 'Han Lue', '50129271629', '01222008', 1),
	('01222014', 'Mia Toretto', '501289739271', '01222008', 1),
	('01222015', 'Santos', '50199922117', '01222008', 2);

insert into Acompanhante values
	(1,'01222007', 'Kátia', 'Mãe'),
	(1, '01222008', 'Rud', 'Pai'),
	(1, '01222009', 'Dodge Challenge', 'Carro'),
	(1, '01222012','Fulano', 'Tio'),
	(1, '01222011', 'Beltrano', 'Pai'),
	(2, '01222007', 'Bia', 'Irmã'),
	(2, '01222008', 'Kátia', 'Sogra');

-- Exibir todos os dados de cada tabela criada, separadamente

select * from projeto;
select * from aluno;
select * from acompanhante;

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
-- JÁ FEITOS!

select * from aluno join projeto on fkProj = idProj;


-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from aluno join acompanhante on fkAluno = ra;


-- Exibir os dados dos alunos e dos seus representantes
select  al.nome as Alunos, 
		r.nome as Representante
	from aluno as al
		 join aluno as r
			on al.fkRep = r.ra;
            
            
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
-- de um determinado projeto (indicar o nome do projeto na consulta).

select * from aluno join projeto on fkProj = idProj where projeto.nome = 'Igreja Primitiva';  		 


-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes

select * from acompanhante join aluno on fkAluno = ra join projeto on fkProj = idProj;


-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
-- --------------------------- A T I V I D A D E 2 -------------------------------------------------
-- -------------------------------------------------------------------------------------------------

-- Criar um banco de dados chamado Campanha.
create database Campanha;

-- Selecionar esse banco de dados.
use Campanha;

-- Criar as tabelas correspondentes à sua modelagem.
create table organizador (
	idO int primary key auto_increment,
    nome varchar(45),
    enderecoRua varchar(45),
    enderecoBairro varchar(45),
    email varchar(45),
    fkEx int,
    constraint fkExperiente foreign key(fkEx) references organizador(idO)
)auto_increment=30;

select * from organizador;

create table campanha (
	idC int primary key auto_increment,
    categoria varchar(45),
    instituicao varchar(45),
    dtFinal date,
    fkO int,
    constraint fkOrientador foreign key (fkO) references organizador (idO)
)auto_increment=500;


-- Inserir dados nas tabelas, de forma que exista mais de uma campanha para
-- algum organizador, e mais de um organizador novato sendo orientado por algum
-- organizador mais experiente.

insert into organizador (nome, enderecoRua, enderecoBairro, email) values 
	('Augusto César', 'Rua Rolarite, 37', 'Jardim Maringá', 'augusto@gmail.com'),
	('Larissa Vieira', 'Rua Augusto César, 15', 'Coração', 'lary@gmail.com'),
	('Deivid Maria', 'Rua Esquisito, 112', 'Manaco', 'maria.deivid@gmail.com'),
	('Vitória Souza', 'Rua Xilindró, 34', 'Xadres', 'vitorinhasouzinha@gmail.com'),
	('Joaão Pedro', 'Rua Haddock Lobo, 595', 'Centro', 'joaozinho@gmail.com'),
	('Amanda Ambar', 'Rua Xerox, 40', 'Cartolandia', 'amanbar@gmail.com');
    

insert into campanha (categoria, instituicao, dtFinal, fkO) values
	('Covaid', 'Augustos', '2022-01-15', 42),
	('Covid 18', 'Césars', '2022-01-13', 43),
	('Fora Covid', 'Testes', '2022-03-30', 42),
	('Vírus', 'VirusLand', '2021-05-10', 45);
        
    --  Exibir todos os dados de cada tabela criada, separadamente
	select * from organizador;
    select * from campanha;
    
    -- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
    
    update organizador set fkEx = 43 where idO = 42;
    update organizador set fkEx = 42 where idO = 43;
    update organizador set fkEx = 43 where idO = 44;
    update organizador set fkEx = 42 where idO = 45;
    update organizador set fkEx = 43 where idO = 46;
    update organizador set fkEx = 42 where idO = 47;
    
    
-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
    select * from organizador join campanha on fkO = idO;
    
-- Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
	SELECT 
    *
FROM
    organizador
        JOIN
    campanha ON fkO = idO
WHERE
    idO = 42;
    
-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT 
    n.*, 
    e.nome AS Experiente
FROM
    organizador AS n
        JOIN
    organizador AS e 
    ON n.fkEx = e.idO;
    
    
-- Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores, porém somente de um determinado organizador
-- orientador (informar o nome do organizador orientador na consulta)
SELECT 
    n.*, e.nome AS Experiente
FROM
    organizador AS n
        JOIN
    organizador AS e ON n.fkEx = e.idO
WHERE
    n.fkEx = 42;
    
-- Exibir os dados dos organizadores novatos, os dados das respectivas
-- campanhas organizadas e os dados dos respectivos organizadores orientadores.
	select n.*, e.nome as Orientador, c.* from organizador as n join organizador as e on n.fkEx = e.idO join campanha as c on c.fkO = n.idO;
    
-- Exibir os dados de um organizador novato (informar o seu nome na consulta),
-- os dados das respectivas campanhas em que trabalha e os dados do seu
-- organizador orientador.

select n.*, e.nome as Orientador, c.* from organizador as n join organizador as e on n.fkEx = e.idO join campanha as c on c.fkO = n.idO where n.nome = 'Larissa Vieira';
    



