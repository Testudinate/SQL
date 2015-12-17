Пример работы скрипта в ORACLE
   
   SELECT LISTAGG (sub.inn, ', ') WITHIN GROUP (ORDER BY sub.inn)
     INTO v_list
     FROM (  SELECT inn
               FROM taccount
              WHERE user = p_user
              GROUP BY inn ) sub;
