/*Ej1*/
CREATE OR REPLACE PROCEDURE ejercicio1(codigo productos.cod_producto%TYPE)
AS
    precio productos.precio_uni%TYPE;
BEGIN
    SELECT precio_uni INTO precio
        FROM productos
    WHERE cod_producto = codigo;
    DBMS_OUTPUT.PUT_LINE('El producto '||codigo||' cuesta '||precio);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error' || SQLERRM);
END ejercicio1;
/

/*Ej2*/
CREATE OR REPLACE PROCEDURE ejercicio2(codigo productos.cod_producto%TYPE, precio productos.precio_uni%TYPE)
AS
    v_precio productos.precio_uni%TYPE;
BEGIN
    SELECT precio_uni INTO v_precio
        FROM productos
    WHERE cod_producto = codigo;
   
    IF (ABS(precio - v_precio) > v_precio*0.2) THEN
            DBMS_OUTPUT.PUT_LINE('La variacion del precio supera el 20%');
    ELSE
        UPDATE productos
            SET precio_uni = precio
        WHERE cod_producto = codigo;
        DBMS_OUTPUT.PUT_LINE('Producto modificado correctamente');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('El producto no existe');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
        ROLLBACK;
END ejercicio2;
/

/*Ej3*/
CREATE OR REPLACE PROCEDURE ejercicio3(p_num_emple emple.emp_no%TYPE, p_nuevo_oficio emple.oficio%TYPE)
AS
    v_oficio_antiguo emple.oficio%TYPE;
BEGIN
    SELECT oficio INTO v_oficio_antiguo
        FROM emple
    WHERE emp_no = p_num_emple;
    
    UPDATE emple
        SET oficio = p_nuevo_oficio
    WHERE emp_no = p_num_emple;
    
    DBMS_OUTPUT.PUT_LINE('Oficio del empleado '|| p_num_emple || ' de ' || v_oficio_antiguo || ' a ' ||p_nuevo_oficio);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
        ROLLBACK;
END ejercicio3;
/

/*Ej4*/
CREATE OR REPLACE PROCEDURE ejercicio4(p_nuevo_oficio emple.oficio%TYPE)
AS
    v_emple_max emple.emp_no%TYPE;
BEGIN

    SELECT MAX(emp_no) INTO v_emple_max
        FROM emple;

    ejercicio3(v_emple_max, p_nuevo_oficio);
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('El producto no existe');
END ejercicio4;
/

/*Ej5*/
CREATE OR REPLACE FUNCTION ejercicio5(p_apellido emple.apellido%TYPE)
RETURN emple.emp_no%TYPE AS
    v_emp_no emple.emp_no%TYPE;
BEGIN
    SELECT emp_no INTO v_emp_no
        FROM emple
    WHERE apellido = p_apellido;
    DBMS_OUTPUT.PUT_LINE('El empleado con apellido ' || p_apellido ||' tiene el nº de empleado '||v_emp_no);
    RETURN v_emp_no;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('No exiten empleados con el apellido '|| p_apellido);
        RETURN -1;
        
    WHEN too_many_rows THEN
        DBMS_OUTPUT.PUT_LINE('Hay varios empleados con el apellido '|| p_apellido);
        RETURN -2;
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error '|| SQLERRM);
        RETURN -3;
        
END ejercicio5;
/

/*Ej6*/
CREATE OR REPLACE PROCEDURE subirSalario(p_emp_no emple.emp_no%TYPE, p_incremento NUMBER)
AS
    v_salario emple.salario%TYPE;
    v_nuevo_salario emple.salario%TYPE;
BEGIN

    SELECT salario INTO v_salario
        FROM emple
    WHERE emp_no = p_emp_no;
    
    v_nuevo_salario := v_salario+p_incremento;
    
    IF (v_salario IS NULL) THEN
        UPDATE emple
            SET salario = p_incremento
        WHERE emp_no = p_emp_no;
        DBMS_OUTPUT.PUT_LINE('Salario de '||p_emp_no||' pasó de NULL a '||p_incremento);
    ELSE 
        UPDATE emple
            SET salario = v_nuevo_salario
        WHERE emp_no = p_emp_no;
        DBMS_OUTPUT.PUT_LINE('Salario de '||p_emp_no||' pasó de '||v_salario||' a '||v_nuevo_salario);
    END IF;
    
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('El empleado indicado no existe');
END subirSalario;
/

/*Ej7*/
CREATE OR REPLACE PROCEDURE subirSalario(p_emp_no emple.emp_no%TYPE, p_incremento NUMBER)
AS
    v_salario emple.salario%TYPE;
    v_nuevo_salario emple.salario%TYPE;
