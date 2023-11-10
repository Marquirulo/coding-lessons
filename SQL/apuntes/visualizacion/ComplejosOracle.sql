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
