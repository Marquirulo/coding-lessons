/*SET SERVEROUTPUT ON;
DBMS_OUTPUT.PUT_LINE();*/
/*Ej1*/
DECLARE
    v_cuenta_tipo NUMBER(4);
    v_tipo_centro centros.tipo_centro%TYPE;
BEGIN
    v_tipo_centro := '&tipo_centro';
    
    SELECT COUNT(c.cod_centro) INTO v_cuenta_tipo
        FROM centros c, profesores p
    WHERE c.cod_centro = p.cod_centro
        AND UPPER(c.tipo_centro) = v_tipo_centro;
        
    IF (v_cuenta_tipo >= 3) THEN
        DELETE FROM profesores 
        WHERE cod_centro IN (SELECT cod_centro
                                FROM centros
                             WHERE tipo_centro = v_tipo_centro);
        DBMS_OUTPUT.PUT_LINE('Hay ' || v_cuenta_tipo || ' centros del tipo ' || v_tipo_centro);        
    ELSE 
        DBMS_OUTPUT.PUT_LINE('No se borra esto');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*EJ2*/
DECLARE
    v_salario_min emple.salario%TYPE;
    v_salario_max emple.salario%TYPE;
    v_num_empleados NUMBER(4);
BEGIN
    v_salario_min := &salario_min;
    v_salario_max := &salario_max;
    
    SELECT COUNT(emp_no) INTO v_num_empleados
        FROM emple
    WHERE salario BETWEEN v_salario_min AND v_salario_max;
    
    IF v_num_empleados = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ningun empleado encontrado');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej3*/
DECLARE
    v_emp_no emple.emp_no%TYPE;
    v_apellido emple.apellido%TYPE;
    v_salario emple.salario%TYPE;
    v_dept_no emple.dept_no%TYPE;
BEGIN

    v_emp_no := &emp_no;
    v_apellido := '&apellido';
    v_dept_no := &dept_no;
    v_salario := &salario;
    
    IF (v_salario > 100000) THEN
        v_salario := (v_salario + 300);
    ELSE
        v_salario := (v_salario + v_salario * 0.2);
    END IF;
    
    INSERT INTO emple (emp_no, apellido, salario, dept_no) 
        VALUES (v_emp_no, v_apellido, v_salario, v_dept_no);
        
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej4*/
DECLARE
    v_opcion NUMBER(2);
BEGIN

    v_opcion := &opcion;
    
    IF v_opcion = 1 THEN
        DELETE FROM emple
            WHERE dept_no = 10;
    ELSIF v_opcion = 2 THEN
        DELETE FROM emple
            WHERE dept_no = 20;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No has escogido una opción válida.');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej5*/
DECLARE
    v_dept_no emple.dept_no%TYPE;
    v_avg_salario emple.salario%TYPE;
    v_count_emple NUMBER(3);
BEGIN
    v_dept_no := &dept_no;
    
    SELECT MAX(dept_no), COUNT(emp_no), AVG(salario) INTO v_dept_no, v_count_emple, v_avg_salario
            FROM emple
        WHERE dept_no = v_dept_no;
    
    IF (v_dept_no IS NOT NULL AND v_count_emple != 0) THEN
        DBMS_OUTPUT.PUT_LINE('El departamento ' ||v_dept_no||' tiene '||v_count_emple||' empleados y el salario medio es de ' ||v_avg_salario);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Departamento no existe o vacio');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej6*/
DECLARE
    v_emp_no emple.emp_no%TYPE;
BEGIN
    v_emp_no := &emp_no;

    SELECT emp_no INTO v_emp_no
        FROM emple
    WHERE emp_no = v_emp_no;
        
    DELETE FROM emple WHERE emp_no = v_emp_no;
    DBMS_OUTPUT.PUT_LINE('Se ha eliminado el empleado con código ' || v_emp_no);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Empleado no encontrado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej7*/
CREATE TABLE copiaalum AS SELECT * FROM alumnos;
ALTER TABLE copiaalum MODIFY dni PRIMARY KEY;
DELETE FROM copiaalum;

DECLARE
    cuenta_filas NUMBER(4);
BEGIN
    INSERT INTO copiaalum
        SELECT * 
            FROM alumnos 
        WHERE UPPER(pobla) = 'MADRID';
    cuenta_filas := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Se han insertado ' || cuenta_filas || ' filas');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Se ha violado la PK');
END;
/

/*Ej8*/
DECLARE
    v_dept_no emple.dept_no%TYPE;
    v_emp_no emple.emp_no%TYPE;
BEGIN
    SELECT dept_no INTO v_dept_no
        FROM emple
    GROUP BY dept_no    
    HAVING AVG(salario) IN (SELECT MAX(AVG(salario))
                                FROM emple
                            GROUP BY dept_no);
                            
    SELECT MAX(emp_no)+1 INTO v_emp_no FROM emple;

    INSERT INTO emple (emp_no, fecha_alt, dept_no) VALUES (v_emp_no, SYSDATE, v_dept_no);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Se ha indicado más de un departamento');
END;
/

/*Ej9*/
DECLARE
    v_dept_no emple.dept_no%TYPE;
    v_emp_no emple.emp_no%TYPE;
    v_salario emple.salario%TYPE;
-- Tengo que crear dos variables para usarlas de validación ya que si uso las del input se quedan convertidas a null y luego no puedo crear los registros. 
    v_emp_no_valida emple.emp_no%TYPE;
    v_dept_no_valida emple.dept_no%TYPE;
BEGIN
    v_dept_no := &dept_no;
    v_emp_no := &emp_no;

    SELECT MAX(dept_no) INTO v_dept_no_valida
        FROM depart
    WHERE dept_no = v_dept_no;
    
    SELECT MAX(emp_no) INTO v_emp_no_valida
        FROM emple
    WHERE emp_no = v_emp_no;

    SELECT AVG(salario) INTO v_salario
        FROM emple
    WHERE dept_no = v_dept_no;

    IF (v_dept_no_valida IS NULL) THEN
        INSERT INTO depart (dept_no) VALUES (v_dept_no);
    END IF;
    
    IF (v_emp_no_valida IS NULL) THEN
        IF (v_salario IS NULL) THEN
            v_salario := 0;
        END IF;
        INSERT INTO emple (emp_no, dept_no, salario) VALUES (v_emp_no, v_dept_no, v_salario);
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM); 
END;
/
