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
