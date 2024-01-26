/**** ALTER ****/
  ALTER TABLE NOMBRETABLA(
    [ADD (COLUMNA [, COLUMNA]...)] -- Añade una columna
    [MODIFY (COLUMNA [, COLUMNA]...)] -- Modifica una olumna
    [DROP COLUMN (COLUMNA [, COLUMNA]...)] -- Elimina una columna
    [ADD CONSTRAINT (COLUMNA [, COLUMNA]...)] -- Añade una restriccion
    [DROP CONSTRAINT (COLUMNA [, COLUMNA]...)]); -- Elimina una restriccion

  /*ADD*/
    /*Si la columna a añadir NO está definida como NOT NULL, se puede añadir en cualquier momento.*/
  ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20);
/*● Si la nueva columna está definida como NOT NULL tenemos 2 opciones:
  ○ añadimos la columna sin especificar NOT NULL, damos un valor a cada una de las filas y modificamos la columna a NOT NULL.*/
  ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20); -- Añadimos datos a todos los campos y luego aplicamos el NOT NULL
  /*○ fijamos un valor por defecto y ponemos NOT NULL en la misma sentencia:*/
  ALTER TABLE EJEMPLO ADD PROV VARCHAR2(20) DEFAULT ‘Madrid’ NOT NULL;
