
Задание

Выведите список всех категорий продуктов и количество продаж товаров, относящихся к данной категории. 
Под количеством продаж товаров подразумевается суммарное количество единиц товара данной категории, 
фигурирующих в заказах с любым статусом.
Ожидаемый формат результата:
+---------------------+----------+
| name                | sale_num |
+---------------------+----------+
| category 1          |       11 |
| category 2          |       25 |
| category 3        |       13 |
...
 
NB! В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
Например, для соединения таблиц A, B и C можно использовать запрос вида:
SELECT * FROM A
  LEFT OUTER JOIN B
    ON A.b_id = B.id
  LEFT OUTER JOIN C
    ON a.c_id = C.id
;

select c.name
     , count(sh.sale_id)
  from category as c
  left join category_has_good as ch on ch.category_id = c.id
  left join good as g on g.id = ch.good_id
  left join sale_has_good as sh on sh.good_id = g.id
  left join sale as s on s.id = sh.sale_id
 /*where c.name = 'Cakes'*/
 group by c.name
