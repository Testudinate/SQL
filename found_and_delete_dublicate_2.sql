1) --тестовая таблица

CREATE TABLE drop_test (  id   number
                        , txt varchar2(30)
                       );

SELECT * FROM drop_test;

2) -- таблица исключений

CREATE TABLE our_exceptions(row_id rowid,
                            owner varchar2(30),
                              table_name varchar2(30),
                                 constraint varchar2(30));
                                 
SELECT * FROM our_exceptions
                                 
                                 
3) -- заполнение 3-мя дублями по каждой строке:

INSERT INTO drop_test SELECT object_id, object_name FROM user_objects WHERE rownum <3001;
INSERT INTO drop_test SELECT object_id, object_name FROM user_objects WHERE rownum <3001;
INSERT INTO drop_test SELECT object_id, object_name FROM user_objects WHERE rownum <3001;

4) --поиск дублей:
SELECT *
  FROM DROP_TEST
 WHERE txt IN ( SELECT txt
                 FROM DROP_TEST
               HAVING COUNT(*) > 1
                GROUP BY txt
             )
 ORDER BY txt;
