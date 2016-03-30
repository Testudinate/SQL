/** PACKAGE ptype
IS
   TYPE tarray_n IS TABLE OF NUMBER; --1
   TYPE refcur IS REF CURSOR; --2
END;
**/

Example :

FUNCTION f_create ( ) RETURN VARCHAR2
..
v_tables         ptype.tarray;
type type_rec is record(row  NUMBER ...);
v_rec            type_rec;
v_counter        binary_integer := 1;
v_cc             ptype.refcur;
...
BEGIN
...
---------------------------------------------------------------
/**SELECT obj BULK COLLECT INTO v_tables ; *//
--This !!!

v_cc := '***' --вызов функции возвращающей refcur
LOOP
  FETCH v_cc INTO v_rec;
  EXIT WHEN v_cc%NOTFOUND;
      SELECT v_rec.obj
      INTO v_tables(v_counter)
      FROM dual;
      v_counter := v_counter + 1;
END LOOP;
CLOSE v_cc ;

FOR i IN v_tables.FIRST .. v_tables.LAST
LOOP
  ...
END LOOP;

---------------------------------------------------------------
...
END;

