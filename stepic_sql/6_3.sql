

explain
select 
  name, 
    ifnull((select category.name from store.category 
    join store.category_has_good on category.id=category_has_good.category_id
        where category_has_good.good_id=good.id
        order by category.name limit 1)
  , 0) as first_category 
from store.good where name like 'F%'
#from good where name='F%';

create index store_name_index 
on store.good (name); 

explain
select number, code from store.sale 
join store.client on sale.client_id=client.id
join store.status on status.id=status_id
where status.id in (6, 7);
