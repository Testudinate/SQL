SELECT os.***, os.***, os.***, os.***, uo.***, '***' ***
          , case when (select sum((select count(*) from *.lnk l where l.* = u.* and l.* = *.*.f_* ('*'))) cnt
                        from *.t u
                        connect by prior * = *
                        start with * = os.* ) > 0 then 'CE' else 'CDE' end *
     FROM *.* os, *.t uo
    WHERE os.* = uo.*
   UNION ALL
   SELECT a.*, 'ЛС: ' || a.*, k.* AS *, k.* *, uo.*,
          '*' *, '' *
     FROM *.* uo, *.* k, *.* a
    WHERE uo.* = k.*
      AND k.* = a.*
