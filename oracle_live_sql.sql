Новый сервис Oracle . (среда, где можно тренироваться)
https://livesql.oracle.com/

Дефолтовые данные:
select OWNER,TABLE_NAME from all_tables where rownum <100 and OWNER in ('SH','HR');

--select * from sh.times where rownum <10;
--select * from sh.products where rownum < 10;
--select * from sh.customers where rownum < 10;
--select * from sh.sales where rownum < 10;

--select * from hr.regions;
--select * from hr.locations;
--select * from hr.departments;
--select * from hr.jobs;
--select * from hr.employees;
