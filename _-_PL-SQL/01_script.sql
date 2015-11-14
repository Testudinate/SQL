1.Выбрать всех работников из цеха с названием РУД.

select r.fio
  from RABOT as r
  join CEH as c on c.idc = r.idc
               and c.name = 'РУД'
               
