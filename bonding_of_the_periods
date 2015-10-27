--Склеивание периодов, в кот. нет данных

select to_char(to_date(begin_hour,'MM/DD/YYYY HH24:MI:SS'),'YYYY-MM-DD HH24:MI') RECDATE
     , to_char(to_date(end_hour,'MM/DD/YYYY HH24:MI:SS'),'YYYY-MM-DD HH24:MI') NEXT_RECDATE
from 
(
select min(begin_hour) begin_hour,max(end_hour) end_hour
from
(
select
strg_grp,
begin_hour,end_hour,
row_number()over(partition by strg_grp order by begin_hour) -
row_number()over(order by begin_hour) as grp_id
from 
(select begin_hour, end_hour,
       case when recdate is null and begin_hour> max(end_hour) over (order by begin_hour, end_hour rows between unbounded preceding and 1 preceding) then 1 end strg_grp
from
(
with interval_dt as 
                    (select to_date('04/11/2011 00:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 00:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 01:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 01:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 02:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 02:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 03:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 03:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 04:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 04:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 05:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 05:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 06:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 06:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 07:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 07:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 08:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 08:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 09:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 09:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 10:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 10:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 11:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 11:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 12:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 12:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 13:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 13:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 14:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 14:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 15:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 15:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 16:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 16:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 17:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 17:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 18:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 18:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 19:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 19:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 20:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 20:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 21:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 21:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 22:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 22:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/11/2011 23:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/11/2011 23:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all
                     select to_date('04/12/2011 00:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 00:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 01:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 01:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 02:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 02:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 03:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 03:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 04:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 04:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 05:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 05:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 06:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 06:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 07:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 07:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 08:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 08:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 09:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 09:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 10:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 10:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 11:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 11:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 12:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 12:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 13:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 13:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 14:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 14:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 15:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 15:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 16:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 16:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 17:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 17:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 18:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 18:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 19:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 19:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 20:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 20:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 21:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 21:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 22:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 22:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/12/2011 23:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/12/2011 23:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual
                     union all 
                     select to_date('04/13/2011 00:00','MM/DD/YYYY HH24:MI:SS') begin_hour , to_date('04/13/2011 00:59','MM/DD/YYYY HH24:MI:SS') end_hour from dual )
select to_char(interval_dt.begin_hour,'MM/DD/YYYY HH24:MI:SS') begin_hour , to_char(interval_dt.end_hour,'MM/DD/YYYY HH24:MI:SS') end_hour,tph.recdate
from interval_dt
left join (select to_char(tph.recdate,'MM/DD/YYYY HH24:MI:SS') recdate
from TEST_PEAK_HOUR tph
group by to_char(tph.recdate,'MM/DD/YYYY HH24:MI:SS' )) tph 
on to_date(tph.recdate,'MM/DD/YYYY HH24:MI:SS') between begin_hour and end_hour
)
)
)
where STRG_GRP = 1
group by GRP_ID

)
