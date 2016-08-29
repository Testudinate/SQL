Create table test.employee
( id int,
  first_name varchar(64),
  last_name varchar(64),
  salary float,
  department_id int
)

Create table test.department
( id int,
  name varchar(64)
);

insert into test.employee values (1, 'Ivan','Ivanov',1000,1);
insert into test.employee values (2, 'Patya','Petrov',2000,2);
insert into test.employee values (3, 'Sergey','Sidorov',1500,5);
insert into test.employee values (4, 'Kolya','Peckin',1000,2);
insert into test.employee values (5, 'Petr','Popov',3000,1);
insert into test.employee values (6, 'Kolya','Kolich',2200,2);

insert into test.department values (1, 'Otdel 1');
insert into test.department values (2, 'Otdel 2');
insert into test.department values (3, 'Otdel 3');
insert into test.department values (4, 'Otdel 4');
insert into test.department values (5, 'Otdel 5');
insert into test.department values (6, 'Otdel 6');

select * from test.employee;

select * from test.department;

1.
select e.first_name as first_name
     , e.last_name  as last_name
     , d.name       as department_name
  from test.employee as e
  join test.department as d on d.id = e.department_id
 order by 1,2,3;

2. 
 select d.name       as department_name
     , count(e.id)  as cnt_employee 
  from test.employee as e
  join test.department as d on d.id = e.department_id
 group by d.name
 order by 1;

3.
  select d.name       as department_name
  from test.department as d
 where d.id not in (select e.department_id 
                      from test.employee e
		     group by e.department_id )
 order by 1;

4.
 select d.name       as department_name
      , count(e.id)  as cnt_employee 
   from test.employee as e
   join test.department as d on d.id = e.department_id
  group by d.name
 having count(e.id)>2
  order by 1;

5.
 select d.name as department_name
      , avg(e.salary) as salary_avg_in_department 
      , max(e.salary) as salary_max_in_department 
  from test.employee as e
  join test.department as d on d.id = e.department_id
 group by 1
 order by salary_avg_in_department desc;
