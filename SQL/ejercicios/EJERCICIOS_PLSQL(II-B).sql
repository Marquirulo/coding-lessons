/*Ej1*/
DECLARE
    v_fecha DATE;
    v_dia VARCHAR2(15);
BEGIN
    v_fecha := TO_DATE('&fecha','DD/MM/YYYY');
    v_dia := RTRIM(TO_CHAR(v_fecha,'DAY'));
    
    IF (v_dia IN ('SABADO', 'DOMINGO')) THEN
        DBMS_OUTPUT.PUT_LINE('Cae en fin de semana');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No cae en fin de semana');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej2*/
DECLARE
    v_fecha DATE;
    v_dia NUMBER(1);
    v_texto VARCHAR(15);
BEGIN
    v_fecha := TO_DATE('&fecha','DD/MM/YYYY');
    v_dia := RTRIM(TO_CHAR(v_fecha,'D'));
    SELECT
        CASE v_dia
            WHEN 1 THEN 'LUNES' 
            WHEN 2 THEN 'MARTES' 
            WHEN 3 THEN 'MIERCOLES'
            WHEN 4 THEN 'JUEVES' 
            WHEN 5 THEN 'VIERNES' 
            WHEN 6 THEN 'SABADO' 
            WHEN 7 THEN 'DOMINGO'
        END INTO v_texto
    FROM dual;
    
    DBMS_OUTPUT.PUT_LINE('El ' || v_fecha || ' es ' || v_texto);
END;
/

/*Ej3*/
ACCEPT escala CHAR PROMPT 'Seleccione que temperatura va a introducir (F = Fahrenheit | C = Celsius): '
DECLARE
    v_temp NUMBER(5,2);
    v_temp2 NUMBER(5,2);
    v_escala VARCHAR2(1);
BEGIN
    v_escala := '&escala';
    v_temp := &temp;
    
    IF (UPPER(v_escala) = 'F') THEN
        v_temp2 := ((v_temp-32)*5)/9;
        DBMS_OUTPUT.PUT_LINE(v_temp || 'ºF son ' || v_temp2 || 'ºC');
    ELSIF (UPPER(v_escala) = 'C') THEN
        v_temp2 := ((9*v_temp)/5)+32;
        DBMS_OUTPUT.PUT_LINE(v_temp || 'ºC son ' || v_temp2 || 'ºF');
    END IF;
END;
/
