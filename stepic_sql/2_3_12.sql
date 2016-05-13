Задание

Выведите список источников, клиенты пришедшие из которых не совершали заказов или отказывались от 
заказов. Под клиентами, которые отказывались от заказов, необходимо понимать клиентов, у которых есть
заказы, которые на момент выполнения запроса находятся в состоянии 'rejected'.
Ожидаемый формат результата:
+-------------+
| source_name |
+-------------+
| source 1    |
| source 2    |
| source 3    |
......
 
NB! 
Для проверки существования записей в каких-либо таблицах можно использовать оператор EXISTS в 
условии WHERE. Например, вывести список категорий, к которым не принадлежат никакие товары можно следующим образом:
SELECT c.id, c.name FROM category AS c 
  WHERE NOT EXISTS (SELECT * FROM category_has_good AS cg
        WHERE cg.category_id = c.id)
;

В запросе для соединения нескольких источников данных операцию соединения можно использовать 
многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
SELECT * FROM A
  INNER JOIN B
    ON A.b_id = B.id
  INNER JOIN C
    ON a.c_id = C.id
;

select s.name as source_name
  from source as s 
 where s.id in 
(select so.id
                      from client as c
                      join sale as s on s.client_id = c.id 
                      join status as su on su.id = s.status_id and su.name = 'rejected'
                      join source as so on so.id = c.source_id
                     group by so.id)
union  
select s.name as source_name
  from source as s 
 where s.id not in 
( select so.id
                      from client as c
                      join sale as s on s.client_id = c.id
                      join source as so on so.id = c.source_id
                     group by so.id
                   )
               
