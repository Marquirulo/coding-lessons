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
