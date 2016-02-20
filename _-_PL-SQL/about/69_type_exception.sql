I Типы исключений

Предопределённые, возбуждаемые сервером.    }
                                            } Возбуждаются неявно
Непредопределённые, возбуждаемые сервером.  }

Пользовательские                              Возбужаются явно

II Перехват исключений:

EXCEPTION
  WHEN исключение1 [or исключение2 ...] THEN
    оператор1;
    оператор1;
  ...
  WHEN OTHERS THEN
    оператор1;
    оператор1;
...
III Перехват предопределённых исключений

-В секции обработки ссылка на стандартное имя

-Некоторые стандартные имена исключений:
--NO_DATA_FOUND
--TOO_MANY_ROWS
--INVALID_CURSOR
--ZERO_DIVIDE
--DUP_VAL_OF_INDEX

Пример:

PROCEDURE test_exception_1 (v_product_id IN s_product.id%type) IS
  v_id s_product.id%type;
  
BEGIN
  SELECT id INTO v_id FROM s_product WHERE id = v_product_id;
  DELETE FROM s_invertory WHERE product_id = v_product_id;
  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    ROLLBACK;
    text_io.put_line('Product number is invalid');
  WHEN TOO_MANY_ROWS THEN
    ROLLBACK;
    text_io.put_line('Data corraption in table S_PRODUCT');
  WHEN OTHERS THEN
    ROLLBACK;
    text_io.put_line('Other error occurred');
  END;
  
  IV Перехват непредопределённых исключений
  
  Объявление  -> Связывание     -> Ссылка
  
  Привоение      Включение в    
  имени          предложение       Обработка
                 PRAGMA            исключений
                 EXCEPTION_INIT
                                            
  -----------------------------  -------------
  Декларативная секция           Секция обработчика
  
  V Непредопределённое исключение: пример
  
  ...
  DECLARE 
    e_product_r EXCEPTION;
    PRAGMA EXCEPTION_INIT (e_product_r, -2222);
  ...
  BEGIN
  ...
  EXCEPTION
    WHEN e_product_r THEN
    text_io.put_line('Integrity constraint violated');
  ...
  END;

  VI Перехват пользовательских исключений 
  
  Объявление  ->  Возбуждение  -> Ссылка
  
  Присвоение      Явное           
    имени         возбуждение с   Обработка
                  помощью         исключения
                  оператора RAISE
                  
  -----------   ---------------  ------------
  Декларативная  Исполняемая     Секция обработчика
  секция         секция
  
  VII Пользовательское исключение: пример
  
  DECLARE
    e_product_r exception;
  ...
  BEGIN
  ...
    RAISE e_product_r;
  ...
  EXCEPTION
    WHEN e_product_r THEN
      text_io.put_line('Integrity constraint violated');
  ...
  END;
