Структура :

drop table test.table_4; 
create table test.table_4 (
    id integer, 
    list_id text
); 
insert into test.table_4 values(1,'1,2,3,5,9,7'); 
insert into test.table_4 values(2,'1,2,3,5'); 
insert into test.table_4 values(3,'7,9'); 
insert into test.table_4 values(5,'1,2'); 
insert into test.table_4 values(9,'1'); 
insert into test.table_4 values(7,'5,7,9');

-- Запрос выводит строки без элементов, которые указаны в конструкции where.
-- Использование функции "regexp_replace" в PostgreSQL.

select
   list_id,
   regexp_replace(list_id, '(^[37],|,[37](,)|,[37]$)', '\2', 'g')
from test.table_4
where id not in (3,7);
