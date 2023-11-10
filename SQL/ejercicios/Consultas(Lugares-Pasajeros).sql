--***** EJ1 *****
SELECT *
    FROM lugar;
    
--***** EJ2 *****
SELECT p_nombre, p_apellido
    FROM pasajero;
    
--***** EJ3 *****
SELECT l_nombre, l_clima
    FROM lugar;
    
--***** EJ4 *****
SELECT l_nombre, l_total_habitantes+100000 INCREMENTO_POBL
    FROM lugar;
    
--***** EJ5 *****
SELECT l_nombre, l_tipo, l_total_habitantes, l_total_habitantes*2 Doble_de_habitantes
    FROM lugar;
    
--***** EJ6 *****
SELECT DISTINCT l_clima
    FROM lugar;
    
--***** EJ7 *****
SELECT DISTINCT p_perfil
    FROM pasajero;
    
--***** EJ8 *****
SELECT DISTINCT p_apellido, p_nombre
    FROM pasajero;
    
--***** EJ9 *****
SELECT p_nombre, p_apellido
    FROM pasajero
WHERE p_perfil = 'TURISTA';

--***** EJ10 *****
SELECT *
    FROM lugar
WHERE l_clima = 'Tropical';

--***** EJ11 *****
SELECT  *
    FROM lugar
WHERE l_total_habitantes > 10000000;

--***** EJ12 *****
SELECT *
    FROM pasajero
WHERE p_fecha_nacimiento BETWEEN '1/1/1970' AND '31/12/1980';
/*select to_date('20/05/2024' ,'dd/mm/yyyy') from dual;*/

--***** EJ13 *****
SELECT p_nombre, p_fecha_nacimiento AS Nacido_el
    FROM pasajero
WHERE p_perfil IN ('BUSINESS CLASS', 'PRIMERA_CLASE');

--***** EJ14 *****
SELECT *
    FROM lugar
WHERE l_clima != 'Mediterraneo';

--***** EJ15 *****
SELECT *
    FROM pasajero
WHERE p_nombre LIKE 'M%';

--***** EJ16 *****
SELECT *
    FROM lugar
WHERE l_nombre LIKE '%a%'
    OR l_nombre LIKE '%A%';

--***** EJ17 *****
SELECT DISTINCT p_apellido
    FROM pasajero
WHERE p_apellido LIKE 'M%ez';

--***** EJ18 *****
SELECT *
    FROM lugar
WHERE l_clima IS NOT NULL;

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
--***** EJ28 *****
--***** EJ29 *****
--***** EJ30 *****
--***** EJ31 *****
--***** EJ32 *****
--***** EJ33 *****
SELECT p.l_nombre, c.l_nombre, p.l_total_habitantes
    FROM lugar p, lugar c
WHERE p.l_cod_continente = c.l_codigo
    and p.l_cod_continente NOT IN (10, 20)
order by p.l_nombre, p.l_total_habitantes;

--***** EJ34 *****
SELECT p.p_nombre, p.p_apellido
    FROM lugar l, pasajero p
WHERE p.pais_residencia = l.l_codigo
    AND UPPER(p.p_apellido) = 'RUIZ'
    AND UPPER(l.l_nombre) <> 'FIYI'
ORDER BY p.p_perfil, p.p_nombre;

--***** EJ35 *****
