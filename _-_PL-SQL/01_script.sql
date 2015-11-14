1.Выбрать всех работников из цеха с названием PP1.

select r.fio
  from RABOT r
  join CEH c on c.idc = r.idc
               and c.name_ceh = 'PP1'
               
