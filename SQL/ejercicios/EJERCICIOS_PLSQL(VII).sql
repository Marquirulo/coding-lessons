/*Ej1*/
DECLARE
    v_contador NUMBER(3);
    reg libros2%ROWTYPE;
    CURSOR clibros IS
        SELECT cod_libro, autor, titulo
            FROM libros2
        ORDER BY unidades DESC;
BEGIN
    v_contador := 0;
    OPEN clibros;
        FETCH clibros INTO reg.cod_libro, reg.autor, reg.titulo;
        WHILE clibros%FOUND AND v_contador < 3 LOOP
            DBMS_OUTPUT.PUT_LINE(reg.cod_libro || ' * ' || reg.autor || ' * ' || reg.titulo);
            v_contador := v_contador + 1;
            FETCH clibros INTO reg.cod_libro, reg.autor, reg.titulo;
        END LOOP;
    CLOSE clibros;
END;
/

/*Ej2*/
DECLARE
    CURSOR cEmple IS
        SELECT e.apellido ape, DECODE(e.dept_no, NULL, 'Sin dept', e.dept_no) dep, NVL(d.loc, 'Sin loc') localidad
            FROM emple e, depart d
        WHERE e.dept_no(+) = d.dept_no
            AND salario > 1000
            AND comision IS NOT NULL;
BEGIN
    FOR reg IN cEmple LOOP
            DBMS_OUTPUT.PUT_LINE(reg.ape|| ' * ' || reg.dep || ' * ' || reg.localidad);
    END LOOP;
END;
/

/*Ej4*/
CREATE OR REPLACE FUNCTION ejercicio4(p_dept_no1 emple.dept_no%TYPE, p_dept_no2 emple.dept_no%TYPE)
RETURN NUMBER AS
    v_dept1_count NUMBER(3);
    v_dept2_count NUMBER(3);
    reg emple%ROWTYPE;
    CURSOR cEmpleDept IS
        SELECT apellido, dept_no
            FROM emple
        WHERE dept_no IN (p_dept_no1, p_dept_no2)
        ORDER BY dept_no;
BEGIN
    OPEN cEmpleDept;
    
        FETCH cEmpleDept INTO reg.apellido, reg.dept_no;
        
        WHILE cEmpleDept%FOUND AND reg.dept_no = p_dept_no1 LOOP
            DBMS_OUTPUT.PUT_LINE(reg.apellido);
            FETCH cEmpleDept INTO reg.apellido, reg.dept_no;
        END LOOP;
        
        v_dept1_count := cEmpleDept%ROWCOUNT;
        
        FETCH cEmpleDept INTO reg.apellido, reg.dept_no;
        
        WHILE cEmpleDept%FOUND AND reg.dept_no = p_dept_no2 LOOP
            DBMS_OUTPUT.PUT_LINE(reg.apellido);
            FETCH cEmpleDept INTO reg.apellido, reg.dept_no;
        END LOOP;
        
        v_dept2_count := cEmpleDept%ROWCOUNT - v_dept1_count;
        
    CLOSE cEmpleDept;
    
    IF v_dept1_count > v_dept2_count THEN
        RETURN v_dept1_count;
    ELSE
        RETURN v_dept2_count;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

/*Ej5*/
DECLARE
    CURSOR cLibro IS
        SELECT cod_libro, titulo 
            FROM libros2;
            
    CURSOR cFechas(p_cod_libro prestamo.cod_libro%TYPE) IS
        SELECT TO_CHAR(fecha_prestamo, 'DD**MM**YYYY') fecha
            FROM prestamo
        WHERE cod_libro = p_cod_libro
        ORDER BY fecha_prestamo;
BEGIN
    FOR i IN cLibro LOOP
        DBMS_OUTPUT.PUT_LINE('Código '|| i.cod_libro ||' Titulo '|| i.titulo);
    
        FOR j IN cFechas(i.cod_libro) LOOP
            DBMS_OUTPUT.PUT_LINE(j.fecha);
        END LOOP;
        
    END LOOP;
END;
/

/*Ej6*/
DECLARE
    CURSOR cProducto IS
        SELECT cod_producto
            FROM productos;
    CURSOR cCantidad(producto ventascp.cod_producto%TYPE) IS
        SELECT nif, cod_producto, SUM(unidades) sumaUnidades
            FROM ventascp
        WHERE cod_producto = producto
        GROUP BY nif, cod_producto;
BEGIN
    FOR i IN cProducto LOOP
        DBMS_OUTPUT.PUT_LINE('Cod: ' || i.cod_producto);
        
        FOR j IN cCantidad(i.cod_producto) LOOP
            DBMS_OUTPUT.PUT_LINE('- nif: '||j.nif || ' unidades: '||j.sumaUnidades);            
        END LOOP;
        
    END LOOP;
END;
/
