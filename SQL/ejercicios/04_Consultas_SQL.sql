/** Ej1 **/
SELECT apellido
    FROM emple
WHERE (oficio, salario) IN (SELECT oficio, salario
                                FROM emple
                            WHERE UPPER(apellido) = 'GIL');

/** Ej2 **/
SELECT apellido, oficio
    FROM emple
WHERE dept_no = 20
    AND oficio IN (SELECT e.oficio
                        FROM emple e, depart d
                    WHERE e.dept_no = d.dept_no
                        AND UPPER(d.dnombre) = 'VENTAS');

/** Ej3 **/
SELECT apenom
    FROM alumnos
WHERE dni IN (SELECT notas.dni
                    FROM asignaturas ag, notas
              WHERE ag.cod = notas.cod
                    AND UPPER(ag.nombre) = 'FOL');
    

/** Ej4 **/
SELECT apellido, oficio, salario
    FROM emple
WHERE (dept_no, salario) IN (SELECT dept_no, salario
                                FROM emple
                            WHERE UPPER(apellido) = 'FERNÁNDEZ');

/** Ej5 **/
SELECT apellido, oficio
    FROM emple
WHERE oficio IN (SELECT oficio
                        FROM emple
                   WHERE UPPER(apellido) = 'JIMÉNEZ');

/** Ej6 **/
SELECT *
    FROM libreria
WHERE ejemplares < (SELECT ejemplares
                        FROM libreria
                    WHERE UPPER(tema) = 'MEDICINA'); 

/** Ej7 **/
SELECT apenom
    FROM alumnos
WHERE dni IN (SELECT notas.dni
                    FROM asignaturas ag, notas
              WHERE ag.cod = notas.cod
                    AND notas.nota BETWEEN 7 AND 8
                    AND ag.nombre = 'FOL');

/** Ej8 **/
SELECT nombre
    FROM asignaturas
WHERE cod NOT IN (SELECT cod
                        FROM notas
                  WHERE nota < 5);                

/** Ej9 **/
SELECT apenom
    FROM alumnos
WHERE UPPER(pobla) = 'MADRID'
    AND dni IN (SELECT dni
                    FROM notas
                WHERE nota < 5);

/** Ej10 **/
SELECT salario, apellido
    FROM emple
WHERE apellido = (SELECT MAX(apellido)
                    FROM emple);

/** Ej11 **/
SELECT apellido
    FROM emple
WHERE salario = (SELECT MAX(salario)
                    FROM emple);

/** Ej12 **/
SELECT apellido
    FROM emple
WHERE salario = (SELECT MIN(salario)
                    FROM emple);
                    
/** Ej13 **/
SELECT apellido, dept_no, salario
    FROM emple e
WHERE salario IN (SELECT MAX(salario)
                        FROM emple em
                    WHERE em.dept_no = e.dept_no)
ORDER BY dept_no;

/** Ej14 **/
SELECT apellido, dept_no, salario
    FROM emple e
WHERE salario > (SELECT AVG(salario)
                        FROM emple em
                    WHERE em.dept_no = e.dept_no)
ORDER BY dept_no;

/** Ej15 **/
SELECT DISTINCT apenom
    FROM alumnos
WHERE dni IN (SELECT dni
                FROM notas
              WHERE nota = (SELECT n.nota
                                FROM notas n, asignaturas ag, alumnos a
                            WHERE a.dni = n.dni
                                AND ag.cod = n.cod
                                AND UPPER(a.apenom) = 'DÍAZ FERNÁNDEZ, MARÍA'
                                AND UPPER(ag.nombre) = 'FOL'));