BEGIN

    SELECT salario INTO v_salario
        FROM emple
    WHERE emp_no = p_emp_no;
    
    v_nuevo_salario := v_salario+p_incremento;
    
    IF (v_salario IS NULL) THEN
        UPDATE emple
            SET salario = p_incremento
        WHERE emp_no = p_emp_no;
        RAISE_APPLICATION_ERROR(-20010, 'El salario del empleado indicado es nulo');
    ELSE 
        UPDATE emple
            SET salario = v_nuevo_salario
        WHERE emp_no = p_emp_no;
        DBMS_OUTPUT.PUT_LINE('Salario de '||p_emp_no||' pasó de '||v_salario||' a '||v_nuevo_salario);
    END IF;
    
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('El empleado indicado no existe');
END subirSalario;
/

/*Ej8*/
--8.1 (Opcion1)
CREATE OR REPLACE PROCEDURE 
    insert_depart(p_nombre depart.dnombre%TYPE, p_localidad depart.loc%TYPE)
AS
    v_nombre depart.dnombre%TYPE;
    v_dept_no depart.dept_no%TYPE;
BEGIN
    SELECT dnombre INTO v_nombre
        FROM depart
    WHERE UPPER(dnombre) = UPPER(p_nombre);
    DBMS_OUTPUT.PUT_LINE('Ya existe un departamento con ese nombre');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        SELECT MAX(dept_no)+10 INTO v_dept_no
            FROM depart;
        IF (v_dept_no IS NULL) THEN
            INSERT INTO depart VALUES (10, UPPER(p_nombre), UPPER(p_localidad));
            DBMS_OUTPUT.PUT_LINE('Nuevo departamento añadido con los siguientes datos 10 '||UPPER(p_nombre)||' '||UPPER(p_localidad));
        ELSE
            INSERT INTO depart VALUES (v_dept_no, UPPER(p_nombre), UPPER(p_localidad));
            DBMS_OUTPUT.PUT_LINE('Nuevo departamento añadido con los siguientes datos '||v_dept_no||' '||p_nombre||' '||p_localidad);
        END IF;
END insert_depart;
/
    
--8.1 (Opcion2)
CREATE OR REPLACE PROCEDURE 
    insert_depart(p_nombre depart.dnombre%TYPE, p_localidad depart.loc%TYPE)
AS
    v_nombre NUMBER(2);
    v_dept_no depart.dept_no%TYPE;
BEGIN
    SELECT COUNT(1) INTO v_nombre
        FROM depart
    WHERE UPPER(dnombre) = UPPER(p_nombre);

    SELECT MAX(dept_no)+10 INTO v_dept_no
            FROM depart;

    IF (v_nombre = 0 AND v_dept_no IS NULL) THEN
        INSERT INTO depart VALUES (10, UPPER(p_nombre), UPPER(p_localidad));
        DBMS_OUTPUT.PUT_LINE('Nuevo departamento añadido con los siguientes datos 10 '||UPPER(p_nombre)||' '||UPPER(p_localidad));
    ELSIF (v_nombre = 0 AND v_dept_no IS NOT NULL)
        INSERT INTO depart VALUES (v_dept_no, UPPER(p_nombre), UPPER(p_localidad));
        DBMS_OUTPUT.PUT_LINE('Nuevo departamento añadido con los siguientes datos '||v_dept_no||' '||p_nombre||' '||p_localidad);
    ELSE
        RAISE DUP_VAL_ON_INDEX;
    END IF;
END insert_depart;
/
    
--8.2
CREATE OR REPLACE PROCEDURE borrar_depart(p_dept_num_borrar depart.dept_no%TYPE, p_dept_num_remp depart.dept_no%TYPE)
AS
    v_dept_nombre depart.dnombre%TYPE;
    v_existe NUMBER(2);
BEGIN

    SELECT COUNT(1) INTO v_existe
        FROM depart
    WHERE dept_no = p_dept_num_remp;
    IF v_existe > 0 THEN
        UPDATE emple
            SET dept_no = p_dept_num_remp
        WHERE dept_no = p_dept_num_borrar;

        DELETE FROM depart
            WHERE dept_no = p_dept_num_borrar;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Este departamento no existe');
    END IF;
END borrar_depart;
/
    
--8.3
CREATE OR REPLACE PROCEDURE modifica_localidad(p_dept_no depart.dept_no%TYPE, p_loc depart.loc%TYPE)
AS
BEGIN
    UPDATE depart
        SET loc = UPPER(p_loc)
    WHERE dept_no = p_dept_no;
END modifica_localidad;
/
    
