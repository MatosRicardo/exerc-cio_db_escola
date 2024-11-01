create database db_Escola;
use db_Escola;

create table Aluno (
	pk_id_aluno int auto_increment primary key,
    nome_do_aluno varchar(50) not null,
    data_nasc_aluno date,
    telefone_aluno char(12),
    mae_do_aluno varchar(50),
    cpf_aluno char(12),
    endereco_aluno varchar(50)
);

insert into Aluno
(nome_do_aluno, data_nasc_aluno, telefone_aluno, mae_do_aluno,	cpf_aluno, endereco_aluno) 
values	
('Ricardo Ribeiro De Matos', '2002-02-08', '123456789100', 'Maria', '40022233352', 'rua paralelepiedo, 50'),
('Renan Ribeiro De Matos', '2005-11-15', '123456789100', 'Maria', '40022233352', 'rua paralelepiedo, 50'),
('Navarim Lucca', '2002-02-08', '123456789100', 'Fernanda', '40022233352', 'rua paralelepiedo, 50'),
('Laurencio da silva sauro junior', '2002-02-08', '123456789100', 'Luana', '40022233352', 'rua paralelepiedo, 50'),
('Clarencio Roberto', '2002-02-08', '123456789100', 'Ana', '40022233352', 'rua paralelepiedo, 50'),
('Florentino Perez', '2002-02-08', '123456789100', 'Juliana', '40022233352', 'rua paralelepiedo, 50'),
('Antonio Fagundes', '2002-02-08', '123456789100', 'Bianca', '40022233352', 'rua paralelepiedo, 50'),
('Luan Santana', '2002-02-08', '123456789100', 'Bruna', '40022233352', 'rua paralelepiedo, 50'),
('Gustavo lima e voce', '2002-02-08', '123456789100', 'Joana', '40022233352', 'rua paralelepiedo, 50'),
('Herbert Richard', '2002-02-08', '123456789100', 'Amanda', '40022233352', 'rua paralelepiedo, 50');


create table Professor (
	pk_id_professor int auto_increment primary key,
    nome_do_professor varchar(50) not null,
    estado_civil_professor enum("Solteiro","Casado","Viuvo"),	
    mae_do_professor varchar(50),
    cpf_do_professor char(12),
    cidade_professor varchar(50),
    diciplina_professor varchar(50)
);

insert into Professor
(nome_do_professor, estado_civil_professor, mae_do_professor, cpf_do_professor,	cidade_professor, diciplina_professor) 
values	
('Ferrari da silva', 'Viuvo', 'Juliana', '512238173921', 'Sao paulo', 'Matematica'),
('Annita Marcone', 'Casado', 'Maria', '325961215817', 'Sao paulo', 'Historia'),
('CoblleBolt Fernando', 'Casado', 'Fernanda', '721514204613', 'Sao paulo', 'Portugues'),
('Bruce Wayne', 'Solteiro', 'Bianca', '141222518101', 'Sao paulo', 'Ciencias'),
('Robin da silva', 'Casado', 'Luana', '111623225147', 'Sao paulo', 'Biologia'),
('Messi da silva', 'Solteiro', 'Amanda', '942018122210', 'Sao paulo', 'Geografia'),
('Lautaro Martinez', 'Solteiro', 'Bruna', '121933251712', 'Sao paulo', 'Filosofia'),
('Angelica filho', 'Solteiro', 'Joana', '510132182024', 'Sao paulo', 'Sociologia'),
('Luciano Hulk', 'Solteiro', 'Joana', '236141203217', 'Sao paulo', 'Educacao fisica'),
('Post Malone', 'Solteiro', 'Bianca', '817251542201', 'Sao paulo', 'Quimica');

start transaction;

alter table Professor
change column cpf_do_professor cpf_professor varchar(15); /* alterando o tamanho do campo do CPF*/

alter table Professor /* Corrigido a ortografia*/
change column diciplina_professor disciplina_professor varchar(15);

select * from Professor;

insert into Professor /*Adicionado mais 3 registros*/
(nome_do_professor, estado_civil_professor, mae_do_professor, cpf_professor,	cidade_professor, diciplina_professor) 
values	
('Rodri da Silva', 'Solteiro', 'Juliana', '512238173921123', 'Sao paulo', 'Matematica'),
('Vinicius Junior', 'Casado', 'Maria', '325961215817123', 'Sao paulo', 'Historia'),
('Cristiano Ronaldo', 'Casado', 'Fernanda', '721514204613123', 'Sao paulo', 'Portugues');

ALTER TABLE Professor DROP COLUMN cidade_professor; /*removendo a cidade*/

update Professor /*Alterado 1 por 1 dos ultimos 5 registros em relação a disciplina*/
set disciplina_professor = "Comunicacao"
WHERE nome_do_professor = "Luciano Hulk";

DELETE FROM Professor WHERE pk_id_professor IN (7, 10, 12); /*deletando todos registros das 7,10 e 12*/

alter table Professor /* adicionando tabela email*/
add column email_professor varchar(100);

update Professor
set email_professor = "solicitação em andamento"; /*adicionando de forma geral*/

alter table Professor 
change column estado_civil_professor estado_civil_professor char(10);

alter table Professor /* adicionando tabela Formação*/
add column formacao_professor varchar(100);

commit;

create table aula (
	pk_id_aula int auto_increment primary key,
    equipamentos_aula varchar(50),
    disciplina_aula varchar(50),
    sala varchar(50),
    aula_horario time,
    turma_aula varchar(50),
	data_aula date not Null
);

insert into aula (equipamentos_aula, disciplina_aula, sala, aula_horario, turma_aula, data_aula)
value 
("Sala completa", "Matematica", "42", "13:00", "2B", "2024-10-5"),
("Sala completa", "Fisica", "42", "13:00", "2B", "2024-10-7"),
("Sala completa", "Portugues", "42", "13:00", "3B", "2024-10-8"),
("Sala completa", "Sociologia", "42", "13:00", "1B", "2024-10-9"),
("Sala completa", "Quimica", "42", "13:00", "3B", "2024-10-10"),
("Sala completa", "Filosofia", "42", "13:00", "1B", "2024-10-12"),
("Sala completa", "Educacao fisica", "42", "13:00", "2B", "2024-10-15"),
("Sala completa", "Programacao web", "42", "13:00", "2B", "2024-10-20"),
("Sala completa", "Ciencias", "42", "13:00", "3B", "2024-10-25");


