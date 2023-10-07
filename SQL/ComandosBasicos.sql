-- CREAR UNA TABLA NUEVA, INDICAR LOS DISTINTOS CAMPOS QUE LA COMPONEN Y EL TIPO DE DATOS A ALMACENAR EN CADA UNO --
CREATE TABLE empleados (
    id INTEGER,
    nombre TEXT,
    edad INTEGER
);


-- AÑADIR REGISTROS A LA TABLA INDICANDO EL VALOR DE CADA CAMPO --
INSERT INTO empleados (id, nombre, edad)
VALUES (1, 'Julio Perez', 31);


-- VER VALORES DE LOS CAMPOS DE UNA TABLA --
SELECT nombre, edad -- Selecciono solo los campos que quiero ver
FROM empleados;     -- Indico la tabla que quiero ver los campos

SELECT *        -- Selecciona todos los campos
FROM empleados;

-- 
ALTER TABLE empleados -- Permite modificar la tabla indicada
ADD COLUMN twitter TEXT; -- Añade un campo nuevo a la tabla (Este campo se marcará como NULL en los registros ya existentes)

-- ACTUALIZAR DATOS DE CAMPOS DE UN REGISTRO --
UPDATE empleados            -- Permite editar un registro de la tabla indicada
SET twitter = '@juliop22'   -- Indica la columna a editar y el valor que va a tomar
WHERE id = 1;               -- Indica que registros cambiar mediante una condicion

/*
Los Operadores para WHERE son:
    =   equal to
    !=  not equal to
    >   greater than
    <   less than
    >=  greater than or equal to
    <=  less than or equal to
    IS NULL      Muestra los datos nulos
    IS NOT NULL  Muestra los datos no nulos
    OR  Obliga a que se cumpla al menos una condicion
    AND Obliga a que se cumplan todas las condiciones
*/

-- BORRAR REGISTROS DE TABLA --
DELETE FROM empleados -- Indica la tabla de la cual se va a borrar
WHERE twitter IS NULL; 


-- CONSTRAINTS / RESTRICCIONES --
CREATE TABLE empleados (
   id INTEGER PRIMARY KEY,                  -- Indica el campo como PK
   nombre TEXT UNIQUE,                      -- Indica que ese campo no puede tener dos valores iguales
   inicio_contrato TEXT NOT NULL,           -- Indica que el campo no puede ser NULL
   fin_contrato TEXT DEFAULT 'No Aplica'    -- Indica el valor que cojera si el campo está vacío
);


-- VISUALIZAR LAS QUERIES "AMIGABLEMENTE"--
SELECT nombre AS 'Nombre' -- Al mostrar la query modifica el nombre del campo por el indicado entre comillas ''
FROM empleados;

SELECT DISTINCT herramientas -- Muestra los valores que toma ese campo (sin duplicados)
FROM inventario;

SELECT *
FROM empleados
WHERE inicio_contrato LIKE '201_' -- Selecciona los valores que cumplan parcialmente la condicion (permitiendo añadir carácteres libres y siendo independiente mayus/minus)

/*
Carácteres Libres:
_   ->  Se sustituye por un carácter
%   ->  Se sustituye por 0 o + carácteres
*/

SELECT *
FROM empleados
WHERE inicio_contrato BETWEEN 1999 AND 2010 -- Selecciona los valores comprendidos entre esos dos datos.

-- CASOS CON LETRAS --
WHERE nombre BETWEEN 'A' AND 'C' -- En este caso cogeria todos los nombres que empiezan por A y B pero no los que empiezan por C (salvo que hubiese alfuno que fuese solo C)

SELECT *
FROM empleados
ORDER BY nombre; -- Ordena los resultado por el campo indicado, se puede añadir DESC (Z-A) para invertir el orden (Por defecto esta en ASC)

SELECT *
FROM empleados
LIMIT 10;       -- Limita el nº de coincidencias a mostrar

SELECT name,
 CASE                                           
  WHEN inicio_contrato < 1990 THEN 'Experto'
  WHEN inicio_contrato < 2010 THEN 'Senior'
  ELSE 'Junior'
 END    -- Se puede modificar el nombre de la columna usando END AS 'contrato'
FROM movies; -- (CASE END)Es la forma de SQL de manejar los IF_THEN y ELSE