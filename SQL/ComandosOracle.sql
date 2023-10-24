/*--TIPOS DE DATOS--
NUMBER(precision, escala)  -> Numérico (precision = Longitud total del nº, escala = Nº de decimales)
CHAR(longitud)  -> Alfanumerico de longitud fija (Si tengo 10 y almaceno 5 rellena los otros 5)
VARCHAR2(longitud_max  -> Alfanumerico de longitud variable
DATE -> Fecha
*/

/*--CONSULTAS--*/
SELECT {* | campo1, campo2} --Elijo los campos de la tabla que quiero ver (*) indica todos los campos
  FROM tabla1  --Elijo de que tabla quiero hacer la consulta
ORDER BY campo1 [ASC(DF) | DESC];

/*--ALIAS--*/
SELECT campo1 [AS(DF)] alias1, campo2 [AS(DF)] alias2
  FROM tabla1;

/*--FILTROS--*/
SELECT *
  FROM table1
WHERE campo1 {SIMBOLOS ARITM} 100 
  [AND | OR] campo2 {SIMBOLOS ARITM} 500; --SIMBOLOS ARITM: { = | < | > | >= | <= | <> | != }
