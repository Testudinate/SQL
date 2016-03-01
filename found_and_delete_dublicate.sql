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
delete TEST_DUPLICATE d
where not exists (
        select 1
        from (select min(duplicate_id) duplicate_id
              from TEST_DUPLICATE
              group by value
             ) d2
        where d.duplicate_id = d2.duplicate_id
      );  
