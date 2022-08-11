# Scripts Case Letrus

#Parte I
# Construa o seguinte modelo entidade relacionamento em alguma ferramenta que possua domínio.
# Utilizado o power bi e link em anexo no github.

Crie todas as tabelas (Script SQL)
Eu utilizei além do power bi o mysql para as análises.

No MySQL:

CREATE SCHEMA `letrus` ;

CREATE TABLE `letrus`.`projetos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(200) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `letrus`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nome` VARCHAR(200) NULL,
  `login` VARCHAR(45) NULL,
  `id_ativo` INT NULL,
  `id_genero` INT NULL,
  PRIMARY KEY (`id_usuario`));
  
  CREATE TABLE `letrus`.`notas` (
  `id_nota` INT NOT NULL,
  `id_atividade` INT NULL,
  `nota 1` INT NULL,
  `nota 2` INT NULL,
  `nota 3` INT NULL,
  `nota 4` INT NULL,
  `nota_final` INT NULL,
  PRIMARY KEY (`id_nota`));
  
# Popule todas as tabelas (Script SQL)

Usei o prompt de comando:
  
# Conecte no MySQL via linha de comando
/usr/local/mysql/bin/mysql -u root -p

# Execute:
SET GLOBAL local_infile = true;
exit;

# Conecte novamente
/usr/local/mysql/bin/mysql --local-infile=1 -u root -p

LOAD DATA LOCAL INFILE 'E:/Camilla/CASES_DATASCIENCE/CaseLetrus/Ds1.csv' INTO TABLE `letrus`.`projetos` CHARACTER SET UTF8
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'E:/Camilla/CASES_DATASCIENCE/CaseLetrus/Ds2.csv' INTO TABLE `letrus`.`usuarios` CHARACTER SET ASCII
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'E:/Camilla/CASES_DATASCIENCE/CaseLetrus/Ds3.csv' INTO TABLE `letrus`.`atividades` CHARACTER SET UTF8
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'E:/Camilla/CASES_DATASCIENCE/CaseLetrus/Ds4.csv' INTO TABLE `letrus`.`notas` CHARACTER SET UTF8
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# Implemente os seguintes relatórios

#1 - Projetos com suas atividades
SELECT P.nome, A.nome
FROM letrus.projetos AS P, letrus.atividades AS A
WHERE P.id_usuario = A.id_usuario

#2 - Todas as atividades do usuário “oescolhido@letrus.com” no ano de 2022
Não é possível responder

#3 - Quantidade de atividades por projeto do ano 2021
SELECT id_projeto, count(nome) As Qtde_Atividades
FROM letrus.atividades
WHERE data_inicio >= '01/01/2021'
AND data_inicio =< '31/12/2021'
GROUP BY id_projeto
ORDER BY id_projeto ASC;

#4 - Lista de atividades em ordem hierárquica do projeto "LetrusTIC”
Ao realizar a análise exploratória dos dados, não foi possível encontrar o projeto "LetrusTIC".

#5 - Exclua o projeto “LetrusTIC”
Ao realizar a análise exploratória dos dados, não foi possível excluir o projeto "LetrusTIC".

#6 - Liste todos as pessoas que estão no projeto “Concurso de Redacao”
Ao realizar a análise exploratória dos dados, não foi possível encontrar o projeto "Concurso de Redacao".

#7 - Aumente o prazo final em 15 dias de todas as atividades do projeto “Concurso de Redacao”
Ao realizar a análise exploratória dos dados, não foi possível aumentar o prazo das atividaes do projeto "Concurso de Redacao".

#8 - Exclua todos as atividades do usuário “João 33”
SELECT id_usuario, name
FROM letrus.usuarios
WHERE nome = 'João33';
(retorna id_usuario 33)

DELETE FROM letrus.atividades
WHERE id_usuario = 33;

#9 - Crie a tabela "endereco” e relacione com o a tabela usuário
Endereco (estado, cidade, bairro, rua, cep, numero)

