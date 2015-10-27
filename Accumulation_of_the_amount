-- Table: test.balance_change

-- DROP TABLE test.balance_change;

CREATE TABLE test.balance_change
(
  transaction_id integer,
  change numeric
)
WITH (
  OIDS=FALSE
);
ALTER TABLE test.balance_change
  OWNER TO postgres;

insert into test.balance_change values(1,1.00);
insert into test.balance_change values(2,-2.00);
insert into test.balance_change values(3,10.00);
insert into test.balance_change values(4,-4.00);
insert into test.balance_change values(5,5.50);

--Для каждой строки идет подсчет в отдельном фрейме. 
--В данном случае фрейм — это набор строк от начала до текущей 
--строки (если было бы PARTITION BY, то от начала партиции)

select transaction_id
     , change
     , sum (change) over (order by transaction_id) as balance
from test.balance_change
order by transaction_id;
