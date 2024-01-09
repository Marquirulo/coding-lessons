/*EJ1*/
SELECT nombre FROM alum
UNION
SELECT nombre FROM nuevos;

/*EJ2*/
SELECT nombre FROM alum
UNION ALL
SELECT nombre FROM antiguos;

/*EJ3*/
SELECT nombre, localidad FROM alum
MINUS
SELECT nombre, localidad FROM antiguos;

/*EJ4*/
(SELECT nombre FROM alum
INTERSECT
SELECT nombre FROM antiguos)
UNION ALL
(SELECT nombre FROM alum
INTERSECT 
SELECT nombre FROM nuevos);

/*EJ5*/
(SELECT nombre FROM alum
INTERSECT
SELECT nombre FROM antiguos)
UNION 
(SELECT nombre FROM alum
INTERSECT 
SELECT nombre FROM nuevos);

/*EJ6*/
(SELECT nombre FROM alum
MINUS
SELECT nombre FROM antiguos)
MINUS 
SELECT nombre FROM nuevos;

/*EJ7*/
SELECT * 
    FROM empleado
WHERE codigo_oficina = 'BOS-USA'
    AND codigo_jefe != (SELECT codigo_empleado
                            FROM empleado
                        WHERE codigo_oficina = 'BOS-USA'
                        INTERSECT
                        SELECT codigo_jefe
                            FROM empleado
                        WHERE codigo_oficina = 'BOS-USA');   
