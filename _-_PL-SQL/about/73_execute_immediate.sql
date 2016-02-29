Execute immediate.

Базовым оператором, используемым в не содержащих запросов операторов (DML и DDL) и блока PL\SQL
, является оператор EXECUTE IMMIDIETE.

Выполняемая строка может задаваться как литерал, заключённый в одиночные кавычки или 
как переменная типа символьной строки PL\SQL.

Завершающая точка с запятой не нужна для операторов DML и DDL, но указывается для анонимных блоков.

Пример:

В этом примере показаны различные способы использования EXECUTE IMMIDIATE: для выполнения DDL, DML и анонимных блоков PL\SQL

BEGIN
  EXECUTE IMMEDIATE
    'CREATE TABLE execute_table (call VARCHAR2(10))';
  FOR v_counter IN 1 .. 10 LOOP
    v_sqlstring :=
      'INSRT INTO execute_table
       VALUES ("Row'||v_counter||'")';
    EXECUTE IMMEDIATE v_sqlstring;
  END LOOP;
  
  v_plsqlblock:=
    'BEGIN
      FOR v_rec IN ( SELECT * FROM execute_table) LOOP
        DBMS_OUTPUT.PUT_LINE(v_rec.call);
      END_LOOP;
    END;';
  
  EXECUTE IMMEDIATE v_plsqlblock;
  EXECUTE IMMEDIATE 'DROP TABLE execute_table ';
  
END;

EXECUTE IMMEDIATE

EI используется также для выполнения операторов со связанными переменными.

В этом случае выполеяемая строка содержит специальные позиции, помеченные двоеточием.

Позиции предназначены для размещения переменных в PL\SQL, которые указываются в предложении USING оператора 
EI.

Пример 2:

BEGIN

  --Вставим "ECN 103" в таблицу classes, используя строку символов для оператора SQL.
  v_sqlstring:=
    'INSERT INTO CLASSES (department, course, description, max_students, current_students, num_credits)
     VALUES (:dep, :course, :descr, :max_s, :cur_s, :num_c)';
  EXECUTE IMMEDIATE v_sqlstrinmg USING 'ECN',103, 'Economics 103',10,0,3;
  --Зарегистрируем всех выбравших Economics в новой группе.
  FOR v_studentrec IN c_econmajor LOOP
    --здесь мы имеем литеральный оператор SQL, а переменные PL\SQL находятся в предложении USING
  EXECUTE IMMEDIATE
    'INSERT INTO registred_student
      (student_ID, department, course, grade)
     VALUES (:id, :dep, :course, NULL)'
  USING v_studentfrec.ID,'ENC', 103;
  END;
  
