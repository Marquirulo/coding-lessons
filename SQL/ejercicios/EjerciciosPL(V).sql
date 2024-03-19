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
END;
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
END;
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
END;
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
END;
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
        
END;
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
END;
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
END;
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
END;
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
    
    
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Ya existe un departamento con ese nombre');
END;
/
