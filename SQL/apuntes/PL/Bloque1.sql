/*Ej1*/
DECLARE
    v_apellido emple.apellido%TYPE;
    CURSOR c_apellido IS
        SELECT apellido
            FROM emple 
        WHERE dept_no = 20;
BEGIN
    OPEN c_apellido;
        LOOP
            FETCH c_apellido INTO v_apellido;
            EXIT WHEN c_apellido%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(v_apellido);
        END LOOP;
    CLOSE c_apellido;
END;
/

/*Ej2*/
CREATE OR REPLACE PROCEDURE ejercicio2(p_dept_no emple.dept_no%TYPE)
AS
    v_apellido emple.apellido%TYPE;
    CURSOR cApellido IS
        SELECT apellido
            FROM emple 
        WHERE dept_no = p_dept_no;
BEGIN
    OPEN cApellido;
        FETCH cApellido INTO v_apellido;
        
        WHILE cApellido%FOUND LOOP
            IF v_apellido IS NULL THEN
                DBMS_OUTPUT.PUT_LINE('Apellido Nulo');
                FETCH cApellido INTO v_apellido;
            ELSE
                DBMS_OUTPUT.PUT_LINE(v_apellido);
                FETCH cApellido INTO v_apellido;
            END IF;
        END LOOP;
    CLOSE cApellido;
END;
/

/*Ej3*/
CREATE OR REPLACE PROCEDURE ejercicio3(p_dept_no emple.dept_no%TYPE)
AS
    v_apellido emple.apellido%TYPE;
    CURSOR cApellido IS
        SELECT apellido
            FROM emple 
        WHERE dept_no = p_dept_no;
BEGIN
        FOR reg IN cApellido LOOP
            IF reg.apellido IS NULL THEN
                DBMS_OUTPUT.PUT_LINE('Apellido Nulo');
            ELSE
                DBMS_OUTPUT.PUT_LINE(reg.apellido);
            END IF;
        END LOOP;
END;
/

/*Ej4*/
DECLARE
    CURSOR cApellido IS
        SELECT *
            FROM emple 
        WHERE comision > 50000;
BEGIN
        FOR reg IN cApellido LOOP
            DBMS_OUTPUT.PUT_LINE(reg.apellido || ' * ' || reg.oficio || ' * ' ||reg.comision );
        END LOOP;
END;
/

/*Ej5*/
CREATE OR REPLACE PROCEDURE ejercicio5
AS
    v_dept_no emple.dept_no%TYPE; 
    v_total_emple NUMBER(3);
    CURSOR cEmple IS
        SELECT d.dept_no, COUNT(e.emp_no) total_emple
            FROM emple e, depart d
        WHERE e.dept_no(+) = d.dept_no
        GROUP BY d.dept_no;
BEGIN
    OPEN cEmple;
        FETCH cEmple INTO v_dept_no, v_total_emple;
        WHILE cEmple%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(v_dept_no || '*' || v_total_emple);
            FETCH cEmple INTO v_dept_no, v_total_emple;
        END LOOP;
    CLOSE cEmple;
END ejercicio5;
/

/*Ej6*/

/*Ej7*/
DECLARE
    v_apellido emple.apellido%TYPE;
    v_fecha_alt emple.fecha_alt%TYPE;
    
    CURSOR cAltaEmp IS
        SELECT apellido, fecha_alt
            FROM emple
        ORDER BY fecha_alt;
BEGIN
    OPEN cAltaEmp;
        FETCH cAltaEmp INTO v_apellido,v_fecha_alt;
        WHILE cAltaEmp%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(v_apellido||' * '||v_fecha_alt);
            FETCH cAltaEmp INTO v_apellido,v_fecha_alt;
        END LOOP;
    CLOSE cAltaEmp;
END;
/

/*Ej8*/
CREATE OR REPLACE PROCEDURE ejercicio8(p_max_char NUMBER)
AS
    v_emp_no emple.emp_no%TYPE;
    v_apellido emple.apellido%TYPE;
    
    CURSOR pEmpleados IS
        SELECT emp_no, apellido
            FROM emple
        WHERE LENGTH(apellido) = p_max_char;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Empleados con '|| p_max_char || ' letras en el apellido:');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    OPEN pEmpleados;
        FETCH pEmpleados INTO v_emp_no, v_apellido;
        WHILE pEmpleados%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(v_emp_no || ' * ' || v_apellido);
            FETCH pEmpleados INTO v_emp_no, v_apellido;
        END LOOP;
        IF pEmpleados%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No hay apellidos con esa longitud');
        END IF;
    CLOSE pEmpleados;
END;
/

/*Ej9*/

/*Ej10*/
DECLARE
    v_cont  NUMBER(2);
    v_emp_no emple.emp_no%TYPE;
    v_apellido emple.apellido%TYPE;
    CURSOR cMenorSalario IS
        SELECT emp_no, apellido
            FROM emple
        ORDER BY salario+comision;
BEGIN
    v_cont := 0;
    OPEN cMenorSalario;
        FETCH cMenorSalario INTO v_emp_no, v_apellido;
        WHILE cMenorSalario%FOUND AND v_cont < 5 LOOP
            DBMS_OUTPUT.PUT_LINE(v_emp_no || ' * ' || v_apellido);
            FETCH cMenorSalario INTO v_emp_no, v_apellido;
            v_cont := v_cont + 1;
        END LOOP;
    CLOSE cMenorSalario;
END;
/

/*Ej11*/
CREATE OR REPLACE FUNCTION ejercicio11(p_min_salario emple.salario%TYPE, p_max_salario emple.salario%TYPE)
RETURN NUMBER AS
    v_apellido emple.apellido%TYPE;
    CURSOR empleEntreSalarios IS
        SELECT apellido
            FROM emple
        WHERE salario BETWEEN p_min_salario AND p_max_salario;
BEGIN
    OPEN empleEntreSalarios;
        FETCH empleEntreSalarios INTO v_apellido;
        WHILE empleEntreSalarios%FOUND LOOP
            FETCH empleEntreSalarios INTO v_apellido;
        END LOOP;
        RETURN empleEntreSalarios%ROWCOUNT;
    CLOSE empleEntreSalarios;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/

/*Ej12*/
CREATE OR REPLACE PROCEDURE ejercicio12(p_cod_fabricante1 fabricantes.cod_fabricante%TYPE, p_cod_fabricante2 fabricantes.cod_fabricante%TYPE)
AS
    v_cod_art articulos.articulo%TYPE;
    v_peso articulos.peso%TYPE;
    v_cat articulos.categoria%TYPE;
    CURSOR cProductos IS
        SELECT a.articulo, a.peso, a.categoria
            FROM fabricantes f, articulos a
        WHERE f.cod_fabricante = a.cod_fabricante
            AND f.cod_fabricante BETWEEN p_cod_fabricante1 AND p_cod_fabricante2;
BEGIN
    OPEN cProductos;
        FETCH cProductos INTO v_cod_art, v_peso, v_cat;
        WHILE cProductos%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(v_cod_art || ' * ' || v_peso || ' * ' || v_cat);
            FETCH cProductos INTO v_cod_art, v_peso, v_cat;
        END LOOP;
    CLOSE cProductos;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
