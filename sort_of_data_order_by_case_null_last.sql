Сортировка по дате  и null

with dt as (select to_date('2015-04-04','YYYY-MM-DD') dfdate from dual 
            union all 
            select to_date('2015-12-09','YYYY-MM-DD') dfdate from dual
            union all 
            select to_date('2016-01-09','YYYY-MM-DD')  from dual
            union all
            select null from dual )
select dfdate from dt
order by CASE WHEN dfdate is not null THEN dfdate
              else null
          END desc nulls last
