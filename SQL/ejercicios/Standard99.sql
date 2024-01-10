/*EJ1*/
SELECT s.nombre_sala, p.nombre_peli
    FROM sala s
JOIN peliculas p USING (cod_peli);

/*EJ2*/
SELECT *
    FROM sala s
LEFT JOIN peliculas p USING (cod_peli);

/*EJ3*/
SELECT *
    FROM sala s
RIGHT JOIN peliculas p USING (cod_peli);

/*EJ4*/
SELECT p.nombre_peli
    FROM sala s
RIGHT JOIN peliculas p USING (cod_peli)
WHERE s.cod_sala IS NULL;
