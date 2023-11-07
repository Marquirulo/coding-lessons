-- CONTAR RESULTADOS --
SELECT COUNT (*) --Cuenta el número de registros
FROM periodico;

-- SUMAR VALORES NUMERICOS --
SELECT SUM(descargas)
FROM aplicaciones;

-- MAX/MIN --
SELECT MAX(precio)
FROM aplicaciones;

SELECT MIN(precio)
FROM aplicaciones;

--VALOR MEDIO--
SELECT AVG(precio)
FROM aplicaciones;

-- REDONDEO --
SELECT nombre, ROUND(precio, 0) -- El nº indica la cantidad de decimales
FROM aplicaciones;

-- AGRUPAR --
SELECT precio, COUNT(*) -- Siempre debes seleccionar el campo que vas a usar para ordenar de forma indep.
FROM fake_apps
GROUP BY precio;

SELECT ROUND(precio),  
   COUNT(nombre)
FROM aplicaciones
GROUP BY ROUND(precio); -- También se puede agrupar por campos calculados

SELECT categoria, 
   precio,
   AVG(descargas)
FROM aplicaciones
GROUP BY 1, 2; --Otra manera de hacerlo más facil es seleccionando el nº de la opción

-- FILTRAR AGRUPACIONES --
SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10; -- HAVING siempre va despues de GROUP BY pero antes de LIMIT y ORDER BY

-- Se pueden encapsular estas funciones --
SELECT ROUND(AVG(precio),2)
FROM aplicaciones;
