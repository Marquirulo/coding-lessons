SET SERVEROUTPUT ON;
/*Ej1*/
DECLARE
    num1 NUMBER(3);
    num2 NUMBER(3);
    i NUMBER(3);
BEGIN
    num1 := &num;
    num2 := &num;
    i := num1+1;
    IF (num1 > num2) THEN
        WHILE i BETWEEN (num1, num2) LOOP
            DBMS_OUTPUT.PUT_LINE(i);
            i := i+1
        END LOOP;
    ELSE
        WHILE i BETWEEN (num2, num1) LOOP
            DBMS_OUTPUT.PUT_LINE(i);
            i := i+1
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
  IF (MOD(num, 2) = 0) THEN
    DBMS_OUTPUT.PUT_LINE('El numero ' || num || ' es par');
  ELSE
    DBMS_OUTPUT.PUT_LINE('El numero ' || num || ' es impar');
  END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;

/*Ej3*/
DECLARE
    num1 NUMBER(3);
    num2 NUMBER(3);
BEGIN
    num1 := &num;
    num2 := &num;
    
    IF (num1 > num2) THEN
        FOR i IN num1..num2 LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
    ELSE
        FOR i IN num2..num1 LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hay un error: ' || SQLERRM);
END;
/
