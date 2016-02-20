Открытие курсорной переменной для запроса.

OPEN курсорная_переменная FOR оператор_select;

где курсорная_переменная - это ранее объявленная курсорная переменная, а оператор_select - требуемый запрос.

После выполнения OPEN...FOR можно считывать информацию из курсорной переменной.

Использование курсорной переменной. ПРимер:

PROCEDURE SEL_TEST
( in_last_name IN VARCHAR2 DEFAULT NULL,
  in_date_birth IN VARCHAR2 DEFAULT NULL)
IS
TYPE ref_cursor IS REF CURSOR;

v_sql_stmt VARCHAR2(4000);
v_comma CHAR(1):=NULL;

out_cur ref_cursor;
BEGIN
  v_sql_stmt:='select * from person';
  IF (in_last_name IS NOT NULL) or (in_date_birth IS NOT NULL) THEN
    v_sql_stmt:=v_sql_stmt||' where';
  END IF;
  IF in_last_name IS NOT NULL THEN
    v_sql_stmt:=v_sql_stmt||v_comma||' last_name="'||in_last_name||"';
    v_comma:=' and ';
  END IF;
  
  IF in_date_birth IS NOT NULL THEN
    v_sql_stmt:=v_sql_stmt ||v_comma||'date_birth=to_date("'||in_date_birth||'","DD-MM-YYYY")';
    v_comma:=',';
  END IF;
  
  OPEN out_cur
  FOR v_sql_stmt;
  ...
END;
