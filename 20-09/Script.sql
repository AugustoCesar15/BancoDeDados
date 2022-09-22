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

