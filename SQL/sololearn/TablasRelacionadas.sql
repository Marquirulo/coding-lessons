-- JUNTAR TABLAS MEDIANTE PK/FK (INNER JOINS) Este JOIN, muestra solo los valores que aparecen en ambas tablas y los relaciona --
SELECT *
FROM periodico
JOIN online                  -- Indico la tabla que quiero unir a la seleccionada con FROM
  ON periodico.id         --Selecciono por donde la voy a unir (Indico la FK unida a la PK)
  = online.id;

-- JUNTAR TABLAS (LEFT JOINS) Este JOIN, muestra todos los valores de la 1ª tabla añadiendo los datos si tienen relación con la 2ª y si no poniendo NULL--
SELECT *
FROM periodico
LEFT JOIN online                --  
  ON periodico.id = online.id;

-- (CROSS JOINS) Este JOIN muestra todas las combinaciones posibles de varios campos indep. de la relación -- 
SELECT camisetas.camiseta_color, 
   pantalon.pantalon_color
FROM camisetas
CROSS JOIN pantalon;
/*
Imaginemos que tengo una BBDD con 3 colores de camisetas y 2 de pantalones,
esto me devolvería una tabla con todas las posibles combinaciones (2*3=6)
shirt_color	| pants_color
white	      | light denim
white	      | black
grey	      | light denim
grey        |	black
olive       |	light denim
olive       |	black
*/

-- JUNTAR DOS TABLAS IGUALES --
SELECT *
FROM newspaper
UNION         -- Para que funcione ambas tablas deben tener los mismos campos y mismos tipos de datos en el mismo orden
SELECT *
FROM online; 

-- USAR TABLAS COMO "CALCULO" --
WITH previous_query AS ( -- Creo una query temporal, en este caso la suma de subscripciones agrupada por cada id_cliente
  SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id            
) -- No incluir ;
SELECT customers.customer_name, previous_query.subscriptions -- Utilizo esta query temporal para trabajar con los datos y modificar
FROM previous_query                                          -- el ID_cliente por el nombre
JOIN customers
ON previous_query.customer_id = customers.customer_id;
