Исходные данные ниже. Задача представить записи в одной строке если у них разные уровни группировки, т.е

Результат работы запроса ниже : 

id  summ  lvl_group
1   200	  1
2   350	  1
3   200	  1
4   500	  2
5   700	  2

Т.к. ntile(2) у нас 2, то требуется выводить следующие столбцы id1 summ1 lvl_group1 id2 summ2 lvl_group2

В результате должно получиться следующее :

id1 summ1 lvl_group1  id2 summ2 lvl_group2
1   200	  1             4   500	 2
2   350	  1             5   700	 2
3   200	  1

with a as (select 1 id, 200 summ from dual union all 
        select 2 id, 350 summ from dual union all
        select 3 id, 200 summ from dual union all
        select 4 id, 500 summ from dual union all
        select 5 id, 700 summ from dual )
select sub.*
  from 
(select id,summ,ntile(2) over (order by id)  lvl 
from a) sub 

Решение:

with a as (select 1 id, 200 summ from dual union all 
        select 2 id, 350 summ from dual union all
        select 3 id, 200 summ from dual union all
        select 4 id, 500 summ from dual union all
        select 5 id, 700 summ from dual )
        
select sub1.*,sub2.* 
  from (select row_number() over (partition by lvl order by id) rw
             , id
             , summ
             , lvl 
          from (select id
                      , summ
                      , ntile(2) over (order by id) lvl 
                   from a
               ) sub 
       where lvl=1) sub1 
  left join (select row_number() over (partition by lvl order by id) rw
             , id
             , summ
             , lvl 
          from (select id
                     , summ
                     , ntile(2) over (order by id) lvl 
                  from a
               ) sub 
        where lvl=2) sub2 on sub2.rw = sub1.rw  

