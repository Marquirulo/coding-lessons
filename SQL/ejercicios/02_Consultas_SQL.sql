/*1*/
SELECT e.*, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND UPPER(d.loc) IN ('MADRID', 'BARCELONA');

/*2*/
SELECT e.apellido, e.oficio, e.emp_no, d.dnombre, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no;    

/*3*/
SELECT e.apellido, e.oficio, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND UPPER(e.oficio) = 'ANALISTA';

/*4*/
SELECT al.apenom, notas.nota
    FROM alumnos al, notas
WHERE al.dni = notas.dni
    AND UPPER(al.pobla) = 'MADRID'
    AND notas.nota < 5;

/*5*/
SELECT p.p_nombre||' '||p.p_apellido NOMBRE
    FROM lugar l, pasajero p
WHERE p.pais_residencia = l.l_codigo
    AND UPPER(l.l_nombre) = 'AUSTRALIA';

/*6*/
SELECT al.apenom, ag.nombre, notas.nota
    FROM alumnos al, asignaturas ag, notas
WHERE al.dni = notas.dni
    AND ag.cod = notas.cod;

/*7*/
SELECT al.apenom, ag.nombre
    FROM alumnos al, asignaturas ag, notas
WHERE al.dni = notas.dni
    AND ag.cod = notas.cod
    AND UPPER(ag.nombre) = 'FOL';

/*8*/
SELECT al.apenom, ag.nombre
    FROM alumnos al, asignaturas ag, notas
WHERE al.dni = notas.dni
    AND ag.cod = notas.cod
    AND UPPER(ag.nombre) LIKE '%O%O%'
    AND UPPER(al.pobla) = 'MADRID';
    
/*9*/
SELECT al.apenom, ag.nombre
    FROM alumnos al, asignaturas ag, notas
WHERE al.dni = notas.dni
    AND ag.cod = notas.cod
    AND notas.nota BETWEEN 7 AND 8
    AND UPPER(ag.nombre) = 'FOL';
-----------------------------------------------------------------------
/**EJ10**/
SELECT l_nombre,
    CASE 
            WHEN l_total_habitantes > 50000000 THEN 'Muy Poblado'
            WHEN l_total_habitantes BETWEEN 20000000 AND 50000000 THEN 'Bastante Poblado'
            ELSE 'Poco Poblado'
    END AS Poblacion
FROM lugar
WHERE l_cod_continente IS NOT NULL;

/**EJ11**/
SELECT p_nombre, p_apellido,
    CASE UPPER(p_perfil)
        WHEN 'BUSINESS CLASS' THEN 'PLATINO'
        WHEN 'PRIMERA_CLASE' THEN 'ORO'
        ELSE 'BRONCE'
    END Categoria
FROM pasajero;

/**EJ12**/
SELECT l_nombre,
    CASE UPPER(l_descripcion)
        WHEN 'Hemisferio Norte' THEN 'NORTE'
        WHEN 'Hemisferio Sur' THEN 'SUR'
    END UBICACION
FROM lugar
WHERE l_cod_continente IS NOT NULL;

/**EJ13**/
SELECT p_nombre||' '||p_apellido Nombre, DECODE(UPPER(p_perfil), 'LOW_COST', 'TURISTA', p_perfil) Perfil
FROM pasajero;

/**EJ14**/
SELECT p_nombre||' '||p_apellido Nombre, NVL(p_perfil, 'SIN_PERFIL') Perfil
FROM pasajero;

/**EJ15**/
SELECT p_nombre||' '||p_apellido Nombre, DECODE(UPPER(p_perfil), NULL, 'SIN_PERFIL', 'LOW_COST','TURISTA' , p_perfil) Perfil
FROM pasajero;
