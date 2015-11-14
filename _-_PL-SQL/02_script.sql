2.Выбрать всех работников, учившихся в Москве.

select r.fio
  from RABOT as r
  join EDUCATION as e on e.idr = r.idr
  join VUZ as v on v.idv = e.idv
               and v.city = 'Москва'
               


