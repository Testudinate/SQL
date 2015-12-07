
Сначала находим ID таблицы.
select object_id from all_objects where object_name = 'ttemplate'
Затем находим ID сессии, которая блокирует эту таблицу.
select sid from v$lock where id1 = 22222 or id2 = 2222
Затем находим серийный номер сессии
select sid, serial# from v$session where sid = 134
А потом прибиваем сессию к чертям. Параметр — sid || ',' || serial#
alter system kill session '134,9107' immediate
