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
/**** SUBPROGRAMAS ****/
-- Bloques de PL/SQL con nombre, Compilados una sola vez, Almacenados en la Base de Datos, Gracias al nombre, pueden ser invocados por otras aplicaciones, En el caso de las funciones deben devolver un valor; Adicionalmente pueden(ambos) retornar parámetros de salida. Pueden recibir parámetros.
-- Los tipos de datos en los parámetros sin longitud. Ej VARCHAR2 en vez de VARCHAR2(10).
-- Terminamos el procedimiento con el nombre para el uso de estas en paquetes (librerias).
      
  /** PROCEDIMIENTOS **/ -- No devuelve nada
    CREATE [OR REPLACE] PROCEDURE nombre_proc(param1 [IN|OUT|IN OUT] tipo,...)
    AS
      -- Declaracion de variables locales
    BEGIN
      -- Instrucciones de ejecución
    EXCEPTION
      -- Instrucciones de excepción
    END nombre_proc;
    /
      
  /** FUNCIONES **/ -- Devuelve valor (No admite parámetros OUT)
    CREATE {OR REPLACE} FUNCTION nombre_func(param1 tipo,...)
    RETURN tipo_dato AS
      -- Declaracion de variables locales
    BEGIN
      -- Instrucciones de ejecución
        RETURN dato_devolver;
    EXCEPTION
      -- Instrucciones de excepción
        RETURN NULL; -- Para error
    END nombre_proc;
    /

/**** LLAMADA AL SUBPROGRAMA ****/
BEGIN
  nombre_subprograma(param_entrada1, param_entrada2, param_entrada3);
  nombre_subprogrma2();
END;

/**** PASO DE PARÁMETROS ****/
