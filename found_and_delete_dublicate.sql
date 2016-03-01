1. Сначала создадим таблицу:

CREATE TABLE TEST_DUPLICATE ( duplicate_id number(9)
                            , value number(9), 
  CONSTRAINT PK_TEST_DUPLICATE 
     PRIMARY KEY (duplicate_id)
);

2. Сгенерируем случайные значения для таблицы:

INSERT INTO TEST_DUPLICATE (duplicate_id, value)
SELECT rownum
     , DBMS_RANDOM.VALUE * 100
  FROM ALL_OBJECTS
WHERE rownum <= 100;

3. Проверим результат того, что получилось:

SELECT * FROM TEST_DUPLICATE;

4. Поиск дубликатов:

SELECT *
  FROM TEST_DUPLICATE
 WHERE value IN ( SELECT value
                    FROM TEST_DUPLICATE
                  HAVING COUNT(*) > 1
                   GROUP BY value
                )
 ORDER BY value;
 
 Несколько способов удалить дубликаты:
 
 1)  -- Вариант с NOT IN. 
     -- Остаются строки с минимальным значением поля DUPLICATE_ID среди дубликатов.
 DELETE FROM TEST_DUPLICATE
  WHERE duplicate_id NOT IN ( SELECT MIN(duplicate_id)
                                FROM TEST_DUPLICATE
                               GROUP BY value );
                               
 2)  -- То же самое через NOT EXISTS.
 DELETE TEST_DUPLICATE d
  WHERE NOT exists ( SELECT 1
                      FROM (SELECT MIN(duplicate_id) duplicate_id
                              FROM TEST_DUPLICATE
                             GROUP BY value
                           ) d2
                     WHERE d.duplicate_id = d2.duplicate_id ); 
  3) -- Вариант с использованием аналитической функции row_number()
 DELETE TEST_DUPLICATE
  WHERE duplicate_id IN ( SELECT duplicate_id
                            FROM (SELECT duplicate_id
                                       , row_number() over (PARTITION BY value order BY NULL) rw
                                    FROM TEST_DUPLICATE
                                 )
                           WHERE rw > 1
                         );
  -- В верхнем запросе нельзя сказать, какая именно строка из дубликатов останется, 
  -- из-за условия "ORDER BY NULL". Для управления этим процессом 
  -- можно отсортировать выборку в пределах каждого неуникального значения 
  -- так, чтобы строка, которую хотелось бы оставить, была первой. 
  -- Например, оставить строки с минимальным значением первичного ключа:                       

  4) 
 DELETE TEST_DUPLICATE
  WHERE duplicate_id IN ( SELECT duplicate_id
                            FROM (SELECT duplicate_id
                                       , row_number() over (PARTITION BY value order BY duplicate_id) rw
                                    FROM TEST_DUPLICATE
                                 )
                           WHERE rw > 1
                         );
                         
  Исключительный случай: 

  Если в таблице нет уникального ключа или индекса, по которому можно отсеивать дубликаты 
  (в примере используется уникальность поля TEST_DUPLICATE.duplicate_id), то можно использовать 
  псевдо столбец ROWID, значения которого гарантированно уникальны, т.е., например, 
  первый запрос на удаление дубликатов через NOT IN может выглядеть так: 
  
 DELETE TEST_DUPLICATE
  WHERE rowid NOT IN ( SELECT MIN(rowid)
                         FROM TEST_DUPLICATE
                        GROUP BY value
                     );  