CREATE TABLE `letrus`.`endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


#10 - Popule a tabela “endereco”

Dados de endereço não informados, sendo assim, para fins de resolução dessa questão, foram gerados dados dummy gerado no site: https://generatedata.com/ em 09/08/2022.
Em seguida, dados carregados via linha de comando:

LOAD DATA LOCAL INFILE 'E:/Camilla/CASES_DATASCIENCE/CaseLetrus/endereco1.csv' INTO TABLE `letrus`.`endereco` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

#11 - Crie uma view que mostre todos os usuários que estão na cidade São Paulo e a nota final esteja entre 7 e 10 pontos

SELECT * FROM letrus.vw_usuarios_sp_Entre7e10;

VIEW CRIADA:

CREATE VIEW letrus.vw_usuarios_sp_Entre7e10 AS
SELECT tb_atividades.id_usuario, tb_notas.nota_final,tb_endereco.cidade
FROM 
letrus.notas AS tb_notas, 
letrus.atividades AS tb_atividades, 
letrus.usuarios AS tb_usuarios, 
letrus.endereco AS tb_endereco
WHERE 
tb_notas.id_atividade = tb_atividades.id_atividade
AND tb_atividades.id_usuario = tb_usuarios.id_usuario
AND tb_usuarios.id_usuario = tb_endereco.id
AND tb_endereco.cidade = "São Paulo"
AND tb_notas.nota_final BETWEEN 7 AND 10;


# FASE II

Recomendações e Justificativas da Analista de Dados:
•	A empresa pode desenvolver um método de coleta de dados para obter outros recursos a fim de melhorar a qualidade e integridade dos dados e tornar a análise mais precisa.
•	Na criação da tabela ativos, foi definido pelo analista de dados que 0 seria inativo e 1 ativo
•	Na criação da tabela sexo, foi definido pelo analista de dados que 0 seria feminino e 1 masculino
•	Dados duplicados foram deletados
•	Dados ausentes foram deletados
•	Media_notas (criado no power bi) em virtude da inconsistência dos dados em nota final.
•	Definido pelo Analista de Dados que usuário = aluno.

1 - Ajudar o professor criar melhores conteúdos de aula
    - Faria uma pesquisa com alunos para entender:
		- O que mais os chama a atenção em um conteúdo / aula.
		- Como é o universo desses alunos, o que eles assistem? Redes sociais que usam? Tipos de conteúdo que consemem? Pois com base nisso poderia adequar conteúdos de algumas atividades a essa realidade.
		- Verificar a possibilidade de aplicar estratégias de infotetenimento.
	- Realizar pesquisas de tendências de ensino seriam interessante, como aplicar gamification.
	- Buscar formas de estimular visualmente os alunos com referências aos conteúdos, como filmes / séries / referências do mundo deles.

2 - Dar visibilidade sobre o engajamento dos alunos nas atividade por projeto, cidade
    - Não foi definido o que é engajamento. Sendo possível apenas obter notas (que pode ser ou não, um critério de definição de engajamento).

3 - Encontrar, rastrear e sanar padrões e anomalias na estrutura dos dados
	Anomalias:
	 - Nota final da tabela nota, valores incoerentes com as demais notas.
	 - Padronização do nome do projeto
	 - Apesar de ter utilizado da binarização na tabela gênero (baseado nos dados obtidos), se pensarmos em inclusão e diversidade, deveriámos trabalhar com outras categorias de gênero, atualizando cadastros e tabelas.
	 - Inconsistência entre login e nome usuário
	 - Padronizar formato do campo nome unsuário
	 
4 - Identificar quais atividades tiveram os melhores índices no aspetos nota x engajamento
	- Foi disponibilizado um gráfico com média de notas por atividade, porém como engajamento não foi definido o mesmo precisa ocorrer para que se faça uma versão 2 deste dashboard.