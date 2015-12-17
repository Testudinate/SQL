Механизм кеширования результатов подзапросов - Scalar Subquery Caching

Перевод поста про неочевидную особенность Oracle.

Создаем таблицу FRUITS.
CREATE TABLE fruits (fruit_name varchar2(30));
Заполняем таблицу данными: 5 бананов, 7 яблок, 3 черники.
INSERT INTO fruits VALUES ('banana');
INSERT INTO fruits VALUES ('banana');
INSERT INTO fruits VALUES ('banana');
INSERT INTO fruits VALUES ('banana');
INSERT INTO fruits VALUES ('banana');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('apple');
INSERT INTO fruits VALUES ('blueberry');
INSERT INTO fruits VALUES ('blueberry');
INSERT INTO fruits VALUES ('blueberry');
Чтобы знать сколько раз запускалась наша функция, создаем сиквенс.
CREATE SEQUENCE seq START WITH 1;
Напишем функцию, которая возвращает цвет фрукта (входной параметр) и инкрементирует сиквенс, как индикатор своей работы.
CREATE OR REPLACE FUNCTION get_colour (p_fruit_name IN varchar2)
RETURN varchar2
IS
l_num number;
BEGIN
SELECT seq.nextval INTO l_num FROM dual;

CASE p_fruit_name
WHEN 'banana' THEN RETURN 'yellow';
WHEN 'apple' THEN RETURN 'green';
WHEN 'blueberry' THEN RETURN 'blue';
END CASE;
END get_colour;
/
Узнаем цвет каждого фрукта в нашей таблице

SELECT get_colour(fruit_name) FROM fruits;
Вопрос: Что вернет этот запрос?
SELECT seq.nextval FROM dual;
Так, в таблице 15 записей, значит функция будет вызвана 15 раз. И поскольку мы выполняем seq.nextval, 
то можем ожидать, что результат будет 16. Давайте сбросим сиквенс для проведения еще одного эксперимента
DROP SEQUENCE seq;
CREATE SEQUENCE seq START WITH 1;
И опять используем нашу функцию, чтобы получить цвет фруктов в таблице, но на этот раз обернем 
ее выражением SELECT FROM dual.
SELECT (SELECT get_colour(fruit_name) FROM dual)
FROM fruits;
Вопрос: что на этот раз вернет запрос?
SELECT seq.nextval FROM dual;
Можно предположить, что как и в предыдущий раз функция будет выполнена 15 раз и запрос опять вернет 16. 
Однако, это не так.
Мы обнаруживаем, что возвращается число 4, а это означает, что функция была вызвана всего 3 раза.
Что же произошло?
Почему функция выполняется всего 3 раза, хотя мы передаем ей каждую запись таблицы, а это 15 фруктов, 
и при этом в целом запрос возвращает верные данные? Ответ заключается в механизме кеширования 
результатов подзапросов - Scalar Subquery Caching. Результат запроса SELECT some_function(x) 
FROM dual будет сохранен для каждого значения параметра x. Таким образом, фактически 
функция будет выполняться только для разных входных параметров, а т.к. у нас всего 
три разных фрукта (банан, яблоко, черника), то и функция будет выполнена всего три раза.
А здесь здесь Том Кайт рассказывает об этом.

Прим. переводчика.
Для полноты картины следует упомянуть о возможности объявить эту функцию как 
DETERMINISTIC, тогда и в запросе SELECT get_colour(fruit_name) FROM fruits; 
она будет выполнена всего 3 раза.
