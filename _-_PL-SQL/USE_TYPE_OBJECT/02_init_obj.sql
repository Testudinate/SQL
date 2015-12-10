DECLARE
 emp employee_typ; -- emp по умолчанию NULL
BEGIN
-- вызов конструктора типа employee_typ
 emp := employee_typ(315, 'Francis', 'Logan', 'FLOGAN',
    '555.777.2222', '01-MAY-04', 'SA_MAN', 11000, .15, 101, 110, 
     address_typ('376 Mission', 'San Francisco', 'CA', '94222'));
 DBMS_OUTPUT.PUT_LINE(emp.first_name || ' ' || emp.last_name); -- display details
 emp.display_address(); -- вызывается метод объекта для вывода данных объекта
END;
