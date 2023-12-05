/*Ej1*/
SELECT AVG(edad)
    FROM nombres;
/*Ej2*/
SELECT AVG(salario)
    FROM emple
WHERE dept_no = 10;

/*Ej3*/
SELECT COUNT(1)
    FROM emple;
    
/*Ej4*/
SELECT COUNT(1)
    FROM emple
WHERE comision IS NOT NULL;

/*Ej5*/
SELECT MAX(salario)
    FROM emple;
    
/*Ej6*/
SELECT MAX(apellido)
    FROM emple;
    
/*Ej7*/
SELECT SUM(salario)
    FROM emple;
    
/*Ej8*/
SELECT COUNT(DISTINCT oficio)
    FROM emple;
    
/*Ej9*/
SELECT COUNT(DISTINCT oficio)
    FROM emple
WHERE dept_no = 10
    OR dept_no = 20;
    
/*Ej10*/
SELECT LENGTH(titulo), LENGTH(autor)
    FROM mistextos;
    
/*Ej11*/
SELECT COUNT(1)
    FROM centros
WHERE UPPER(tipo_centro) = 'S';

/*Ej12*/
SELECT COUNT(1)
    FROM centros
GROUP BY tipo_centro;

/*Ej13*/
SELECT COUNT(1)
    FROM libreria
WHERE UPPER(tema) LIKE '%A%';

/*Ej14*/
SELECT COUNT(DISTINCT estante)
    FROM libreria;
    
/*Ej15*/
SELECT COUNT(DISTINCT estante)
    FROM libreria
WHERE UPPER(tema) LIKE '%E%';

/*Ej16*/
SELECT *
    FROM libros
ORDER BY LENGTH(titulo);
