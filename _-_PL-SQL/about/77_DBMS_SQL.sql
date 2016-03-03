DBMS_SQL

DBMS_SQL используется для выполнения динамического SQL \ PL/SQL.
Он не встроен непосредственно в язык и поэтому менее эффективен, чем встроенный динамический SQL 
( который доступен в ORacle8g и выше)

Модуль DBMS_SQL позволяет непосредственно управлять обработкой операторов в курсоре, выполнять синтаксический 
разбор оператора, связывать входные переменные и определять выходные переменные. 

Пример:

CREATE OR REPLACE PROCEDURE UpdateClasses(
 --использует DBMS_SQL для обновления таблицы учебных групп, задания числа зачетов для всех групп на указанном факультете.
 
p_Department IN classes.department%TYPE,
p_NewCredits IN classes.num_credits%TYPE,
p_RowsUpdated OUT INTEGER) AS

v_CursorID INTEGER;
v_UpdateStmt VARCHAR2(100);

BEGIN
  --Откроем курсор для обработки
  v_CusrsorID := DBMS_SQL.OPEN_CURSOR;
  --Определим строку SQL.
  v_UpdateStmt :=
    'UPDATE classes
        SET num_credits :=ns
      WHERE department:=dept';
      
  --Выполним синтаксический разбор оператор 
  DBMS_SQL.PARSE(v_CursorID, v_UpdateStrat, DBMS_SQL.NATIVE);
  --Свяжем p_NewCredits с позицией :nc. Жта перегруженная версия
  --BIND_VARIIABLE привяжет p_NewCredits как NUMBER,
  --поскольку он так объявлен.
  DBMS_SQL.BIND_VARIABLE(v_CursorID, ':nc', p_NewCredits);
  --Свяжем p_Department c позицией :dept. Эта перегруженная версия 
  --BIND_VARIABLE привяжет p_Department как CHAR, поскольку он так объявлен.
  DBMS_SQL.BIND_VARIABLE_CHAR (v_CursorID, ':dept', p_Department);
  --Выполним оператор
  p_ROwUpdated:= DBMS_SQL.EXECUTE(v_CursorID);
  --Закрываем курсор 
  DBMS_SQL.CLOSE_CURSOR (v_CursorID);
EXCEPTION
  WHEN OTHERS THEN
  --закрываем курсор и снова инициализируем ошибку.
  DBMS_SQL.CLOSE_CURSOR(v_CursorID);
  RAISE;
END updateClasses;
