/*** PRODUCTO CARTESIANO ***/ -- Esto muestra todas las combinaciones posibles de varios campos indep. de la relación
SELECT first_name, last_name, department_name
    FROM employees, departments;

/*** INNER JOIN (TABLAS RELACIONADAS POR FK) ***/
-- Si quiero mostrar un campo que este en ambas tablas hay que ponerle delante la tabla a la que pertenece
SELECT first_name, last_name, department_name, emp.department_id
  FROM employees emp, departments dep -- Se puede poner alias también a las tablas para hacer referencias mas faciles                          
WHERE emp.department_id = dep.department_id;

/*** SELF JOIN (RELACIONES REFLEXIVAS) ***/
select e.employee_id, e.last_name, j.employee_id, j.last_name
from employees e, employees j    -- Hay que iniciar la tabla dos veces con distintos alias
where e.manager_id = j.employee_id;

/*** LEFT Y RIGHT JOIN (Todos los valores de la X tabla relacionandolos con la Y 
                                                y si no tienen relación pone NULL) ***/
    /*El (+) indica cual es la tabla que se va a agregar (Y), es decir la que podrá dar NULL*/
    -- LEFT JOIN -- 
    SELECT e.apellido, d.dept_no, d.dnombre
        FROM emple e, depart d
    WHERE e.dept_no = d.dept_no(+);

    -- RIGHT JOIN --
    SELECT e.apellido, d.dept_no, d.dnombre
        FROM emple e, depart d
    WHERE e.dept_no(+) = d.dept_no;

/*** SUBCONSULTAS ***/
        /* Permite usar el resultado de una consulta en otra en WHEN, HAVING, FROM y JOIN
        Pueden devolver un único valor (columna) y debe ser del mismo tipo que la comparacion usan los operadores logicos o IN
        También pueden devolver varias, pero enonces habria que usar ANY, SOME, ALL, IN, NOT IN */
    -- IN --
    SELECT apellido
        FROM emple
    WHERE oficio IN(SELECT DISTINCT oficio
                       FROM emple
                    WHERE dept_no = 20);

    -- ALL --
    SELECT *
        FROM emple
    WHERE salario < ALL (SELECT salario
                            FROM emple
                         WHERE dept_no = 30);

    -- ANY --
    SELECT *
        FROM emple
    WHERE salario = ANY (SELECT salario
                            FROM emple
                         WHERE dept_no = 30);

        /*Si quiero poder coger varias columnas*/
    SELECT *
        FROM emple
    WHERE (oficio, salario) IN (SELECT oficio, salario
                                    FROM emple
                                WHERE dept_no = 30);
