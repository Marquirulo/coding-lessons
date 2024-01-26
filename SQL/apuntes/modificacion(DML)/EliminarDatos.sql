/*Para borrar registros de una tabla usamos DELETE*/
/*Si intentamos borrar datos que son FK en otra tabla dará error de integridad referencial*/
/*Lo anterior se puede solucionar con la opción de integridad al crear la tabla: 
ON DELETE CASCADE
  - NORMAL -> Se borran todos los registros asociados
  - NULL -> los registros donde era FK convierten su valor en NULL
  - POR DEFECTO -> los registros donde era FK convierten su valor en el indicado DF. */

/**** DELETE ****/
  DELETE FROM jobs
  WHERE name = 'Himuro'; -- El WHERE puede utilizar subconsultas

/**** TRUNCATE ****/
  /*Elimina todos los registros de la tabla*/
  TRUNCATE TABLE jobs;
