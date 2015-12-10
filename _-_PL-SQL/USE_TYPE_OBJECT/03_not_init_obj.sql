DECLARE
 emp employee_typ; -- emp по умолчанию null
BEGIN
 IF emp IS NULL THEN 
  DBMS_OUTPUT.PUT_LINE('emp is NULL #1'); 
 END IF;
 IF emp.employee_id IS NULL THEN 
   DBMS_OUTPUT.PUT_LINE('emp.employee_id is NULL #1');
 END IF;
 emp.employee_id := 330;
 IF emp IS NULL THEN 
  DBMS_OUTPUT.PUT_LINE('emp is NULL #2'); 
 END IF;
 IF emp.employee_id IS NULL THEN
  DBMS_OUTPUT.PUT_LINE('emp.employee_id is NULL #2');
 END IF;
 emp := employee_typ(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
                                                                   address_typ(NULL, NULL, NULL, NULL));
 -- emp := NULL; -- это бы сделало следующее выражение равным TRUE
 IF emp IS NULL THEN 
  DBMS_OUTPUT.PUT_LINE('emp is NULL #3'); 
 END IF;
 IF emp.employee_id IS NULL THEN
  DBMS_OUTPUT.PUT_LINE('emp.employee_id is NULL #3');
 END IF;
EXCEPTION
  WHEN ACCESS_INTO_NULL THEN
   DBMS_OUTPUT.PUT_LINE('Cannot assign value to NULL object');
END;
/

Вывод сообщений: emp is NULL #1 emp.employee_id is NULL #1 emp is NULL #2 emp.employee_id is NULL #3 
Вызов методов неинициализированного объекта вызывает предопределенное исключение NULL_SELF_DISPATCH. Если атрибуты неинициализированного объекта передаются как параметры in, то они считаются равными null. Если такие атрибуты передаются как параметры OUT или IN OUT, то генерируется исключение при попытке присвоить им значение.
