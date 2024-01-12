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
/*Ej14*/
/*Ej15*/
/*Ej16*/
/*Ej17*/
/*Ej18*/
/*Ej19*/
/*Ej20*/
/*Ej21*/
/*Ej22*/
/*Ej23*/
/*Ej24*/
/*Ej25*/
/*Ej26*/
/*Ej27*/
/*Ej28*/
/*Ej29*/
/*Ej30*/
/*Ej31*/ 
/*Ej32*/ 
/*Ej33*/ 
/*Ej34*/ 
/*Ej35*/ 
/*Ej36*/ 
/*Ej37*/ 
/*Ej38*/ 
/*Ej39*/ 
/*Ej40*/
