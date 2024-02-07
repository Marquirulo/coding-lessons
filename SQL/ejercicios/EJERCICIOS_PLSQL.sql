/*Ej1*/
BEGIN
    NULL;
END;
/

/*EJ2*/
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
END;
/

/*EJ3*/
BEGIN
    UPDATE emple
    SET salario = salario*1.1
    WHERE comision > salario*0.05;
END;
/

/*EJ4*/
DECLARE
    ape emple.apellido%TYPE;
    sal emple.salario%TYPE;
BEGIN 
    SELECT apellido, salario INTO ape, sal
        FROM emple
    WHERE dept_no IS NULL;
    DBMS_OUTPUT.PUT_LINE('El empleado '|| ape ||' tiene un salario de '||sal||' euros.');
END;
/

/*Ej5*/
DECLARE
    precio_7 productos.precio_uni%TYPE;
BEGIN
    SELECT precio_uni INTO precio_7
        FROM productos
    WHERE cod_producto = 7;
    DBMS_OUTPUT.PUT_LINE('El salario es ' || precio_7);
END;
/

/*Ej6*/
DECLARE
    clientela NUMBER(3);
BEGIN
    SELECT COUNT(nif) INTO clientela
        FROM ventascp
    WHERE fecha = '22/09/1997';
    DBMS_OUTPUT.PUT_LINE(clientela || ' clientes compraron el dia 22/09/1997');
END;
/

/*Ej7*/
DECLARE
    cuenta NUMBER(3);
    suma productos.precio_uni%TYPE;
BEGIN
    SELECT COUNT(linea_producto), SUM(precio_uni) INTO cuenta, suma
        FROM productos
    WHERE linea_producto = 'PB';
    DBMS_OUTPUT.PUT_LINE('hay ' || cuenta || ' productos en la línea PB. El precio total es de ' || suma || '€');
END;
/

/*Ej8*/
BEGIN
    INSERT INTO emple
    SELECT MAX(emp_no)+1, 'BERROCAL', 'DIRECTOR', 7839, SYSDATE, MAX(salario)+10000, MAX(comision)+5000,20
        FROM emple;
END;
/

/*Ej9*/
ALTER TABLE clientes 
    ADD zona varchar2(10)
;

BEGIN
    UPDATE clientes
        SET zona = 'CENTRO'
    WHERE domicilio = 'MADRID';
    UPDATE clientes
        SET zona = 'NORTE'
    WHERE domicilio != 'MADRID';
    DBMS_OUTPUT.PUT_LINE('Se ha facturado un total de '||||'€ a los clientes')
END;
/

    /*Ej9*/
ALTER TABLE clientes 
    ADD zona varchar2(10)
;
/
DECLARE
    total_ven NUMBER(15);
BEGIN
    UPDATE clientes
        SET zona = 'CENTRO'
    WHERE domicilio = 'MADRID';
    
    UPDATE clientes
        SET zona = 'NORTE'
    WHERE domicilio != 'MADRID';
    
    SELECT  SUM(v.unidades*p.precio_uni) INTO total_ven
    FROM ventascp v, productos p,clientes c
    WHERE c.nif = v.nif
        AND p.cod_producto = v.cod_producto
        AND UPPER(c.zona) = 'CENTRO';
    
    DBMS_OUTPUT.PUT_LINE('Se ha facturado un total de '||total_ven||'€ a los clientes');
END;
/

/*Ej10*/
DECLARE
    cliente clientes.nombre%TYPE;
    unidades ventascp.unidades%TYPE;
    product productos.descripcion%TYPE;
BEGIN
    INSERT INTO productos VALUES (10, 'Intel 8088', 'Proces', 9000, 0);
    INSERT INTO ventascp VALUES ('444D', 10, '10/12/97', 4);
    
    SELECT p.descripcion, v.unidades, c.nombre INTO product, unidades, cliente
        FROM ventascp v, productos p,clientes c
        WHERE c.nif = v.nif
            AND p.cod_producto = v.cod_producto
            AND p.cod_producto = 10;
    
    DBMS_OUTPUT.PUT_LINE('El cliente ' ||cliente|| ' ha comprado ' ||unidades|| ' unidades del producto' ||product);
END;
/
