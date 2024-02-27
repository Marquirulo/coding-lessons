/*Ej1*/
DECLARE
    num1 NUMBER(3);
    num2 NUMBER(3);
BEGIN
    num1 := &num1;
    num2 := &num2;
    IF (num1 < num2) THEN
        WHILE (num1 < num2-1) LOOP
            num1 := num1+1;
            DBMS_OUTPUT.PUT_LINE(num1);
        END LOOP;
    ELSE
        WHILE (num2 < num1-1) LOOP
            num2 := num2+1;
            DBMS_OUTPUT.PUT_LINE(num2);
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej2*/
DECLARE
    num NUMBER(4);
BEGIN
    num := &num;
    IF (MOD(num, 2) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('El numero ' || num || ' es par');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El numero ' || num || ' es impar');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej3*/
DECLARE
    num1 NUMBER(3);
    num2 NUMBER(3);
BEGIN
    num1 := &num1;
    num2 := &num2;
    
    IF (num1 < num2) THEN
        FOR ini IN num1..num2 LOOP
            IF (MOD(ini,2)=0)THEN
                DBMS_OUTPUT.PUT_LINE(ini || ' es par');
            END IF;
        END LOOP;
    ELSE
        FOR ini IN num2..num1 LOOP
            IF (MOD(ini,2)=0)THEN
                DBMS_OUTPUT.PUT_LINE(ini || ' es par');
            END IF;
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/
    
/*Ej4*/
DECLARE
    n NUMBER(3);
BEGIN
    n := &n;
    FOR i IN 0..n LOOP
        IF (MOD(i,2)=0) THEN
            DBMS_OUTPUT.PUT_LINE(i || ' es par');
        END IF;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej5*/
DECLARE
    inicio NUMBER(3);
    fin NUMBER(3);
BEGIN
    inicio := &inicio;
    fin := &fin;
    
    IF (fin >= inicio)THEN
        FOR i IN REVERSE inicio..fin LOOP
            IF (MOD(i,3) = 0) THEN
                DBMS_OUTPUT.PUT_LINE(i || ' es multiplo de 3');
            END IF;
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Elija un rango correcto');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/

/*Ej6*/
DECLARE
    num NUMBER(3);
    calc NUMBER(3);
    cont NUMBER(3) := 0;
BEGIN
    num := &num;
    calc := num;
    WHILE (MOD(calc,2) = 0) LOOP
        calc := calc/2;
        cont := cont+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('El numero ' || num || ' es divisible por 2, ' || cont || ' veces');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
