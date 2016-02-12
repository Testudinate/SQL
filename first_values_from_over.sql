  
  select m.id 
       , FIRST_VALUE (m.id) OVER (PARTITION BY m.id ORDER BY m.date DESC) 
    from m
