/**** ALTER ****/
  ALTER TABLE NOMBRETABLA
    [ADD (COLUMNA [, COLUMNA]...)] -- Añade una columna
    [MODIFY (COLUMNA [, COLUMNA]...)] -- Modifica una olumna
    [DROP COLUMN (COLUMNA [, COLUMNA]...)] -- Elimina una columna
    [ADD CONSTRAINT (COLUMNA [, COLUMNA]...)] -- Añade una restriccion
    [DROP CONSTRAINT (COLUMNA [, COLUMNA]...)]; -- Elimina una restriccion

  /*ADD*/
    /*Si la columna a añadir NO está definida como NOT NULL, se puede añadir en cualquier momento.*/
        ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20);
  /*● Si la nueva columna está definida como NOT NULL (Y la tabla tiene datos) tenemos 2 opciones:
      ○ Añadimos la columna sin especificar NOT NULL, damos un valor a cada una de las filas y modificamos la columna a NOT NULL.*/
          ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20);
          -- Añadimos datos a todos los campos
          ALTER TABLE EJEMPLO MODIFY PROV NOT NULL;
    /*○ Fijamos un valor por defecto y ponemos NOT NULL en la misma sentencia:*/
          ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20) DEFAULT ‘Madrid’ NOT NULL;
