--******** EJER1 **********
SELECT emp_no, apellido, oficio, dept_no
    FROM EMPLE
WHERE dept_no = 20
ORDER BY apellido;

--******** EJER2 **********
SELECT *
    FROM EMPLE
WHERE oficio = 'ANALISTA'
ORDER BY emp_no;

--******** EJER3 **********
SELECT *
    FROM EMPLE
WHERE oficio = 'ANALISTA'
    AND dept_no = 20
ORDER BY apellido, emp_no DESC;

--******** EJER4 **********
SELECT *
    FROM EMPLE
WHERE apellido LIKE 'J%';

--******** EJER5 **********
SELECT *
    FROM EMPLE
WHERE apellido LIKE '_R%';

--******** EJER6 **********
SELECT *
    FROM EMPLE
WHERE apellido LIKE 'A%O%';

--******** EJER7 **********
SELECT apellido
    FROM EMPLE
WHERE dept_no IN (10,30);

--******** EJER8 **********
SELECT apellido
    FROM EMPLE
WHERE dept_no NOT IN (10,30);

--******** EJER9 **********
SELECT apellido
    FROM EMPLE
WHERE oficio IN ('VENDEDOR', 'ANALISTA', 'EMPLEADO');

--******** EJER10 **********
SELECT apellido
    FROM EMPLE
WHERE oficio NOT IN ('VENDEDOR', 'ANALISTA', 'EMPLEADO');

--******** EJER11 **********
SELECT apellido, salario
    FROM emple
WHERE salario BETWEEN 150000 AND 200000;

--******** EJER12 **********
SELECT apellido, salario
    FROM emple
WHERE salario NOT BETWEEN 150000 AND 200000;

--******** EJER13 **********
SELECT apellido, salario, dept_no
    FROM emple
WHERE salario > 200000
    AND dept_no IN (10, 20);

--******** EJER14 **********
SELECT *
    FROM emple
WHERE apellido LIKE 'A%'
    AND oficio LIKE '%E%';
    
--******** EJER15 **********
SELECT apellido, salario, dept_no
    FROM emple
WHERE salario > 200000
    AND dept_no IN (10, 20);

--******** EJER16 **********
SELECT salario, comision, salario+comision
    FROM emple;
    
--******** EJER17 ********** 
SELECT nombre_alumno AS NOMBRE, (nota1+nota2+nota3)/3 AS MEDIA
    FROM notas_alumnos;
    
--******** EJER18 ********** 
SELECT nombre_alumno AS NOMBRE
    FROM notas_alumnos
WHERE nota1 = 7
    AND (nota1+nota2+nota3)/3 > 6;

--***** EJ19 *****
SELECT *
    FROM pasajero
WHERE p_perfil IS NULL;

--***** EJ20 *****
SELECT *
    FROM pasajero
WHERE p_fecha_nacimiento BETWEEN '1/1/1975' AND '31/12/1985'
    AND (p_nombre LIKE '%e%' OR p_nombre LIKE 'E%');
    
--***** EJ21 *****
SELECT *
    FROM pasajero
WHERE p_perfil = 'LOW_COST'
    AND p_apellido = 'Ruiz';

--***** EJ22 *****
SELECT *
    FROM lugar
WHERE l_total_habitantes IS NULL
    AND l_nombre LIKE 'K%'
    AND (l_clima IS NULL 
        OR l_clima = 'Mediterraneo');
    
--***** EJ23 *****
SELECT *
    FROM lugar
WHERE l_clima IS NULL
    AND l_nombre LIKE 'Ciudad'
    OR l_total_habitantes < 60000000;

--***** EJ24 *****
SELECT *
    FROM pasajero
WHERE p_fecha_nacimiento > '31/12/1970'
    AND p_perfil = 'BUSINESS CLASS' 
    AND (p_nombre LIKE '%a%' OR p_nombre LIKE '%A%');

--***** EJ25 *****
SELECT *
    FROM lugar
WHERE l_total_habitantes NOT BETWEEN 50000000 AND 100000000
    AND l_cod_continente IN (10, 30)
    AND (l_nombre LIKE '%S%' OR l_nombre LIKE '%s%');

--***** EJ26 *****
SELECT * 
    FROM lugar
ORDER BY l_total_habitantes DESC;

--***** EJ27 *****
SELECT p_nombre||' '||p_apellido Nombre_Apellido
FROM pasajero
ORDER BY p_apellido;

--***** EJ28 *****
SELECT *
FROM lugar
WHERE l_clima = 'Tropical';

--***** EJ29 *****
SELECT *
FROM lugar
ORDER BY l_total_habitantes DESC;

--***** EJ30 *****
SELECT *
FROM pasajero
ORDER BY p_fecha_nacimiento DESC, p_apellido DESC;

--***** EJ31 *****
SELECT *
FROM lugar
WHERE l_tipo = 'CONTINENTE'
ORDER BY l_nombre;

--***** EJ32 *****
SELECT *
FROM pasajero
WHERE p_perfil != 'BUSINESS CLASS'
ORDER BY p_num_telefono, p_apellido;

--***** EJ33 *****
--***** EJ34 *****
--***** EJ35 *****
SELECT *
FROM lugar
WHERE l_total_habitantes > 10000000
    AND l_clima IS NOT NULL
    AND l_descripcion LIKE '%Sur%'
ORDER BY l_nombre, l_total_habitantes DESC;
