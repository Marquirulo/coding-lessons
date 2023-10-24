/*--TIPOS DE DATOS--
NUMBER(precision, escala)  -> Numérico (precision = Longitud total del nº, escala = Nº de decimales)
CHAR(longitud)  -> Alfanumerico de longitud fija (Si tengo 10 y almaceno 5 rellena los otros 5)
VARCHAR2(longitud_max)  -> Alfanumerico de longitud variable
DATE -> Fecha
*/

/*--CONSULTAS--*/
SELECT {* | first_name, last_name} --Elijo los campos de la tabla que quiero ver (*) indica todos los campos
  FROM employees  --Elijo de que tabla quiero hacer la consulta

/*--INDEXACION--*/ --En algunas sentencias no necesito escribir el nombre del campo, sirve con poner su posición en la consulta
SELECT first_name, last_name
  FROM employees
ORDER BY 2; --EJ. Aqui ordenara por la columna last_name

/*--ORDENAR--*/
SELECT first_name, last_name
  FROM employees
ORDER BY campo1 [ASC(df) | DESC];

/*--ALIAS--*/
SELECT first_name [AS(df)] Nombre, last_name [AS(df)] Apellido
  FROM employees;

/*--FILTROS--*/
SELECT *
  FROM employees
WHERE salary {SIMBOLOS ARITM} 1000 
	[AND | OR] job_id {SIMBOLOS ARITM} 'texto'; --SIMBOLOS ARITM: { = | < | > | >= | <= | <> | != }
--
SELECT DISTINCT job_id --Esto filtra todos los registros iguales en 1 (Sirve para saber las posibilidades de un campo)
	FROM employees;

/*--CAMPOS CALCULADOS--*/
SELECT first_name Nombre, last_name Apellido, salary Salario, salary*1.05 Incremento --El campo Incremento es un campo creado mediante un CALC_ARITM
    FROM employees
WHERE department_id = 30;

SELECT first_name ||' '|| last_name Nombre_Completo --Concatenamos Nombre y Apellido en un único campo
    FROM employees
WHERE department_id = 30;
