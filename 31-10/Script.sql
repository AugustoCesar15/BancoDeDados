Create database Atividade011122;

use Atividade011122;

create table Grupo(
	idGrupo int primary key auto_increment,
    Nome varchar(45),
    DescricaoProjeto varchar(70)
);

insert into Grupo values
	(null, 'DataCenter', 'Monitoramento de temperatura e umidade'),
	(null, 'Coffee', 'Monitoramento de temperatura e umidade em plantações de café'),
	(null, 'Campos de Fut', 'Monitoramento de temperatura e umidade em campos de futbol');

create table aluno(
	Ra char(8) primary key,
    fkGrupo int,
    foreign key (fkGrupo)references Grupo(idGrupo),
    Nome varchar(45),
    Email varchar(45)   
);

insert into Aluno values
	('01222007', 2, 'Augusto Lindo', 'augustoLidno@gmail.com'),
	('01222008', 2, 'Larissa Vieira', 'lari@gmail.com'),
	('01222009', 2, 'Bia', 'anabeatriz@gmail.com'),
	('01222010', 1, 'Michael', 'mike@gmail.com'),
	('01222011', 1, 'Daniel Mendonça', 'danielMeme@gmail.com'),
	('01222012', 3, 'Deivid', 'deividSanches@gmail.com'),
	('01222013', 3, 'Ap Paulo', 'romanos8.1@gmail.com'),
	('01222014', 3, 'Ap Joao', 'joao1.1@gmail.com');

create table Professor (
	idProfessor int primary key auto_increment,
    Nome varchar(45),
    Disciplina varchar(45)
)auto_increment= 1000;

insert into Professor values
	(null, 'Caramico', 'Desquisa e Inocação'),
	(null, 'Brandão', 'P.i'),
	(null, 'Lethicia', 'Inglês');

create table Sprint(
	fkProfessor int,
    fkGrupo int,
    DataHota datetime,
    Nota decimal(4,2),
    foreign key(fkProfessor) references Professor(idProfessor),
    foreign key (fkGrupo) references Grupo(idGrupo)
);

alter table Sprint rename column DataHota to DataHora;

insert into Sprint values
	(1001, 2, '2022-10-21 14-30-00', '09.54'),
	(1000, 1, '2022-09-14 10-12-10', '10.00'),
	(1002, 3, '2022-08-17 12-45-45', '03.45');
    
    
select * from Grupo;
select * from Professor;
select * from Aluno;
select * from Sprint;


-- 4) Já feita no momento de criação das tables

-- 5) Exibir os dados dos grupos e os dados de seus respectivos alunos.

select * from grupo join aluno on idGrupo = fkGrupo;


-- 6) Exibir os dados de um determinado grupo e os dados de seus respectivos alunos
select * from grupo join aluno on idGrupo = fkGrupo where idGrupo = 1;

-- 7) Atribuir a média das notas atribuídas aos grupos, no geral
select avg(nota) from Sprint;

-- 8) Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral
select min(Nota) as Mínima, max(Nota) as Máxima from Sprint;

-- 9) Exibir a soma das notas dadas aos grupos, no geral
select sum(Nota) from Sprint;

-- 10) Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação
select p.*, s.DataHora, g.* from Professor as p join Sprint as s on idProfessor = fkProfessor join Grupo as g on idGrupo = fkGrupo;

-- 11) Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação
select p.*, s.DataHora, g.* from Professor as p join Sprint as s on idProfessor = fkProfessor join Grupo as g on idGrupo = fkGrupo where idGrupo = 2;

-- 12) Exibir os nomes dos grupos que foram avaliados por um determinado professor
select g.Nome, p.*, s.fkProfessor from Grupo as g join Sprint as s on idGrupo = fkGrupo join Professor as p on idProfessor = fkProfessor where idProfessor = 1002;

-- 13)
alter table Sprint rename column fkGrupo to fkGrup;
select g.*, s.DataHora, a.*, p.* from Grupo as g join Aluno as a on idGrupo = fkGrupo
	join Sprint as s on idGrupo = fkGrup join Professor as p on fkProfessor = idProfessor;
    
-- 14)
select count(distinct(Nota)) from Sprint;

-- 15)
select p.Nome, avg(Nota), sum(nota) from Professor as p join Sprint on idProfessor = fkProfessor group by idProfessor;

-- OBS: Adicionando mais uma avaliação para algum professor, pois estavam somente com uma cada um, 
-- então tecnicamente não teria "SOMA" das notas de um determinado professor

insert into Sprint values 
	(1000, 1, '2022-05-05 19-09-00', '05.80');
    
-- 16)
select g.Nome, avg(Nota) as Média, sum(Nota) as Soma from Grupo as g join Sprint on idGrupo = fkGrup group by idGrupo;

-- 17)
select p.Nome, min(Nota) as Mínima, max(Nota) as Máxima from Professor as p join Sprint on idProfessor = fkProfessor group by idProfessor;

-- 18)
select g.Nome, min(Nota) as Mínima, max(Nota) as Máxima from Grupo as g join Sprint on idGrupo = fkGrup group by idGrupo;
