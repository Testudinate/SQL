--Выборка подчиненных за все время

select sub.NAME
     , sub.CNT_CHILD
  from (select t1.name
             , count(t2.id_PARENT) CNT_CHILD
          from T_USER t1
          left join T_USER t2 on t1.id_user=t2.ID_PARENT
         group by t1.id_user
                , t1.name
       ) sub
 order by CNT_CHILD;
