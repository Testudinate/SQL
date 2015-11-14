3.Выбрать все цеха, в которых нет выпускников IPPMY.

select c.name_ceh
  from CEH c
  join RABOT r on r.idc = c.idc
  join EDUCATION e on e.idr = r.idr
  join VUZ v on v.idv = e.idv
 where (c.name_ceh) not in (select c.name_ceh
                              from CEH c
                              join RABOT r on r.idc = c.idc
                              join EDUCATION e on e.idr = r.idr
                              join VUZ v on v.idv = e.idv
                             where v.name_vuz in ('IPPMY'));
 
