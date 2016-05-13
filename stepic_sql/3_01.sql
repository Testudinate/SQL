Исходные данные

База данных учета проектов `project_simple` состоит из одной таблицы `project` следующей структуры:

CREATE TABLE IF NOT EXISTS `project_simple`.`project` (
  `project_name` VARCHAR(255) NULL,
  `client_name` VARCHAR(255) NULL,
  `project_start` DATE NULL,
  `project_finish` DATE NULL,
  `budget` DECIMAL(18,2) NULL)
ENGINE = InnoDB;
Задание

Выведите общее количество заказов компании.

select count(1) from project ;
