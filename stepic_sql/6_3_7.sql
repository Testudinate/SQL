Создайте B-tree индекс на поле с названием товара в отношении good.

select 
  name, 
    ifnull((select category.name from category 
    join category_has_good on category.id=category_has_good.category_id
        where category_has_good.good_id=good.id
        order by category.name limit 1)
  , 0) as first_category 
from good where name like 'F%'
from good where name='F%';
 
Сколько теперь кортежей будет обработано из таблицы good?

20
