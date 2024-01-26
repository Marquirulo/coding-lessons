/**** DROP ****/
  DROP TABLE provincias [PURGE]; --El PURGE simula una papelera

/**** CASCADE ****/
DROP TABLE provincias CASCADE CONSTRAINT; --Borra la tabla usando el cascade
