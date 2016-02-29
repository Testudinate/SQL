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
  --Внесём изменения
  
