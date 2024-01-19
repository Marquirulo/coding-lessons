/*Ej1*/
INSERT INTO profesores
    VALUES (45, 123, 'Quiroga Martín', 'INFORMÁTICA');

/*Ej2*/
INSERT INTO profesores (apellidos, especialidad)
    VALUES ('Seco Jiménez', 'LENGUA');

/*Ej3*/
INSERT INTO profesores
    VALUES (22, 23444800, 'González Sevilla', 'HISTORIA');

/*Ej4*/ 
INSERT INTO profesores (especialidad) 
    VALUES ('HISTORIA DEL ANTIGUO EGIPTO');

/*Ej5*/
INSERT INTO emple30
    VALUES (SELECT *
                FROM emple
            WHERE dept_no = 30);

/*Ej6*/
INSERT INTO nombres (nombre)
    VALUES (SELECT emple.apellido
                FROM emple
            WHERE dept_no = 20);
           
/*Ej7*/
INSERT INTO emple (apellido, emp_no, dept_no, fecha_alt)
    VALUES ('GARCÍA', 1111, (SELECT MAX(dept_no)
                                FROM emple), sysdate);

/*Ej8*/
INSERT INTO emple
    SELECT 1112, 'QUIROGA', oficio, dir, fecha_alt, salario, comision, dept_no
        FROM emple
    WHERE emp_no = 7788;

/*Ej9*/
UPDATE centros
  SET direccion = 'C/Pilón 13', num_plazas = 295
WHERE cod_centro = 22;

/*Ej10*/
UPDATE centros
  SET direccion = 'C/Pilón 13', num_plazas = 295;

/*Ej11*/
UPDATE centros
  SET (direccion,  num_plazas) = (SELECT direccion, num_plazas
                                    FROM centros
                                  WHERE cod_centro = 50)
WHERE cod_centro = 10;

/*Ej12*/
UPDATE emple
    SET salario = salario * 0.5, comision = 0
WHERE dept_no in (SELECT dept_no
                    FROM emple
                  GROUP BY dept_no
                  HAVING COUNT(1) = (SELECT MAX(COUNT(1))
                                        FROM EMPLE
                                   GROUP BY dept_no));
                                   
/*Ej13*/
UPDATE emple
    SET salario = (SELECT 2*salario
                    FROM emple
                    WHERE emp_no = 7369),
        apellido = LOWER(apellido)
WHERE dept_no = (SELECT dept_no
                    FROM depart
                WHERE UPPER(depart.dnombre) = 'CONTABILIDAD');

/*Ej14*/
DELETE FROM centros
WHERE cod_centro = 50;

/*Ej15*/
DELETE FROM centros;

/*Ej16*/
DELETE FROM libreria lib
WHERE ejemplares <= (SELECT AVG(ejemplares)
                        FROM libreria
                    WHERE lib.estante = libreria.estante);

/*Ej17*/
DELETE FROM depart
WHERE dept_no IN (SELECT dept_no
                    FROM emple
                  GROUP BY dept_no
                  HAVING COUNT(emp_no) < 4);
                  
/*Ej18*/
INSERT INTO coches VALUES ('Ferrari');
INSERT INTO coches VALUES ('Renault');

/*Ej19*/
UPDATE coches
    SET nombre = 'SEAT IBIZA'
WHERE UPPER(nombre) = 'SEAT';

/*Ej20*/
INSERT INTO alum   
SELECT distinct * 
    FROM nuevos
WHERE nuevos.nombre NOT IN (SELECT alum.nombre FROM alum);

/*Ej21*/
DELETE FROM alum
WHERE nombre IN (SELECT nombre FROM antiguos);

/*Ej22 OjO*/
INSERT INTO EMPLE (emp_no, apellido, fecha_alt, salario, oficio, dir, comision, dept_no)
SELECT 200, 'SAAVEDRA', SYSDATE, salario+salario*0.2, oficio, dir, comision, dept_no
     FROM emple
WHERE emp_no = 7521;

/*Ej23*/
UPDATE emple
    SET dept_no = (SELECT MIN(dept_no)
                            FROM emple
                          WHERE UPPER(oficio) = 'VENDEDOR'
                          GROUP BY dept_no
                          HAVING COUNT(1) = (SELECT MAX(COUNT(1))
                                                FROM emple
                                            WHERE UPPER(oficio) = 'VENDEDOR'
                                            GROUP BY dept_no))
WHERE UPPER(apellido) = 'SAAVEDRA';                    


/*Ej24*/
DELETE FROM depart
    WHERE dept_no NOT IN (SELECT e.dept_no
                            FROM depart d, emple e
                         WHERE d.dept_no IN e.dept_no
                         GROUP BY e.dept_no);                    

/*Ej25*/
UPDATE centros
    SET num_plazas = num_plazas/2
WHERE cod_centro IN (SELECT cod_centro
                        FROM profesores
                    GROUP BY cod_centro
                    HAVING COUNT(1) < 2);

/*Ej26*/
DELETE centros
WHERE cod_centro IN (SELECT cod_centro
                        FROM personal
                    GROUP BY cod_centro
                    HAVING COUNT(1) = 0);
/*Ej27 NO SE HACE*/
/*Ej28*/
DELETE personal
WHERE cod_centro IN (SELECT cod_centro
                        FROM profesores
                    GROUP BY cod_centro
                    HAVING COUNT(1) < 2)
    AND cod_centro IN (SELECT cod_centro
                        FROM centros
                       WHERE num_plazas < 300);
/*Ej29*/
DELETE FROM profesores
    WHERE dni NOT IN (SELECT dni 
                        FROM personal
                      WHERE funcion = 'PROFESOR');

/*Ej30*/
INSERT INTO articulos VALUES('Chocolate', (SELECT cod_fabricante
                                                FROM fabricantes
                                            WHERE pais = 'FRANCIA'), 0, 'Primera', 0, 0, 5);

/*Ej31*/
INSERT INTO pedidos
    SELECT '1111-A', articulo, cod_fabricante, peso, categoria, sysdate, 20
        FROM ventas
    WHERE articulo = (SELECT articulo
                            FROM ventas
                      GROUP BY articulo
                      HAVING SUM(unidades_vendidas) = (SELECT MAX(SUM(unidades_vendidas))
                                                         FROM ventas
                                                       GROUP BY articulo));

/*Ej32*/
INSERT INTO pedidos
SELECT '2222-A', articulo, cod_fabricante, peso, categoria, TO_DATE('01/02/2021'), 10
    FROM articulos
WHERE existencias > 200
    AND cod_fabricante = (SELECT cod_fabricante
                            FROM fabricantes
                          WHERE UPPER(pais) = 'FRANCIA');

/*Ej33*/
UPDATE articulos
    SET precio_venta = precio_venta * 1.03
WHERE cod_fabricante IN (SELECT cod_fabricante
                            FROM fabricantes
                          WHERE UPPER(pais) = 'ESPAÑA');

/*Ej34*/
DELETE FROM pedidos
    WHERE fecha_pedido < TO_DATE('1/1/2023')
        AND cod_fabricante IN (SELECT cod_fabricante
                            FROM fabricantes
                          WHERE UPPER(pais) = 'BELGICA');

