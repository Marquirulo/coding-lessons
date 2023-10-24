/*--TIPOS DE DATOS--*/


/*--CONSULTAS--*/
SELECT [* | campo1, campo2] *--Elijo los campos de la tabla que quiero ver (*) indica todos los campos
  FROM tabla1  *--Elijo de que tabla quiero hacer la consulta
ORDER BY campo1 [DESC];

/*--ALIAS--*/
SELECT campo1 [AS] alias1, campo2 [AS] alias2
  FROM tabla1;
