Задание

Выведите названия товаров, которые относятся к категории 'Cakes' или фигурируют в заказах текущий статус которых 'delivering'. Результат не должен содержать одинаковых записей.
Ожидаемый формат результата:
+-------------+
| good_name   |
+-------------+
| good 1      |
| good 2      |
| good 3      |
...
 
NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:
SELECT * FROM A
  INNER JOIN B
    ON A.b_id = B.id
  INNER JOIN C
    ON a.c_id = C.id
;

select g.name as good_name
  from good g
  join category_has_good as c on c.good_id = g.id
  join category as ct on ct.id = c.category_id and ct.name ='Cakes'
 group by g.name
  union 
 select g.name as good_name
  from good g
  join sale_has_good as sg on sg.good_id = g.id
  join sale as s on s.id = sg.sale_id
  join status as su on su.id = s.status_id and su.name ='delivering'
 group by g.name
 order by 1
