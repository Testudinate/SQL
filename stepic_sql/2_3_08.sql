Задание

Выведите список товаров с названиями категорий, в том числе товаров, не принадлежащих ни 
к одной из категорий, в том числе категорий не содержащих ни одного товара.
Ожидаемый формат результата:
+-------------+----------------+
| good_name   | category_name  |
+-------------+----------------+
| good 1      | category 1     |
| good 1      | category 2     |
| good 2      | category 3     |
| good 2      | category 4     |
| good 3      | category 7     |
...
 
NB! 
Полное внешнее соединение в MySQL может быть реализовано в результате операции объединения левого и правого 
соединений. Например, для полного внешнего соединения таблиц А и B можно использовать запрос вида:

SELECT *
  FROM A
  LEFT OUTER JOIN B
  ON A.b_id = B.id
UNION
SELECT *
  FROM A
  RIGHT OUTER JOIN B
  ON A.b_id = B.id
;

В запросе для соединения нескольких источников данных операцию соединения можно 
использовать многократно. Например, для соединения таблиц A, B и C можно использовать запрос вида:

SELECT * FROM A
  LEFT OUTER JOIN B
    ON A.b_id = B.id
  LEFT OUTER JOIN C
    ON a.c_id = C.id
;


select g.name
     , ct.name
  from good as g
  left outer join category_has_good as c on c.good_id = g.id
  left outer join category as ct on ct.id = c.category_id
  union 
 select g.name
     , ct.name
  from good as g
 right outer join category_has_good as c on c.good_id = g.id
 right outer join category as ct on ct.id = c.category_id;
