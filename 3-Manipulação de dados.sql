USE FaculdadeDB

-- Encontrar as disciplinas de TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS no 5º e 6º semestres (3 modos diferentes)
SELECT * FROM tb_disciplina WHERE nr_periodo between 5 and 6
SELECT * FROM tb_disciplina WHERE nr_periodo>=5 AND nr_periodo<=6
SELECT * FROM tb_disciplina WHERE nr_periodo IN (5, 6)

-- Encontrar disciplinas cujo período é null
SELECT * FROM tb_disciplina WHERE nr_periodo IS NULL

-- Encontrar candidatos que começam com a letra S
SELECT * FROM tb_candidato WHERE st_nome LIKE 'S%'

-- Encontrar todos os telefones da docente Eurides
SELECT st_telefone FROM tb_telefone
	WHERE id_user=(SELECT id_docente FROM tb_docente WHERE st_nome='Eurides Balbino da Silva')

-- Encontrar todos os docentes da área de informática
SELECT * FROM tb_docente 
	INNER JOIN tb_subarea ON tb_docente.id_subarea = tb_subarea.id_subarea 
	WHERE st_sigla='SCI'

-- Encontrar todos os projetos promovidos pela docente Eurides
SELECT tb_projeto.st_descricao FROM tb_projeto
	INNER JOIN tb_projeto_docente ON tb_projeto_docente.id_projeto = tb_projeto.id_projeto
	INNER JOIN tb_docente ON tb_projeto_docente.id_docente = tb_docente.id_docente
	WHERE tb_docente.st_nome LIKE 'Eurides%'

-- Encontrar docentes que promoveram o projeto de Estrutura de Dados
SELECT tb_docente.st_nome 'Nomes dos docentes' FROM tb_docente
	INNER JOIN tb_projeto_docente ON tb_projeto_docente.id_docente = tb_docente.id_docente
	INNER JOIN tb_projeto ON tb_projeto_docente.id_projeto = tb_projeto.id_projeto
	WHERE tb_projeto.st_descricao LIKE '%Estrutura%'

-- Encontrar candidato que foi escolhido para projeto de banco de dados
SELECT tb_projeto.st_descricao Projeto, tb_candidato.st_prontuario [Prontuário do candidato], tb_candidato.st_nome 'Aluno do candidato escolhido' FROM tb_candidato 
	INNER JOIN tb_projeto_candidato ON tb_projeto_candidato.id_candidato = tb_candidato.id_candidato
	INNER JOIN tb_projeto ON tb_projeto.id_projeto = tb_projeto_candidato.id_projeto
	WHERE tb_projeto_candidato.bl_statusCandidato = 1 
		AND tb_projeto_candidato.id_projeto = (SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Banco de Dados')
		AND tb_projeto.dt_dataInicio between '2020-01-01' AND '2020-07-01'

-- Encontrar candidatos que se candidataram a algum projeto e sua nota IRA
SELECT tb_candidato.st_nome 'Nome candidato', tb_projeto.st_descricao 'Nome projeto', SUM(tb_candidato_disciplina.nr_nota)/COUNT(tb_candidato_disciplina.nr_nota) 'Nota IRA' FROM tb_candidato
	INNER JOIN tb_candidato_disciplina ON tb_candidato_disciplina.id_candidato = tb_candidato.id_candidato
	INNER JOIN tb_disciplina ON tb_candidato_disciplina.id_disciplina = tb_disciplina.id_disciplina
	INNER JOIN tb_projeto_candidato ON tb_projeto_candidato.id_candidato = tb_candidato.id_candidato
	INNER JOIN tb_projeto ON tb_projeto.id_projeto = tb_projeto_candidato.id_projeto
	WHERE tb_candidato_disciplina.nr_status > 2
	GROUP BY tb_candidato.st_nome, tb_projeto.st_descricao
	ORDER BY SUM(tb_candidato_disciplina.nr_nota)/COUNT(tb_candidato_disciplina.nr_nota) DESC

-- Atualizar status de candidato
UPDATE tb_projeto_candidato SET bl_statusCandidato=0
	WHERE id_projeto=(SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Banco de Dados') 
		AND id_candidato=(SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X')

-- Atualizar telefone de aluno
UPDATE tb_telefone SET st_telefone='(11) 4444-5555'
	WHERE id_user=(SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X')

-- Atualizar para NULL todos os telefones dos projessores da subarea de informática
UPDATE tb_telefone SET st_telefone=NULL FROM tb_telefone
	INNER JOIN tb_docente ON tb_telefone.id_user = tb_docente.id_docente
	INNER JOIN tb_subarea ON tb_docente.id_subarea = tb_subarea.id_subarea
	WHERE tb_subarea.st_sigla='SCI'

-- Deletar telefone de um docente específico
DELETE FROM tb_telefone WHERE id_user=(SELECT id_docente FROM tb_docente WHERE st_nome='Aldo Marcelo Paim') AND st_telefone='(11) 2763-7525'

-- Deletar todos telefones de um docente específico
DELETE FROM tb_telefone WHERE id_user=(SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Andrade Motta de Lima')

-- Deletar todos os telefones do docentes da subrea de informática
DELETE tb_telefone FROM tb_telefone 
	INNER JOIN tb_docente ON tb_telefone.id_user = tb_docente.id_docente
	INNER JOIN tb_subarea ON tb_docente.id_subarea = tb_subarea.id_subarea
	WHERE tb_subarea.st_sigla='SCI'
