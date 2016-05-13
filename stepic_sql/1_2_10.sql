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
Удалите из таблицы записи, где адрес плательщика или адрес получателя установлен в неопределенное значение или пустую строку.

delete from billing 
where ( payer_email ='' or payer_email is null )
   or ( recipient_email = '' or recipient_email is null );
