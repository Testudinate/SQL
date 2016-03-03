Источник :

http://citforum.ru/database/oracle/bb_indexes/
http://citforum.ru/database/oracle/bitmap_index/

I Анализ и часть текста и статьи:

1. Create table test_normal (empno number(10), ename varchar2(30), sal number(10));

2. 
declare 
Begin
For i in 1..1000000
Loop
   Insert into test_normal 
   values(i, dbms_random.string('U',30), dbms_random.value(1000,7000));
   If mod(i, 10000) = 0 then
   Commit;
  End if;
End loop;
End;
/

3. Create table test_random as select /*+ append */ * from test_normal order by dbms_random.random;

