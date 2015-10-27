--Час наибольше нагрузки при работе маршрутизатора 

select to_char(recdate,'MM/DD/YYYY HH24:MM') as RECDATE_HOURS
     , tph.OBJNAME
  from TEST_PEAK_HOUR tph
where (to_char(recdate,'MM/DD/YYYY'),tph.OBJNAME, tph.TRAF, tph.COUNTER1) in (
select to_char(tph.recdate,'MM/DD/YYYY') as RECDATE_HOURS
     , tph.OBJNAME
     , tph.TRAF
     , max(tph.COUNTER1) as MAX_COUNTER1
from TEST_PEAK_HOUR tph
where (to_date(to_char(recdate,'MM/DD/YYYY')),tph.OBJNAME, tph.TRAF) in (
     select to_date(to_char(tph.recdate,'MM/DD/YYYY')) as RECDATE_HOURS 
          , tph.OBJNAME
          , max(tph.traf)
       from TEST_PEAK_HOUR tph 
      group by to_date(to_char(tph.recdate,'MM/DD/YYYY'))
          , tph.OBJNAME )
group by to_char(recdate,'MM/DD/YYYY')
       , tph.OBJNAME
       , tph.TRAF 
)
 order by to_char(recdate,'MM/DD/YYYY HH24:MM') 
     , tph.OBJNAME
