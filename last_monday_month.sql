select case when to_char(last_day( sysdate ),'D') = 2 then (select to_char((last_day(sysdate)),'DD-MON-YYYY') from dual)            
            when to_char(last_day( sysdate )-1,'D') = 2 then (select to_char((last_day(sysdate)-1),'DD-MON-YYYY') from dual)            
            when to_char(last_day( sysdate )-2,'D') = 2 then (select to_char((last_day(sysdate)-2),'DD-MON-YYYY') from dual)            
            when to_char(last_day( sysdate )-3,'D') = 2 then (select to_char((last_day(sysdate)-3),'DD-MON-YYYY') from dual)            
            when to_char(last_day( sysdate )-4,'D') = 2 then (select to_char((last_day(sysdate)-4),'DD-MON-YYYY') from dual)           
            when to_char(last_day( sysdate )-5,'D') = 2 then (select to_char((last_day(sysdate)-5),'DD-MON-YYYY') from dual)            
            when to_char(last_day( sysdate )-6,'D') = 2 then (select to_char((last_day(sysdate)-6),'DD-MON-YYYY') from dual)            
            else '00'        
       end last_monday_month  
from dual
