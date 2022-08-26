CREATE DATABASE FaculdadeDB

USE FaculdadeDB

-- Compartilha o id entre as tabelas Candidato e Docente, que será referenciada pela tabela Telefone
CREATE SEQUENCE sq_usuario 
	AS int
	START WITH 1
	INCREMENT BY 1

CREATE TABLE tb_departamento (
	id_departamento int IDENTITY PRIMARY KEY,
	st_sigla varchar(3),
	st_nome varchar(40)
)

CREATE TABLE tb_subarea (
	id_subarea int IDENTITY PRIMARY KEY,
	st_sigla varchar(3),
	st_nome varchar(40),
	id_departamento int FOREIGN KEY REFERENCES tb_departamento(id_departamento)
)

CREATE TABLE tb_docente (
	id_docente int PRIMARY KEY,
	st_nome varchar(60),
	st_matricula varchar(12),
	st_email varchar(40),
	id_subarea int FOREIGN KEY REFERENCES tb_subarea(id_subarea)
)

CREATE TABLE tb_curso (
	id_curso int IDENTITY PRIMARY KEY,
	st_nome varchar(60),

	-- 1 (Técnico) ou 2 (Superior)
	nr_tipoCurso int,

	id_coordenador int FOREIGN KEY REFERENCES tb_docente(id_docente),
	id_subarea int FOREIGN KEY REFERENCES tb_subarea(id_subarea)
)

CREATE TABLE tb_disciplina (
	id_disciplina int IDENTITY PRIMARY KEY,
	nr_periodo int,
	st_codigo VARCHAR(5),
	st_nome varchar(100),
	bl_optatitva bit,
	nr_cargaHoraria int,
	id_curso int FOREIGN KEY REFERENCES tb_curso(id_curso)
)

CREATE TABLE tb_candidato (
	id_candidato int PRIMARY KEY,
	st_prontuario varchar(12),
	st_nome varchar(60),
	st_cpf varchar(11) unique check(len(st_cpf) = 11),
	st_rg varchar(9) check(len(st_rg) = 8),
	id_curso int FOREIGN KEY REFERENCES tb_curso(id_curso)
)

CREATE TABLE tb_contaBancaria (
	id_conta int IDENTITY PRIMARY KEY,
	codigo int,
	st_agencia varchar(20),
	st_conta varchar(20),

	-- 1 (Conta Corrente) ou 2 (Poupança)
	nr_tipoConta int,

	id_candidato int FOREIGN KEY REFERENCES tb_candidato(id_candidato)
)

CREATE TABLE tb_telefone (
	id_telefone int IDENTITY PRIMARY KEY,
	st_telefone varchar(20),
	id_user int
)

CREATE TABLE tb_projeto (
	id_projeto int IDENTITY PRIMARY KEY,
	st_descricao varchar(50),
	dt_dataInicio date,
	dt_dataFim date,

	-- 1 (1º semestre), 2 (2º semestre) ou 3 (1º e 2º semestres)
	nr_opcaoDuracao int,

	st_perfil varchar(50),
	st_atividadesPrevistas varchar(50),
	nr_semestres int,

	-- 1 (aprovado) ou 2 (aprovado com adequações)
	id_status int,

	id_disciplina int FOREIGN KEY REFERENCES tb_disciplina(id_disciplina)
)

CREATE TABLE tb_candidato_disciplina (
	id_candidato int FOREIGN KEY REFERENCES tb_candidato(id_candidato),
	id_disciplina int FOREIGN KEY REFERENCES tb_disciplina(id_disciplina),


	-- 1 (a cursar), 2 (cursando), 3 (reprovado), 4 (cursando com dependência), 5 (aprovado)
	nr_status int default 1,

	nr_nota money default null
)

CREATE TABLE tb_projeto_docente (
	id_projeto int FOREIGN KEY REFERENCES tb_projeto(id_projeto),
	id_docente int FOREIGN KEY REFERENCES tb_docente(id_docente),

	PRIMARY KEY(id_docente, id_projeto)
)

CREATE TABLE tb_projeto_candidato (
	-- 0 (rejeitado) ou 1 (aceito)
	bl_statusCandidato bit,

	id_projeto int FOREIGN KEY REFERENCES tb_projeto(id_projeto),
	id_candidato int FOREIGN KEY REFERENCES tb_candidato(id_candidato),

	PRIMARY KEY(id_candidato, id_projeto)
)

-- DROP DATABASE FaculdadeDB

