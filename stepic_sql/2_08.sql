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

Добавьте в таблицу одну запись о платеже со следующими значениями:
email плательщика: 'pasha@mail.com'
email получателя: 'katya@mail.com'
сумма: 300.00
валюта: 'EUR'
дата операции: 14.02.2016
комментарий: 'Valentines day present)'

insert into billing (payer_email,recipient_email,sum,currency,billing_date,comment) 
values ('pasha@mail.com','katya@mail.com','300.00','EUR','2016-02-14','Valentines day present)');
