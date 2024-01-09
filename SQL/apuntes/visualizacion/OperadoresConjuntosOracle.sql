/*Estas consultas utilizan al menos dos SELECT cuyos resultados se pueden combinar para formar una única consulta.*/
/*En estas operaciones el número de columnas, el tipo y el orden de dichas columnas debe de ser el mismo en todas las consultas que se combinan*/

/**** UNIONES ****/
/*Junta todos los datos de ambas consultas. ELIMINA DUPLICADOS*/
SELECT emp_no, dept_no FROM clientes
UNION
SELECT emp_no, dept_no FROM socios;

/*Junta todos los datos de ambas consultas. NO ELIMINA DUPLICADOS*/
SELECT emp_no, dept_no FROM clientes
UNION ALL
SELECT emp_no, dept_no FROM socios;

/**** INTERSECCIONES ****/
/*Muestra los registros que existen en ambas consultas*/
SELECT emp_no, dept_no FROM clientes
INTERSECT
SELECT emp_no, dept_no FROM socios;

/**** DIFERENCIAS ****/
/*Muestra los registros de la primera consulta que no están en la segunda*/
SELECT * FROM alum
MINUS
SELECT * FROM antiguos;

/**** COMBINACIONES ****/
/*Podemos combinarlos metiendo entre () el primero que se ejecuta y luego se compara el resultado con el segundo*/
(SELECT nombre FROM alum
INTERSECT
SELECT nombre FROM nuevos)
MINUS
SELECT nombre FROM antiguos;
