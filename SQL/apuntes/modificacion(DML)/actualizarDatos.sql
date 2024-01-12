/*Para actualizar los registros ya existentes usamos UPDATE*/

/**** UPDATE ****/
UPDATE employees
  SET name = 'Jack', salary = 2500
[WHERE ID=117]; --Si no hay condición se aplica a todos los registros.

/**** UPDATE CON SUBCONSULTAS ****/
-- Usa una subconsulta para todas las columnas
  UPDATE jpbs
    SET (name, salary) = (SELECT first_name , salary
                            FROM employees
                          WHERE employee_id = 148)
  [WHERE id = 114];

-- Uso una subconsulta para cada columna que quiero actualizar
  UPDATE tabla
    SET name = (SELECT first_name
                  FROM employees
                WHERE employee_id = 148)
    SET salary = (SELECT salary
                    FROM employees
                  WHERE employee_id = 130)
  [WHERE condición];

-- Uso una subconsulta en la condición
  UPDATE jobs
    SET salario = salario*0,5 ,comision = 0
  [WHERE dept_no in (SELECT dept_no
                        FROM emple
                    GROUP BY dept_no
                    HAVING COUNT(1) = (SELECT MAX(COUNT(1))
                                          FROM EMPLE
                                       GROUP BY dept_no))];
