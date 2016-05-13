Исходные данные

База данных платежной системы `billing_simple` состоит из одной таблицы `billing` следующей структуры:

CREATE TABLE IF NOT EXISTS `billing_simple`.`billing` (
  `payer_email` VARCHAR(255) NULL,
  `recipient_email` VARCHAR(255) NULL,
  `sum` DECIMAL(18,2) NULL,
  `currency` VARCHAR(3) NULL,
  `billing_date` DATE NULL,
  `comment` TEXT NULL)
ENGINE = InnoDB;

Задание

Выведите поступления денег от пользователя с email 'vasya@mail.com'.
В результат включите все столбцы таблицы и не меняйте порядка их вывода. 
Если, конечно, хотите успешно пройти проверку результата запроса )

select * from billing where payer_email = 'vasya@mail.com';
