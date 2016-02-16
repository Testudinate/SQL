Вложенные циклы и метки

1) Возможно несколько уровней вложенных циклов
2) Для различия циклов и блоков испольуются метки
3) Выход из внешнего цикла осуществляется с помощью оператора EXIT, содержащего ссылку на метку

Вложенные циклы и метки: пример

Выход из внешнего цикла по значениям, вычисленным во внутреннем блоке

...BEGIN 

<<outer_loop>> LOOP
v_counter:=v_counter+1;
EXIT WHEN v_counter >10;
<<inner_loop>> LOOP
  ...
  EXIT Outer_loop WHEN total_done = 'Yes';
    --leave both loop
  EXIT WHEN inner_done = 'Yes';
    --leave inner loop only
  ...
  END LOOP Inner_loop;
  ...
END LOOP Outer_loop;
END;
