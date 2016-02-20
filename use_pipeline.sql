Spec:
...
IS
TYPE rep_rec IS RECORD
( describe VARCHAR2(60),
  value VARCHAR2(100)
);

TYPE rep_tab IS TABLE OF rep_rec;

FUNCTION f_get_rep( p_id IN NUMBER)
  RETURN rep_tab
  PIPELINED;
END;

Body:

FUNCTION f_get_rep(p_id IN NUMBER)
  RETURN rep_tab
  PIPELINED
IS 
BEGIN
  FOR rec IN (select)
  
  LOOP
    PIPE ROW(rec);
  END LOOP;
END;
