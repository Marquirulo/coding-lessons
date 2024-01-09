JOIN = (DF) INNER JOIN
  
/*La sintaxis completa es:*/
SELECT tabla1.columna1, tabl1.columna2,...
tabla2.columna1, tabla2.columna2,... 
  FROM tabla1
[CROSS JOIN tabla2]|
[NATURAL JOIN tabla2]|
[[LEFT|RIGHT|FULL OUTER] JOIN tabla2 USING(columna)]|
[[LEFT|RIGHT|FULL OUTER] JOIN tabla2 ON (tabla1.columa=tabla2.columna)]
  
/**** CROSS JOIN ****/
/**** NATURAL JOIN ****/
/*Cruza información por un campo con el mismo nombre (DF), es decir unifica las dos tablas "fusionando" las columnas*/
  SELECT cod_centro, dni
    FROM centros
  NATURAL JOIN profesores;

/**** JOIN USING ****/
/*Permite asociar tablas indicando la columna a relacionar*/
  SELECT e.nombre, a.nombre
    FROM empresas e
  JOIN alumnos a USING(cif); //Para PK compuesta USING(cif, nombre)

/**** JOIN ON ****/
/*Permite indicar la condición (al estilo de SQL 92) que relaciona las tablas.*/
  SELECT cod_centro, dni
    FROM centros
  JOIN profesores p ON(c.cod_centro=p.cod_centro);

/**** OUTER JOIN ****/
/*Fuerza los elementos que no tengan relacion a aparecer como NULL*/
/*Se puede condicinonar el resultado con WHERE ... IS NULL para ver los resultados sin correspondencia*/

  /**** LEFT JOIN ****/
  /*Saca los elementos en comun + los elementos de la primera tabla (empleados)*/
  SELECT nombre, apellido, departamento
    FROM empleados
  LEFT OUTER JOIN departamentos
  ON empleados.cod_dep=departamentos.cod_dep
  ORDER BY nombre,apellido,departamento;

  /**** RIGHT JOIN ****/
  /*Saca los elementos en comun + los elementos de la segunda tabla (departamentos)*/
  SELECT nombre, apellido, departamento
    FROM empleados
  RIGHT OUTER JOIN departamentos
  ON empleados.cod_dep=departamentos.cod_dep
  ORDER BY nombre,apellido,departamento;

  /**** FULL OUTER JOIN ****/
  /*Saca los elementos en comun y no en comun*/
  SELECT nombre, apellido, departamento
    FROM empleados
  FULL OUTER JOIN departamentos
  ON empleados.cod_dep=departamentos.cod_dep;
