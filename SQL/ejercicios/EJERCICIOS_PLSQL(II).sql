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
