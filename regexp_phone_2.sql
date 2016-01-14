
https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions130.htm

with gpm as ( select '+7(905) 444 07 03' dfphone from dual 
              union all 
              select '(604) 443 07 03' dfphone from dual 
              union all 
              select '88044750703' dfphone from dual 
              union all 
              select '(904) 433 07 03' dfphone from dual
              union all 
              select '+7(804) 411 07 03' dfphone from dual
              union all 
              select '(804) 487 07 0300' dfphone from dual
              union all 
              select '(804) 47' dfphone from dual
              union all 
              select '+7(804) 400 07 03' dfphone from dual
              ) 
              
              
select a.dfphone, 
       a.phone_digit, 
       a.phone_length,    
       case when a.phone_length = 11 then '+7'|| regexp_replace((SUBSTR(a.phone_digit,2,10)),'.*(\d{3}).*(\d{3}).*(\d{2}).*(\d{2})$', '(\1) \2 \3 \4')
            when a.phone_length < 10 or a.phone_length>11 then null
            else '+7' || regexp_replace(a.phone_digit, '.*(\d{3}).*(\d{3}).*(\d{2}).*(\d{2})$', '(\1) \2 \3 \4') 
       end li 
from 
(
select a.dfphone , 
      LENGTH(a.phone_digit) phone_length,
      a.phone_digit
from               
(select 
gpm.dfphone,
REGEXP_REPLACE (gpm.dfphone, '[^[:digit:]]') phone_digit
  from gpm
  --where dfphone not like ('+7%')
) a 
) a;

with gpm as ( select '+7(905) 444 07 03' dfphone from dual 
              union all 
              select '(604) 443 07 03' dfphone from dual 
              union all 
              select '88044750703' dfphone from dual 
              union all 
              select '(904) 433 07 03' dfphone from dual
              union all 
              select '+7(804) 411 07 03' dfphone from dual
              union all 
              select '(804) 487 07 0300' dfphone from dual
              union all 
              select '(804) 47' dfphone from dual
              union all 
              select '+7(804) 400 07 03' dfphone from dual
              ) 
select * from gpm
where REGEXP_SUBSTR(gpm.dfphone,'\+7\(?([0-9]{1}\)?)',1,1,null,1) not in (9);
