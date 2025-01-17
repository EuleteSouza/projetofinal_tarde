-- DDL (Data Definition Language)
-- Linguagem de Definição de Dados
	-- CREATE
    -- DROP
    -- ALTER

-- DML (Data Manipulation Language)
-- Linguagem de Manipulação de Dados
	-- INSERT
    -- UPDATE
    -- DELETE

-- DQL (Data Query Language)
-- Linguagem de Pesquisa de dados
	-- SELECT
    -- WHERE
    -- FROM
    -- >  < >=  = AND


-- DCL (Data Control Language)
-- Linguagem de Controle de Dados
	-- Criar usuários
    -- Tarefas de ADMIN
    -- Grant
    -- Revoke

-- DTL (Data Transaction Language)
-- Transações
    -- BEGIN TRAN (OU BEGIN TRANSACTION) – Marca o começo de uma transação no banco da dados  que pode ser completada ou não.
    -- COMMIT – Envia todos os dados da transação permanentemente para o banco de dados.
    -- ROLLBACK – Desfaz as alterações feitas na transação realizada.
    
   -- DDL: CREATE DATABASE (criar um banco de dados)
   CREATE DATABASE schooltracker;
   -- Selecionar o banco de dados desejado
   USE schooltracker;
   -- Mostrar tabelas
   SHOW tables;
   
CREATE TABLE aluno (
    id int PRIMARY KEY auto_increment,
    ra char(8) NOT NULL
);
-- Alterar tabela adicionando a constraint UNIQUE  no ra.
ALTER TABLE aluno ADD CONSTRAINT constraint_aluno UNIQUE(ra);
DESCRIBE aluno;
-- Pesquisa todos os campos (*) da tabela aluno
SELECT * FROM aluno;
-- DELETE registros da tabela aluno quando id = 4
DELETE FROM aluno WHERE id > 0;
truncate table aluno;
-- Mostra toda a estrutura da tabela
DESCRIBE aluno;
-- INSERT
-- INSERT aluno(ra)values('00034547');
INSERT INTO aluno (ra) VALUES
('00034548'),
('00034549'),
('00034550'),
('00034551'),
('00034552'),
('00034553'),
('00034554'),
('00034555'),
('00034556'),
('00034557'),
('00034558'),
('00034559'),
('00034560'),
('00034561'),
('00034562'),
('00034563'),
('00034564'),
('00034565'),
('00034566'),
('00034567'),
('00034568'),
('00034569'),
('00034570'),
('00034571'),
('00034572'),
('00034573'),
('00034574'),
('00034575'),
('00034576'),
('00034577'),
('00034578'),
('00034579'),
('00034580'),
('00034581'),
('00034582'),
('00034583'),
('00034584'),
('00034585'),
('00034586'),
('00034587'),
('00034588'),
('00034589'),
('00034590'),
('00034591'),
('00034592'),
('00034593'),
('00034594'),
('00034595'),
('00034596'),
('00034597'),
('00034598'),
('00034599');
describe aluno;
SELECT * FROM aluno;
truncate table aluno;
SELECT * FROM diariobordo;
CREATE TABLE diariobordo (
    id int PRIMARY KEY auto_increment,
    texto text NOT NULL,
    datahora datetime,
    fk_aluno_id int
);
 
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
    
-- Inserção de registros na tabela diariobordo
INSERT INTO diariobordo (texto, datahora, fk_aluno_id) VALUES
('Participou das aulas de matemática e português. Demonstrou interesse e fez todas as atividades propostas.', '2024-07-30 08:30:00', 7),
('Aulas de ciências e história. Contribuiu com perguntas relevantes e trabalhou bem em grupo.', '2024-07-31 09:00:00', 7),
('Fez a prova de matemática com bom desempenho. Participou ativamente das discussões em aula.', '2024-07-30 10:00:00', 8),
('Aulas de educação física e artes. Mostrou grande interesse e criatividade nas atividades artísticas.', '2024-07-31 11:00:00', 8);

SELECT * FROM diariobordo;

-- Inserção de registros na tabela diariobordo
INSERT INTO diariobordo (fk_aluno_id, datahora, texto) VALUES
(9, '2024-07-30 08:30:00','Participou das aulas de matemática e português. Demonstrou interesse e fez todas as atividades propostas.'),
(9, '2024-07-31 09:00:00', 'Aulas de ciências e história. Contribuiu com perguntas relevantes e trabalhou bem em grupo.');

-- Mostrando de forma personalizada o diario de bordo e o ra do aluno (duas tabelas)
SELECT
d.id,
d.texto,
d.datahora,
a.ra
FROM
	diariobordo d
JOIN
	aluno a
ON
	d.fk_aluno_id = a.id;

-- Lista as tabelas a quantidade de tabelas
show tables;

INSERT INTO aluno (ra) VALUES
('00086481');
SELECT * FROM aluno;

INSERT INTO diariobordo (texto, datahora, fk_aluno_id) VALUES
('Hoje aprendi a inserir dados na tabela com o comando INSERT; alterar tabela com comando ALTER TABLE, adicionando uma Constraint e tornando o ra UNIQUE - único; também aprendi a deletar dados com DELETE; DESCRIBE para ver a tabela, aprendi também a inserir o diário de bordo com INSERT; e aprendi também a casar as duas tabelas com o comando JOIN. O comando SHOW TABLE lista as tabelas','2024-07-31 17:48:00',59);
 SELECT * FROM diariobordo;
 
 SELECT * FROM
	diariobordo
    JOIN
    aluno
    ON diariobordo.fk_aluno_id = aluno.id;
    
    
    drop table avaliacao;
    
    
   -- EXERCÍCIO
