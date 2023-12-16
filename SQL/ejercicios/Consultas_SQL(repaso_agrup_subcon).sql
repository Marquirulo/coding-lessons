/*Ej1*/
SELECT especialidad, COUNT(especialidad)
    FROM profesores
GROUP BY especialidad
HAVING COUNT(especialidad) = (SELECT MIN(COUNT(especialidad))
                                FROM profesores
                            GROUP BY especialidad);

/*EJ2*/
SELECT estante, SUM(ejemplares)
    FROM libreria
GROUP BY estante
HAVING SUM(ejemplares) = (SELECT MAX(SUM(ejemplares))
                                FROM libreria
                            GROUP BY estante);

/*EJ3*/
SELECT d.dept_no, d.dnombre
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND e.oficio = 'EMPLEADO'
GROUP BY d.dept_no, d.dnombre
HAVING COUNT(1) = (SELECT MAX(COUNT(oficio))
                        FROM emple
                    WHERE oficio = 'EMPLEADO'
                    GROUP BY dept_no);
                              
/*EJ4*/
SELECT d.dept_no, d.dnombre
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND e.oficio = 'ANALISTA'
GROUP BY d.dept_no, d.dnombre
HAVING COUNT(1) IN (SELECT MAX(COUNT(oficio))
                        FROM emple
                    WHERE oficio = 'ANALISTA'
                    GROUP BY dept_no);
                    
/*EJ5*/
SELECT d.dept_no, d.dnombre
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
GROUP BY d.dept_no, d.dnombre
HAVING AVG(e.salario) >= (SELECT AVG(salario)
                                FROM emple);
                                
/*** JARDINERIA ****/
/*EJ1*/
SELECT e.nombre
    FROM empleado e, cliente c
WHERE e.codigo_empleado = c.CODIGO_EMPLEADO_REP_VENTAS
GROUP BY e.nombre
    HAVING (SELECT COUNT(CODIGO_EMPLEADO_REP_VENTAS)
                FROM cliente
            WHERE CODIGO_EMPLEADO_REP_VENTAS = '22') < COUNT(CODIGO_EMPLEADO_REP_VENTAS);
                                                        
/*EJ2*/
SELECT e.nombre, SUM(d.cantidad)
    FROM empleado e, detalle_pedido d, cliente c, pedido p
WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
    AND p.codigo_cliente = c.codigo_cliente
    AND p.codigo_pedido = d.codigo_pedido
GROUP BY e.nombre
    HAVING SUM(d.cantidad) > 100;
    
/*EJ3*/
SELECT *
    FROM ;
