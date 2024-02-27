-- TERCER TRIMESTRE --
/**** BUCLES ****/
  /*WHILE*/
    WHILE (<condicion>) LOOP
        ejecuciones;
    END LOOP;
  -- EJEMPLO --
    DECLARE
      num NUMBER(3);
      i NUMBER(3);
    BEGIN
      num := &numero;
      i :=1; --inicializamos
      WHILE (i <= num) LOOP
        INSERT INTO emple (emp_no) VALUES (i); --instrucciones
        i := i+1; --variación de la condición
      END LOOP;
      COMMIT;
    END;
    /

  /*FOR LOOP*/
  --Contador no se declara en el DECLARE.
  --IN hace el FOR normal, IN REVERSE a la inversa. 
    FOR contador { IN | IN REVERSE } limite_inf..limite_sup LOOP 
        ejecuciones
    END LOOP;

  -- EJEMPLO --
    DECLARE
      suma number:=0;
    BEGIN
      FOR variable IN 1..10 LOOP
        suma := suma + variable;
        dbms_output.put_line(suma);
      END LOOP;
    END;
    /
