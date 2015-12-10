В римере демонстрируется создание объектного типа, тела объекта и таблицы объектных типов 

--1.1 создание объектного типа
CREATE TYPE address_typ AS OBJECT
( 
 street     VARCHAR2(30),
 city      VARCHAR2(20),
 state      CHAR(2),
 postal_code   VARCHAR2(6) 
);
/
--1.2 создание объектного типа
CREATE TYPE employee_typ AS OBJECT 
(
 employee_id    NUMBER(6),
 first_name    VARCHAR2(20),
 last_name     VARCHAR2(25),
 email       VARCHAR2(25),
 phone_number   VARCHAR2(20),
 hire_date     DATE,
 job_id      VARCHAR2(10),
 salary      NUMBER(8,2),
 commission_pct  NUMBER(2,2),
 manager_id    NUMBER(6),
 department_id   NUMBER(4),
 address      address_typ,
 MAP MEMBER FUNCTION get_idno RETURN NUMBER,
 MEMBER PROCEDURE display_address (SELF IN OUT NOCOPY employee_typ) 
);
/
--2. создание тела объекта
CREATE TYPE BODY employee_typ AS
 MAP MEMBER FUNCTION get_idno RETURN NUMBER IS
 BEGIN
  RETURN employee_id;
 END;
 MEMBER PROCEDURE display_address (SELF IN OUT NOCOPY employee_typ) IS
 BEGIN
  DBMS_OUTPUT.PUT_LINE(first_name || ' '|| last_name);
  DBMS_OUTPUT.PUT_LINE(address.street);
  DBMS_OUTPUT.PUT_LINE(address.city || ', '|| address.state || ' '||address.postal_code);
 END;
END;
/
--3. создание таблицы объектных типов
CREATE TABLE employee_tab OF employee_typ;
