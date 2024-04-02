/**** CURSORES ****/

  /**** IMPLICITOS ****/
  -- Almacenan un único registro
    SELECT COUNT(1) INTO v_almacen
      FROM ejemplo;

  /**** EXPLICITOS ****/
  /* DECLARE */
  -- Almacenan 1 o + registros
    CURSOR nombrecursor IS 
        SELECT * 
          FROM ejemplo;
  /* BEGIN */
  -- Abrir el cursor
    OPEN nombrecursor;
      [LOOP | WHILE | FOR] -- Luego en la condicion de parada se pueden utilizar los ATRIBUTOS
  -- Recoger info de cada registro (1 a 1)
        FETCH nombrecursor INTO [variable%ROWTYPE|variables] -- Dependiendo del tipo de bucle necesitas varios FETCH, uno para posicionarse en el 1º registro y otro para ir avanzando por los registros.
  -- Cerrar cursor
        -- Sentencias PLSQL
      END LOOP;
    CLOSE nombrecursor
      
  /** EXPLICACION **/
  -- El cursor recorre cada registro uno a uno, almacena los campos en las variables creadas (o una única variable con v_nombre nombreCursor%ROWTYPE) y ejecuta las sentencias SQL indicadas para cada uno
   | col1  |  col2 |
   ------------------   
   | r1c1  |  r1c2 | --> v1 := r1c1; v2 := r1c2; Ó v_rowtype := r1c1,r1c2;
   | r2c1  |  r2c2 | --> v1 := r2c1; v2 := r2c2; Ó v_rowtype := r2c1,r2c2;

  /**** ATRIBUTOS ****/
