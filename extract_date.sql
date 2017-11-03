select to_char(extract(day from (trunc(add_months(e_date-1, 1)-1, 'MM')-1))) into e_last_day from dual;
--select trunc(add_months(sysdate-1, 1)-1, 'MM')-1  from dual;
--select to_char(trunc(add_months(e_date, 1)-1, 'MM')-1) into e_last_day from dual;
--select extract(day from (trunc(add_months(sysdate-1, 1)-1, 'MM')-1)) --into e_last_day --from dual;
--select sysdate-1  from dual;
--select trunc(add_months(sysdate-1, -13), 'MM') into b_date_lasty from dual;
--select trunc(add_months(sysdate-1, -11), 'MM')-1 into e_date_lasty from dual;