--8.4
CREATE OR REPLACE PROCEDURE visualiza_datos_depart(p_dept_num depart.dept_no%TYPE)
AS
    v_total_emple NUMBER(5);    
    v_dnombre depart.dnombre%TYPE; 
    v_loc depart.loc%TYPE;
BEGIN
    SELECT dnombre, loc INTO v_dnombre, v_loc
        FROM depart
    WHERE dept_no = p_dept_num;
    
    SELECT COUNT(1) INTO v_total_emple
        FROM emple
    WHERE dept_no = p_dept_num;
    
    DBMS_OUTPUT.PUT_LINE('El departamento con numero ' || p_dept_num || ' es el de ' || v_dnombre || ' está en ' || v_loc || ' y tiene ' || v_total_emple || ' empleados');
END visualiza_datos_depart;
/
-- Podemos ahorrar variables sustituyendolas por v_depart%ROWTYPE
CREATE OR REPLACE PROCEDURE visualiza_datos_depart(p_dept_num depart.dept_no%TYPE)
AS
    v_total_emple NUMBER(5);    
    v_depart depart%ROWTYPE; 
BEGIN
    SELECT * INTO v_depart
        FROM depart
    WHERE dept_no = p_dept_num;
    
    SELECT COUNT(1) INTO v_total_emple
        FROM emple
    WHERE dept_no = p_dept_num;
    
    DBMS_OUTPUT.PUT_LINE('El departamento con numero ' || v_depart.dept_no || ' es el de ' || v_depart.dnombre || ' está en ' || v_depart.loc || ' y tiene ' || v_total_emple || ' empleados');
END visualiza_datos_depart;
/

/*Ej9*/
CREATE OR REPLACE FUNCTION ejercicio9(p_fecha_inicio leidos.fecha%TYPE, p_fecha_fin leidos.fecha%TYPE, p_nombre_libro paraleer.nombre_libro%TYPE)
RETURN NUMBER AS
    v_total_libros NUMBER(5);
BEGIN
    SELECT COUNT(1) INTO v_total_libros
        FROM leidos l, paraleer p
    WHERE l.cod_libro = p.cod_libro
        AND l.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
        AND UPPER(p.nombre_libro) = UPPER(p_nombre_libro);
    
    RETURN v_total_libros;
END ejercicio9;
/

DECLARE
    v_fecha_inicio leidos.fecha%TYPE;
    v_fecha_fin leidos.fecha%TYPE;
    v_nombre_libro paraleer.nombre_libro%TYPE;
BEGIN
    v_fecha_inicio := '&fecha_inicio';
    v_fecha_fin := '&fecha_fin';
    v_nombre_libro := '&nombre_libro';
    
    DBMS_OUTPUT.PUT_LINE('En ese tiempo se ha leido el libro ' || ejercicio9(v_fecha_inicio, v_fecha_fin, v_nombre_libro) || ' veces');
    
END;
/

/*Ej10*/
CREATE OR REPLACE FUNCTION ejercicio10(p_cod_depart depart.dept_no%TYPE, p_emple_max NUMBER, p_emple_min NUMBER)
RETURN NUMBER AS
    v_total_emple NUMBER(3);
    v_emple_afectados NUMBER(3);
BEGIN
    
    SELECT COUNT(1) INTO v_total_emple
        FROM emple
    WHERE dept_no = p_cod_depart;
    
    IF (v_total_emple BETWEEN p_emple_min AND p_emple_max) THEN
        DELETE FROM emple
            WHERE dept_no = p_cod_depart;
            
        v_emple_afectados := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(v_emple_afectados || 'funcion');
            
         DELETE FROM depart
            WHERE dept_no = p_cod_depart; 
            
        RETURN v_emple_afectados;
    ELSE
        RETURN -1;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RETURN -1;
END ejercicio10;
/

DECLARE
    v_cod_depart depart.dept_no%TYPE;
    v_emple_max NUMBER(3);
    v_emple_min NUMBER(3);
    v_resultado_funcion NUMBER(3);
    v_emples NUMBER(3);

BEGIN
    v_cod_depart := &dept_no;
    v_emple_min := &emple_min;
    v_emple_max := &emple_max;
    
    SELECT COUNT(1) INTO v_emples
        FROM emple
    WHERE dept_no = v_cod_depart;
    DBMS_OUTPUT.PUT_LINE(v_emples || ' empleados');
    --v_resultado_funcion := ejercicio10(v_cod_depart, v_emple_max, v_emple_min);
    
    IF (ejercicio10(v_cod_depart, v_emple_max, v_emple_min) /*v_resultado_funcion*/ >= 0) THEN
        DBMS_OUTPUT.PUT_LINE('Se ha borrado el departamento y sus empleados');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se ha borrado ningún departamento');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
