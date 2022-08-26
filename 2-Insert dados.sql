USE FaculdadeDB

INSERT INTO tb_departamento VALUES
	('DCC', 'Departamento de Constru��o Civil'),
	('DCM', 'Departamento de Ci�ncias e Matem�tica'),
	('DEL', 'Departamento de El�trica'),
	('DHU', 'Departamento de Humanidades'),
	('DIT', 'Departamento de Inform�tica e Turismo'),
	('DME', 'Departamento de Mec�nica')

INSERT INTO tb_subarea VALUES
	('SCC', 'Sub�rea de Constru��o Civil', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DCC')),
	('SAB', 'Sub�rea de Biologia', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DCM')),
	('SAF', 'Sub�rea de F�sica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DCM')),
	('SAM', 'Sub�rea de Matem�tica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DCM')),
	('DIT', 'Sub�rea de Qu�mica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DCM')),
	('SAI', 'Sub�rea de Automa��o Industrial', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DEL')),
	('SEL', 'Sub�rea de Eletrot�cnica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DEL')),
	('SEO', 'Sub�rea de Eletr�nica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DEL')),
	('STC', 'Sub�rea de Telecomunica��es', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DEL')),
	('SCL', 'Sub�rea de C�digos e Linguagens', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DHU')),
	('SSC', 'Sub�rea de Sociedade e Cultura', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DHU')),
	('SCI', 'Sub�rea de Cursos de Inform�tica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DIT')),
	('STH', 'Sub�rea de Turismo e Hospitalidade', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DIT')),
	('SME', 'Sub�rea de Mec�nica', (SELECT id_departamento FROM tb_departamento WHERE st_sigla='DME'))

INSERT INTO tb_docente VALUES
	(NEXT VALUE FOR dbo.sq_usuario, 'Aldo Marcelo Paim', 'SP240497', 'aldo.paim@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Alexandre Beletti Ferreira', 'SP226117', 'higuita@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Andre Evandro Lourenco', 'SP100092', 'andreevandro@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Andre Luiz da Silva', 'SP030028', 'andrels@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Antonio Airton Palladino', 'SP112197', 'antonio.palladino@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Antonio Ferreira Viana', 'SP200827', 'antonio.viana@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Cesar Lopes Fernandes', 'SP890534', 'cesar.lf@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Claudete de Oliveira Alves', 'SP03020X', 'claudete.oa@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Claudia Miyuki Werhmuller', 'SP030041', 'claudiay@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Daniel Marques Gomes de Morais', 'SP220097', 'daniel.morais@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Domingos Bernardo Gomes Santos', 'SP090888', 'bernardo@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Domingos Lucas Latorre de Oliveira', 'CJ146456', 'domingos.oliveira@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Eurides Balbino da Silva', 'SP07102X', 'eubalbino@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Francisco Verissimo Luciano', 'SP030247', 'fvluciano@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Ivan Francolin Martinez', 'SP060835', 'ivanfm@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Joao Vianei Tamanini', 'SP060914', 'joao.vt@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Josceli Maria Tenorio', 'SZ124382', 'josceli.tenorio@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Jose Braz de Araujo', 'SP070385', 'jose.ba@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Jose Oscar Machado Alexandre', 'SP070036', 'oscar@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Leandro Pinto Santana', 'CP220383', 'leandro.santana@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Leonardo Andrade Motta de Lima', 'SP24031X', 'leonardo.motta@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Leonardo Bertholdo', 'SP204973', 'l.bertholdo@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Luis Fernando Aires Branco Menegueti', 'SP145385', 'aires@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Luk Cho Man', 'SP060380', 'luk@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Marcelo Tavares de Santana', 'SP20500X', 'marcelo.tavares@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Miguel Angelo Tancredi Molina', 'SP102763', 'miguel.molina@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Paulo Roberto de Abreu', 'SP070816', 'prabreu@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Rodrigo Ribeiro de Oliveira', 'RG134168', 'rodrigo.oliveira@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Vladimir Camelo Pinto', 'SP240291', 'vladimir.camelo@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Wagner de Paula Gomes', 'SP215016', 'wagner.gomes@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='SCI'))

INSERT INTO tb_docente VALUES
	(NEXT VALUE FOR dbo.sq_usuario, 'Brenno Vitorino Costa', 'SP060070', 'brenno@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Camila Collpy Gonzalez Fernandez', 'SP110036', 'camilacollpy@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Catherine Cavalcanti Margoni', 'CB148593', 'catherine.margoni@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Dennis Minoru Fujita', 'SP23302X', 'dennis.fujita@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Erika Sayuri Koga Di Napoli', 'SP205424', 'kogadinapoli@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Fernanda Pereira Liguori', 'AV115641', 'fernandaliguori@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Georgia Nicoletti Garcia', 'SP235611', 'georgia.garcia@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Leandro Rodrigues Gonzalez Fernandez', 'SP100651', 'legonzalez@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Leonardo Nogueira de Moraes', 'SP060082', 'lndmoraes@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Marcos Hideyuki Yokoyama', 'BT147242', 'marcoshy@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Marina Monteiro da Silva', 'SP220103', 'marina.monteiro@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Rafael Chequer Bauer', 'SP060264', 'rafaelbauer@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Rafaela Camara Malerba', 'SP100134', 'rafaela@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Raul Jose de Souza', 'SP030077', 'raul.js@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Rodrigo de Benedictis Delphino', 'BA102568', 'rodrigo.delphino@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Simone Monteiro Cardoso', 'SP235581', 'simone.cardoso@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH')),
	(NEXT VALUE FOR dbo.sq_usuario, 'Tiago Juliano', 'SP231940', 'tiago.juliano@ifsp.edu.br', (SELECT id_subarea FROM tb_subarea WHERE st_sigla='STH'))

INSERT INTO tb_curso VALUES 
	('T�CNICO EM INFORM�TICA INTEGRADO AO ENSINO M�DIO', 1,(SELECT id_docente FROM tb_docente WHERE st_nome='Paulo Roberto de Abreu'), 12),
	('TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS', 2, (SELECT id_docente FROM tb_docente WHERE st_nome='Alexandre Beletti Ferreira'), 12),
	('TECNOLOGIA EM TURISMO E HOSPITALIDADE', 2, (SELECT id_docente FROM tb_docente WHERE st_nome='Marcos Hideyuki Yokoyama'), 13)

INSERT INTO tb_disciplina VALUES
	(1, 'ADEA1', 'Administra��o de Empresas', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'ES1A1', 'Engenharia de Software I', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'LG1A1', 'L�gica de Programa��o I', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'MATA1', 'Matem�tica para Inform�tica', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'OACA1', 'Organiza��o e Arquitetura de Computadores', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'PFDA1', 'Pr�ticas e Ferramentas de Desenvolvimento de Software', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'PTAA1', 'Produ��o de Textos Acad�mico-Profissionais', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(1, 'RHUA1', 'Recursos Humanos em Tecnologia da Informa��o', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(2, 'BD1A2', 'Banco de Dados I', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(2, 'ES2A2', 'Engenharia de Software II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(2, 'EDDA2', 'Estrutura de Dados', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(2, 'LG2A2', 'L�gica de Programa��o II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(2, 'SOPA2', 'Sistemas Operacionais', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3, 'BD2A3', 'Banco de Dados II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3,	'DW1A3', 'Desenvolvimento Web I', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3, 'EMPA3', 'Empreendedorismo', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3, 'ES3A3', 'Engenharia de Software III', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3, 'LP1A3', 'Linguagem de Programa��o I', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(3, 'REDA3', 'Redes de Computadores', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'DW2A4', 'Desenvolvimento Web II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'ES4A4', 'Engenharia de Software IV', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'GPRA4', 'Gest�o de Projetos', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'LP2A4', 'Linguagem de Programa��o II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'SEGA4', 'Seguran�a da Informa��o', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(4, 'SESA4', 'Servi�os e Servidores de Rede', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'ESPA5', 'Estat�stica e Probabilidade', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'LP3A5', 'Linguagem de Programa��o III', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'MPNA5', 'Modelagem de Processos de Neg�cios', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'PDWA5', 'Programa��o Din�mica para Web', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'PI1A5', 'Projeto Integrado I', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(5, 'SIDA5', 'Sistemas Distribu�dos', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(6, 'GTIA6', 'Gest�o e Governan�a da Tecnologia da Informa��o', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(6, 'ICDA6', 'Introdu��o � Ci�ncia de Dados', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(6, 'I0CA6', 'Introdu��o � Otimiza��o Combinat�ria', 0, 57, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(6, 'LESA6', 'Laborat�rio de Escalabilidade de Sistemas', 0, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(6, 'PI2A6', 'Projeto Integrado II', 0, 95, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS')),
	(null, 'LIBA7', 'LIBRAS', 1, 38, (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E DESENVOLVIMENTO DE SISTEMAS'))

INSERT INTO tb_telefone VALUES
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Aldo Marcelo Paim')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Aldo Marcelo Paim')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Aldo Marcelo Paim')),
	('(11) 2763-7625', (SELECT id_docente FROM tb_docente WHERE st_nome='Alexandre Beletti Ferreira')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Alexandre Beletti Ferreira')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Andre Evandro Lourenco')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Andre Luiz da Silva')),
	('(11) 3775-4583', (SELECT id_docente FROM tb_docente WHERE st_nome='Antonio Airton Palladino')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente Where st_nome='Antonio Ferreira Viana')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Cesar Lopes Fernandes')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Cesar Lopes Fernandes')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Cesar Lopes Fernandes')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Claudete de Oliveira Alves')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Claudia Miyuki Werhmiller')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Claudia Miyuki Werhmiller')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Claudia Miyuki Werhmiller')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Daniel Marques Gomes de Morais')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Domingos Bernado Gomes Santos')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Eurides Balbino da Silva')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Francisco Veriss�mo Luciano')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Ivan Francolin Martinez')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Joao Vianei Tamanini')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Josceli Maria Tenorio')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Jose Braz de Araujo')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Jose Oscar Machado Alexandre')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Leandro Pinto Santana')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Andrade Motta de Lima')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Andrade Motta de Lima')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Andrade Motta de Lima')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Bertholdo')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Luis Fernando Aires Branco Menegueti')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Luk Cho Man')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Marcelo Tavares de Santana')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Miguel Angelo Tancredi Molina')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Paulo Roberto de Abreu')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Rodrigo Ribeiro de Oliveira')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Vladimir Camelo Pinto')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Vladimir Camelo Pinto')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Vladimir Camelo Pinto')),
	('(11) 2763-7525', (SELECT id_docente FROM tb_docente WHERE st_nome='Wagner de Paula Gomes')),
	('(11) 2763-7515', (SELECT id_docente FROM tb_docente WHERE st_nome='Wagner de Paula Gomes')),
	('(11) 2763-7512', (SELECT id_docente FROM tb_docente WHERE st_nome='Wagner de Paula Gomes')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Brenno Vitorino Costa')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Camila Collpy Gonzalez Fernandez')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Catherine Cavalcanti Margoni')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Dennis Minoru Fujita')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Erika Sayuri Koga Di Napoli')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Fernanda Pereira Liguori')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Georgia Nicoletti Garcia')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Leandro Rodrigues Gonzalez Fernandez')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Leonardo Nogueira de Moraes')),
	('(11) 2763-7521', (SELECT id_docente FROM tb_docente WHERE st_nome='Marcos Hideyuki Yokoyama')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Marcos Hideyuki Yokoyama')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Marina Monteiro da Silva')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Rafael Chequer Bauer')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Rafaela Camara Malerba')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Raul Jose de Souza')),
	('(11) 2763-7577', (SELECT id_docente FROM tb_docente WHERE st_nome='Rodrigo de Benedictis Delphino')),
	('(11) 2763-7220', (SELECT id_docente FROM tb_docente WHERE st_nome='Rodrigo de Benedictis Delphino')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Simone Monteiro Cardoso')),
	('(11) 2763-7646', (SELECT id_docente FROM tb_docente WHERE st_nome='Tiago Juliano'))

INSERT INTO tb_telefone VALUES
	('(11) 1111-1111', (SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X'))

INSERT INTO tb_candidato VALUES
	(NEXT VALUE FOR dbo.sq_usuario, 'SP303027X', 'Stefany Rodrigues dos Santos', '12345678900', '12345678', (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE
	E DESENVOLVIMENTO DE SISTEMAS')),
	(NEXT VALUE FOR dbo.sq_usuario, 'SP3030237', 'Samuel Lima Santos', '12345678911', '12345679', (SELECT id_curso FROM tb_curso WHERE st_nome='TECNOLOGIA EM AN�LISE E
	DESENVOLVIMENTO DE SISTEMAS'))

INSERT INTO tb_contaBancaria VALUES
	(123123, '4444', '7777',  1, (SELECT id_candidato FROM tb_candidato WHERE st_nome='Stefany Rodrigues dos Santos')),
	(124124, '5555', '8888',  2, (SELECT id_candidato FROM tb_candidato WHERE st_nome='Stefany Rodrigues dos Santos')),
	(125125, '6666', '9999',  1, (SELECT id_candidato FROM tb_candidato WHERE st_nome='Samuel Lima Santos'))

INSERT INTO tb_projeto VALUES
	('Projeto de Banco de Dados', '2020-02-01', '2020-12-01', 1, 'Conhecer elementos b�sicos', 'Ensinar MER, normaliza��o e SQL', 2, 1, (SELECT id_disciplina FROM tb_disciplina 
	WHERE st_codigo='BD1A2')),
	('Projeto de Estrutura de Dados', '2020-02-01', '2020-12-01', 1, 'Conhecer elementos b�sicos', 'Ensinar Estruturas Lineares', 2, 1, (SELECT id_disciplina 
	FROM tb_disciplina WHERE st_codigo='EDDA2'))

INSERT INTO tb_candidato_disciplina VALUES
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='BD1A2'), 5, 9.5),
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='ES2A2'), 5, 8.5),
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='BD2A3'), 1, NULL),
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP3030237'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='BD1A2'), 5, 7.5),
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP3030237'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='ES2A2'), 5, 6.5),
	((SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP3030237'), (SELECT id_disciplina FROM tb_disciplina WHERE st_codigo='BD2A3'), 1, 8)

INSERT INTO tb_projeto_docente VALUES
	((SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Banco de Dados'), (SELECT id_docente FROM tb_docente WHERE st_nome='Eurides Balbino da Silva')),
	((SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Estrutura de Dados'), (SELECT id_docente FROM tb_docente WHERE st_nome='Eurides Balbino da Silva')),
	((SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Estrutura de Dados'), (SELECT id_docente FROM tb_docente WHERE st_nome='Antonio Ferreira Viana'))

INSERT INTO tb_projeto_candidato VALUES
	(1, (SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Banco de Dados'), (SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP303027X')),
	(0, (SELECT id_projeto FROM tb_projeto WHERE st_descricao='Projeto de Banco de Dados'), (SELECT id_candidato FROM tb_candidato WHERE st_prontuario='SP3030237'))
	
