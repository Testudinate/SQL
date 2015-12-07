Ниже пример, который должен вывести 4 группы данных, которые необходимо 
поместить в 1,2,3 и 4 столбец некоторого отчета соответственно, 
но возникает небольшая проблемка с работой данного алгоритма, 
когда количество записей 2, то данные разносятся в 1 и 3 столбец.

1. Пример ( некорректный вывод для 2 -ух записей )

with a as
  (select 1 p from dual union all
   select 22 p from dual --union all
   --select 4 p from dual union all
   --select 44 p from dual union all
   --select 2 p from dual union all
   --select 16 p from dual union all
   --select 7 p from dual union all
   --select 99 p from dual union all
   --select 100 p from dual
   ),
   b as (select rownum row_cnt , a.p from a) 
select ROW_CNT ROW_CNT2,p,1 lvl_1,lvl,ROW_CNT 
  from ( 
         select ROW_CNT,p,2 lvl 
           from b where b.row_cnt <= (select ceil(max(row_cnt)/2) max_row_cnt from b)
         union all 
         select ROW_CNT,p,4 lvl 
           from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
       ) sub1
where sub1.lvl = 2 
  and sub1.row_cnt <= (select ceil(max(row_cnt)/2) max_row_cnt 
                         from ( select ROW_CNT,p,2 lvl from b 
                                 where b.row_cnt <= (select ceil(max(row_cnt)/2) max_row_cnt from b)
                              )
                       )
 union all  
 select ROW_CNT ROW_CNT2,p,2 lvl_1,lvl,ROW_CNT
  from ( 
         select ROW_CNT,p,2 lvl 
           from b where b.row_cnt <= (select ceil(max(row_cnt)/2) max_row_cnt from b)
         union all 
         select ROW_CNT,p,4 lvl 
           from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
       ) sub1
where sub1.lvl = 2 
  and sub1.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt 
                         from ( select ROW_CNT,p,2 lvl from b 
                                 where b.row_cnt <= (select ceil(max(row_cnt)/2) max_row_cnt from b)
                              )
                       )                    

                       
  union all   
 select ROW_CNT2,p,3 lvl_1,lvl,ROW_CNT   
 from        
 (select ROWNUM ROW_CNT2,p,3 lvl_1,lvl,ROW_CNT
  from (  
         select ROW_CNT,p,4 lvl 
           from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
       ) sub1
where sub1.lvl = 4) s1
where  ROW_CNT2 <= (select ceil(max(row_cnt)/2) max_row_cnt  --2
                         from  ( select ROWNUM ROW_CNT,p,4 lvl 
                               from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
                               ) sub2 
                    )
  union all                      
  select ROW_CNT2,p,4 lvl_1,lvl,ROW_CNT   
 from        
 (select ROWNUM ROW_CNT2,p,3 lvl_1,lvl,ROW_CNT
  from (  
         select ROW_CNT,p,4 lvl 
           from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
       ) sub1
where sub1.lvl = 4) s2
where ROW_CNT2 > (select ceil(max(row_cnt)/2) max_row_cnt  --2
                         from  ( select ROWNUM ROW_CNT,p,4 lvl 
                               from b where b.row_cnt > (select ceil(max(row_cnt)/2) max_row_cnt from b)
                               ) sub2 
                       )          
        
2. Решение для 2 - ух записей ( оно короче )                        
with a as
  (select 1 p from dual union all
   select 22 p from dual union all
   select 4 p from dual union all
   select 44 p from dual union all
   select 2 p from dual union all
   select 16 p from dual union all
   select 7 p from dual union all
   select 99 p from dual union all
   select 100 p from dual
   ),
   b as (select rownum row_cnt , a.p from a) 
  select * from 
(select b.p, ntile(4) over(order by row_cnt) title from b
) --where title =2 
