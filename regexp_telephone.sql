   C помощью "регулярки" выбрать только оператора (958 , 952 и т.д.) 
   
   select sub.phone from 
   (select '(958)0010023' as phone from dual
    union all 
    select '(978)001 00 23' as phone from dual
    )sub
   where REGEXP_LIKE(sub.phone, '^((\(\d{3}\))|(\d{3}))?([\ ])?(\d{3}[\ ]?\d{2}[\ ]?\d{2})$')
     and REGEXP_SUBSTR(sub.phone,'\((.*?)\)',1,1,null,1) in ('958','952')
   
   