CREATE TABLE avaliacao (
    id int PRIMARY KEY auto_increment,
    nota1 int,
    nota2 int,
    nota3 int,
    nota4 int,
    fk_aluno_id int
);
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE RESTRICT;
   
   SHOW TABLES;
   
   INSERT INTO avaliacao ( nota1, nota2, nota3, nota4,fk_aluno_id) VALUES (10,20,21,19,7);
   INSERT INTO avaliacao (fk_aluno_id, nota1, nota2, nota3, nota4) VALUES (15,10,25,20,8);
   INSERT INTO avaliacao (fk_aluno_id, nota1, nota2, nota3, nota4) VALUES (10,10,24,18,9);
   INSERT INTO avaliacao (fk_aluno_id , nota1, nota2, nota3, nota4) VALUES (25,25,24,23,59);
 
   
describe avaliacao;
SELECT * FROM avaliacao;
truncate table avaliacao;


SELECT
av.id,
av.nota1,
av.nota2,
av.nota3,
av.nota4,
a.ra
FROM
	avaliacao av
JOIN
	aluno a
ON
	av.fk_aluno_id = a.id;

-- Adicionar mais dados na tabela aluno com ALTER TABLE
ALTER TABLE aluno
ADD COLUMN Nome VARCHAR(255);



ALTER TABLE aluno
ADD COLUMN Tempo_de_Estudo INT;

-- ALTER TABLE aluno MODIFY Tempo_de_Estudo INT NOT NULL;

ALTER TABLE aluno
ADD COLUMN Renda_Media_Salarial_Familiar DECIMAL(10, 2);

DESCRIBE aluno;

SELECT * FROM aluno;

SELECT * FROM aluno ORDER BY id DESC LIMIT 1;


INSERT INTO ALUNO (ra, nome, Tempo_de_estudo, Renda_Media_Salarial_Familiar) VALUES
('58376945', 'Rafael Costa', 8, 2051.36),
('71958815', 'Carlos Santos', 4, 1517.92),
('13387097', 'Ana Oliveira', 2, 8244.75),
('62892751', 'João Ferreira', 9, 3771.58),
('31548846', 'Mariana Lima', 3, 4746.12),
('48419106', 'Pedro Gomes', 7, 6973.88),
('71519098', 'Beatriz Costa', 5, 1859.27),
('20785423', 'José Souza', 1, 2690.52),
('41259873', 'Maria Silva', 6, 3146.83),
('85697413', 'Camila Pereira', 3, 5412.39),
('16384527', 'Mariana Santos', 4, 2867.34),
('98745230', 'Carlos Ferreira', 5, 2214.78),
('58974321', 'Ana Gomes', 2, 4971.65),
('47895213', 'João Lima', 9, 8201.14),
('31648752', 'Maria Costa', 1, 1467.20),
('98714236', 'Pedro Souza', 8, 6947.43),
('36458279', 'Rafael Silva', 7, 8493.76),
('10346825', 'Beatriz Pereira', 6, 3624.58),
('54821379', 'José Santos', 3, 4713.20),
('97584213', 'Camila Almeida', 2, 3597.54),
('19843572', 'Mariana Oliveira', 5, 8157.22),
('41259784', 'Carlos Silva', 4, 3651.91),
('84513927', 'Pedro Santos', 1, 2965.45),
('78362145', 'João Pereira', 7, 4271.35),
('65217384', 'Maria Lima', 8, 2574.78),
('31947685', 'Ana Costa', 6, 1417.00),
('21487539', 'Beatriz Souza', 2, 6971.88),
('97856124', 'José Ferreira', 5, 6547.12),
('41623857', 'Camila Gomes', 3, 5478.14),
('13947526', 'Rafael Santos', 4, 7314.89),
('84573619', 'Mariana Pereira', 1, 5638.47),
('21348759', 'Carlos Lima', 6, 4971.25),
('67415893', 'Pedro Costa', 8, 7891.47),
('18475936', 'Ana Souza', 2, 3795.36),
('94751638', 'João Santos', 7, 4814.78),
('12634789', 'Maria Ferreira', 5, 1624.89),
('31845762', 'Beatriz Almeida', 3, 2578.96),
('71638492', 'José Silva', 4, 3814.59),
('59318475', 'Camila Santos', 8, 4678.58),
('82314765', 'Rafael Souza', 1, 9314.25),
('12649875', 'Mariana Ferreira', 9, 7418.89),
('91264375', 'Carlos Pereira', 7, 1584.23),
('73159824', 'Pedro Silva', 6, 2481.37),
('41957832', 'Ana Santos', 5, 3561.47),
('83691475', 'João Gomes', 4, 4171.25),
('12854793', 'Maria Souza', 2, 6914.47),
('91478236', 'Beatriz Pereira', 8, 8125.69),
('82371645', 'José Almeida', 3, 2561.36),
('36487152', 'Camila Lima', 1, 4765.48);







