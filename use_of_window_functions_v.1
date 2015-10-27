-- Table: test.news

-- DROP TABLE test.news;

CREATE TABLE test.news
(
  id integer,
  section integer,
  header character varying,
  score bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE test.news
  OWNER TO postgres;

INSERT INTO test.news VALUES (1,2,'Заголовок',23);
INSERT INTO test.news VALUES (2,1,'Заголовок',6);
INSERT INTO test.news VALUES (3,4,'Заголовок',79);
INSERT INTO test.news VALUES (4,3,'Заголовок',36);
INSERT INTO test.news VALUES (5,2,'Заголовок',34);
INSERT INTO test.news VALUES (6,2,'Заголовок',95);
INSERT INTO test.news VALUES (7,4,'Заголовок',26);
INSERT INTO test.news VALUES (8,3,'Заголовок',36);


-- Запрос ниже выводит отстование score от предыдущего значения,
-- а также используется оконная функция lead и lag
-- lag позволяет запрашивать более одной строки в таблице, в то время, не имея присоединенной к себе таблицы. 
-- Это возвращает значения из предыдущей строки в таблице. 
-- Для возврата значения из следующего ряда, использоватся функция lead

SELECT id,
       section,
       header,
       score,
       row_number() OVER w        AS rating,
       lag(score) OVER w - score  AS score_lag,
       lag(score) OVER w          AS score_previous,
       lead(score) OVER w         AS scrore_next
  FROM test.news
       WINDOW w AS (ORDER BY score DESC)
 ORDER BY score desc;
