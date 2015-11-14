2.Выбрать всех работников, учившихся в Samara.

select r.fio
  from RABOT r
  join EDUCATION e on e.idr = r.idr
  join VUZ v on v.idv = e.idv
               and v.city = 'Samara';
               


