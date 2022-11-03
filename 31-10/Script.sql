Create database Atividade101122;

use Atividade101122;

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

insert into Sprint values
	(1001, 2, '2022-10-21 14-30-00', '09.54'),
	(1000, 1, '2022-09-14 10-12-10', '10.00'),
	(1002, 3, '2022-08-17 12-45-45', '03.45');
    
    
select * from Grupo;
select * from Professor;
select * from Aluno;
select * from Sprint;


-- 4) Já feita no momento de criação das tables


