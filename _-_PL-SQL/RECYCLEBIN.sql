http://oraclestart.blogspot.ru/2011/11/oracle.html

Начиная с 10-ой версии СУБД Oracle содержит такой инструмент восстановления случайно удаленных таблиц как корзина (recycle bin), хорошо известный пользователям Windows, MacOS и других операционных систем. При удалении таблицы и их индексы не стираются с диска физически, а специальным образом переименовываются Ораклом, т.е. перемещаются в корзину.

Посмотреть содержимое корзины можено через представление USER_RECYCLEBIN или просто RECYCLEBIN. Очистка корзины производится командой PURGE RECYCLEBIN, а восстановление таблицы - FLASHBACK TABLE.


create table TEST (TEST_COLUMN number primary key);
insert into TEST values (100);
insert into TEST values (200);
select * from TEST;

-- удаляем таблицу
drop table TEST;

-- создаем новую таблицу TEST с новыми данными
create table TEST (TEST_COLUMN number primary key);
insert into TEST values (999);
select * from TEST;

-- просмотр содержимого таблицы
select * from RECYCLEBIN;

-- восстановление таблицы TEST под именем TEST_OLD
flashback table TEST to before drop rename to TEST_OLD;
select * from TEST_OLD;

-- очистка таблицы
purge RECYCLEBIN;
select * from RECYCLEBIN;
