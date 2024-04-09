/**** CURSORES ****/

  /**** IMPLICITOS ****/
  -- Almacenan un único registro
    SELECT COUNT(1) INTO v_almacen
      FROM ejemplo;

  /**** EXPLICITOS ****/
  /* DECLARE */
  -- Almacenan 1 o + registros
    CURSOR nombrecursor IS 
        SELECT * 
          FROM ejemplo;
  /* BEGIN */
  -- Abrir el cursor
    OPEN nombrecursor;
      [LOOP | WHILE | FOR] -- Luego en la condicion de parada se pueden utilizar los ATRIBUTOS
  -- Recoger info de cada registro (1 a 1)
        FETCH nombrecursor INTO [variable%ROWTYPE|variables] -- Dependiendo del tipo de bucle necesitas varios FETCH, uno para posicionarse en el 1º registro y otro para ir avanzando por los registros.
  -- Cerrar cursor
        -- Sentencias PLSQL
      END LOOP;
    CLOSE nombrecursor

  /** EXPLICACION **/
  -- El cursor recorre cada registro uno a uno, almacena los campos en las variables creadas (o una única variable con v_nombre nombreCursor%ROWTYPE) y ejecuta las sentencias SQL indicadas para cada uno
   | col1  |  col2 |
   ------------------   
   | r1c1  |  r1c2 | --> v1 := r1c1; v2 := r1c2; Ó v_rowtype := r1c1,r1c2;
   | r2c1  |  r2c2 | --> v1 := r2c1; v2 := r2c2; Ó v_rowtype := r2c1,r2c2;

  /**** ATRIBUTOS ****/
    nombrecursor%FOUND -- Devuelve verdadero si el último FETCH ha recuperado algún valor; en caso contrario devuelve falso; si el cursor no está abierto nos devuelve error (exception INVALID_CURSOR). Si estaba abierto pero no se había ejecutado aún ningún FETCH, devuelve NULL.
    nombrecursor%NOTFOUND -- Hace lo contrario que el atributo anterior, para los casos en los que el cursor está abierto.
    nombrecursor%ROWCOUNT -- Nos devuelve el número de filas recuperadas hasta el momento por el cursor. Si el cursor no está abierto nos devuelve la exception INVALID_CURSOR.
    nombrecursor%ISOPEN -- Devuelve verdadero si el cursor está abierto y falso en otro caso.

/**** EJEMPLO ESTRUCTURA ****/
/* LOOP */
  DECLARE
    v_nombre VARCHAR2(50);
    v_tipo VARCHAR2(50);
    v_desc VARCHAR2(50);
    CURSOR clugar IS
      SELECT l_nombre, l_tipo, l_descripcion
        FROM lugar;
  BEGIN
    OPEN clugar;
      LOOP
        FETCH clugar INTO v_nombre, v_tipo, v_desc;
        EXIT WHEN clugar%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_nombre ||' * '|| v_tipo ||' * '|| v_desc);
      END LOOP;
    CLOSE clugar;
  END;
  /
    
/* WHILE */
  DECLARE
    v_nombre VARCHAR2(50);
    v_tipo VARCHAR2(50);
    v_desc VARCHAR2(50);
    CURSOR clugar IS
      SELECT l_nombre, l_tipo, l_descripcion
        FROM lugar;
  BEGIN
    OPEN clugar;
      FETCH clugar INTO v_nombre, v_tipo, v_desc;
      WHILE clugar%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_nombre ||' * '|| v_tipo ||' * '|| v_desc);
        FETCH clugar INTO v_nombre, v_tipo, v_desc;
      END LOOP;
    CLOSE clugar;
  END;
  /
    
/* FOR */
  DECLARE
    CURSOR clugar IS
      SELECT l_nombre, l_tipo, l_descripcion
        FROM lugar;
  BEGIN
    FOR reg IN clugar LOOP
      DBMS_OUTPUT.PUT_LINE(clugar.l_nombre ||' * '|| clugar.l_tipo ||' * '|| clugar.l_descripcion);
    END LOOP;
  END;
  /

/**** CURSORES CON PARÁMETROS ****/
DECLARE
  CURSOR C2 (depart emple.dept_no%TYPE) IS
    SELECT *
      FROM emple
    WHERE dept_no = depart
      AND oficio = oficioEmple;

  CURSOR C2 (depart emple.dept_no%TYPE) IS
    SELECT *
      FROM emple
    WHERE dept_no = depart
      AND oficio = oficioEmple;
BEGIN
  FOR i IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE(i.dept_no);
    FOR j IN c2(i.dept_no) LOOP
        DBMS_OUTPUT.PUT_LINE('El empleado' || j.emp_no || ' del departamento ' || i.dept_no);
    END LOOP;
  END LOOP;
END;
