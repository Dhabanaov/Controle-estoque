use estoque;
SELECT 
P.ID_VENDA,
c.ID_FORNECEDOR,
c.ID_FORMA_PGTO,
c.USUARIO,
c.VALOR,
c.CADASTRO,
B.NOME,
fp.DESCRICAO
FROM produto P
INNER JOIN FORNECEDOR b ON (b.ID_FORNECEDOR = c.ID_FORNECEDOR)
INNER JOIN  FORMA_PGTO FP ON (fp.ID_FORMA_PGTO = c.ID_FORMA_PGTO)
 CREATE TABLE PRODUTO(
  ID_PRODUTO            INTEGER NOT NULL AUTO_INCREMENT,
  PRODUTO_DESCRICAO     varchar(100) not null,
  ID_FORNECEDOR         INTEGER NOT NULL,
  VL_CUSTO              DECIMAL(11,2) NOT NULL,
  VL_VENDA              DECIMAL(11,2) NOT NULL,
  ESTOQUE               DECIMAL(11,2) NOT NULL,
  ESTOQUE_MIN           DECIMAL(11,2) NOT NULL,
  UNIDADE               VARCHAR(6),
  CADASTRO              DATE NOT NULL,






SELECT
 a.ID_PRODUTO,
 a.PRODUTO_DESCRICAO, 
 a.VL_CUSTO,
 a.VL_VENDA,
 a.ESTOQUE,
 a.ESTOQUE_MIN,
 a.UNIDADE, 
 B.NOME
 C.NOME,
 V.USUARIO
FROM PRODUTO a 
INNER JOIN FORNECEDOR b ON b.ID_FORNECEDOR = a.ID_FORNECEDOR
INNER JOIN CLIENTE c ON c.ID_CLIENTE = a.ID_CLIENTE
INNER JOIN VENDA V ON V.ID_VENDA = a.ID_VENDA
