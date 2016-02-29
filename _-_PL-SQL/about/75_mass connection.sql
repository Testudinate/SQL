Массовые соединения

Операторы SQL в блоках PL\SQL пересылаются системе поддержки SQL, которая в свою очередь
может передавать данные назад системе поддержки PL\SQL (как результат запроса) 

Во многих случаях данные, которые вносятся или обновляются в базе данных, помещаются сначала в сборную конструкцию PL\SQL, 
и затем эта сборная конструкция просматривается с помощью цикла FOR для отправки информации системе поддержки SQL. Это приводит к 
переключению контекста между PL|SQL и SQL для каждоый строки в сборной конструкции.

Oracle8i и выше позволяет передавать все строки сборной конструкции системе поддержки SQL с помощью одной операции,
оставляя только одно переключение контекста. Это называется "массовым соединением", оно выполняется с помощью оператора FORALL.

Пример:

DECLARE 
  TYPE t_numbers IS TABLE OF temp_table.num_col%TYPE;
  TYPE t_string IS TABLE OF temp_table.char_col%TYPE;
  v_number t_numbers:=t_numbers(1);
  v_string t_string:=t_strings(1);
  --Печатаем общее число строк таблицы temp_table;
  PROCEDURE PrintTotalRows(p_message IN VARCHAR2) IS 
    v_count NUMBER:
    BEGIN
      SELECT count(*)
        INTO v_count
        FROM temp_table;
      DMBS_OUTPUT.PUT_LINE(p_message||':count is'||v_count);
    END PrintTotalRows;
BEGIN
  DELETE FROM temp_table;
  --заполняем вложенные таблицы pl\sql, используя 1000 значений.
  v_Numbers.EXTEND(1000);
  v_Strings.EXTEND(1000);
  FOR v_Count IN 1..1000 LOOP
    v_Numbers(v_count):=v_count;
    v_strings(v_count):='Element#'||v_count;
  END LOOP;
  --Внесём изменения данных все 1000 элементов с помощью оператора FORALL
  FORALL v_count IN 1..1000
    INSERT INTO temp_table VALUES
      (v_numbers(v_count), v_string(v_count));
      --теперь должно быть 1000 строк
    PrintTotalRows('After first insert');
    --снова внесём в базу данных элементы с 501 по 1000
  FORALL v_count IN 501..1000
    INSERT INTO temp_table VALUES
      (v_Numbers(v_count), v_strings(v_count));
    --Теперь у нас должно быть 1500 строк 
    PrintTotalRows('After second insert');
    --обновим все строки
  FORALL v_count IN 1..1000
    UPDATE temp_table
      SET char_col = 'Changed!';
      WHERE num_col = v_NUmbers(v_count);
  --Несмотря на то, что имеется только 1000 элементов, этот оператор 
  --обновляет 1500 строк, так как предложение WHERE соответствует 2 строкам
  --для каждой из последних 500 строк.
  
  DBMS_OUTPUT.PUT_LINE(
    'Update processed'|| SQL%ROWCOUNT||'rows.');
    
 --Аналогично, этот DELETE удалит 300 строк
 FORALL v_count IN 401..600
  DELETE FROM tempjtable
  WHERE num_col = v_Numbers(v_count);
 --Поэтому должно остаться 1200 строк.
 PrintTotalRows('After delete');
 
END;

Результатом выполнения примера будет следующее:

After first insert: Count is 1000
After second insert: Count is 1500
Update processed 1500 rows
After delete: count 1200

FORALL синтаксис аналогичен циклу FOR. Он может использоваться для 
сборных конструкций любого типа и для операторов INSERT, DELETE и UPDATE.
Определяемый в FORALL диапазон должен быть непрерывным, и все элементы в этом диапазоне должны существовать.
