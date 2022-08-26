-- 1)
CREATE DATABASE Exercicio1
USE Exercicio1

CREATE TABLE Produto (
	IdProduto int,
	Descricao varchar(100),
	Unidade int,
	Categoria varchar(20),
	QuantEstoque int,
	QuantMinimaEstoque int,
	DataUltimaCompra date
)

-- Visualizar índices da tabela
EXEC SP_HELPINDEX @objname = Produto

-- 1) A)
CREATE CLUSTERED INDEX CIDX_Prod_IdProduto ON Produto(IdProduto)
CREATE NONCLUSTERED INDEX NIDX_Prod_Categoria ON Produto(Categoria)

-- 1) B) Desabilitou os índices ckusterizado e não clusterizado
ALTER INDEX CIDX_Prod_IdProduto ON Produto DISABLE

-- 1) C) O primeiro comando habilitou apenas o índice clusterizado
ALTER INDEX CIDX_Prod_IdProduto ON Produto REBUILD
ALTER INDEX NIDX_Prod_Categoria ON Produto REBUILD

-- 1) D) 
DROP INDEX CIDX_Prod_IdProduto ON Produto
DROP INDEX NIDX_Prod_Categoria ON Produto

DROP DATABASE Exercicio1


-- 2)
USE HospitalBD

CREATE NONCLUSTERED INDEX NIDX_Pac_IdConvenio ON Paciente(IdConvenio)
CREATE NONCLUSTERED INDEX NIDX_Medico_IdEspecialidade ON Medico(IdEspecialidade)
CREATE NONCLUSTERED INDEX NIDX_Esp_Departamento ON Especialidade(Departamento)
CREATE NONCLUSTERED INDEX NIDX_Pac_Nome ON Paciente(Nome)
