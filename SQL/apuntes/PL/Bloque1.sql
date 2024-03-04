-- Solo DML
/** Tipos de datos:
     Compuestos: Colecciones y registros
     Referencias: Punteros
     LOB: Localizadores
     Escalares: Nº, Caracteres, Fechas...
          VARCHAR(n)
          NUMBER(p,e)
          BOOLEAN(TRUE|FALSE|NULL)
          DATE
          TIMESTAMP(p)
**/

/**** VARIABLES ****/
-- El operador de asinación es :=
importe number(8,2); --Inicializar una variable (DF = NULL)
contador number(2,0) := 0; -- Inicializar una variable con un valor
nombre char(20) NOT NULL := 'Marcos'; -- Inicializar una variable con un valor y fuerzo que siempre tenga un valor
eliminado BOOLEAN DEFAULT FALSE; -- Inicializar una variable con un falor por defecto

/**** CURSORES ****/
-- En PL, los resultados de consultas no se muestrasn en pantalla, sino que se almacenan en una area de memoria a parte

     /* IMPLICITOS */
     -- Se usan para operaciones SELECT INTO, es decir cuando la consulta devuelve solo un registro
     /*
      No deben ser declarados
      Para cada uno debe existir INTO
      Las variables que reciben los datos deberían usar nombreCampo%TYPE;
      Si devuelven más de 1 registro se produce una excepción
     */
     DECLARE
          v_ape emple.apellido%TYPE
          v_oficio emple.oficio%TYPE
     BEGIN
          SELECT apellido, oficio INTO v_ape, v_oficio
               FROM emple
          WHERE emp_no = 7782;
     END;

     /* EXPLICITOS */
     -- Son declarados y controlados por el programador.

/**** ATRIBUTOS ****/
     /* %TYPE */
     -- Permiten asignar el tipo de una variable referenciada a un campo o variable ya existente
          n_dept depart.cod_dept%TYPE;
     /* %ROWTYPE */

     /*%ROWCOUNT*/
     -- Cuenta registros
          SQL%ROWCOUNT -- Cuenta los registros afectados por al ultima sentencia DML *ver SQL* 
               
/**** SQL ****/
     SQL -- Hace referencia a la ultima sentencia DML realizada
               
/**** BLOQUE DE LOS PROCEDIMIENTOS ****/
 /* BLOQUE ANÓNIMO */
     DECLARE [IS | AS] -- OPCIONAL
          [declaraciones] -- Definimos todos los objetos
     BEGIN
          [instrucciones] -- Conteiene las sentencias ejecutables de PL/SQL
     EXCEPTION -- OPCIONAL
          [tratamiento de excepciones] -- Tratamiento de errores (Como en Python)
     END;
     / -- Esto es una buena práctica para tanto tu como el SQL seais capaces de diferenciar los distintos bloques de procedimientos.

/**** ENTRADA DE DATOS ****/
     /*Variables de sustitución*/
     -- Se declaran con & delante. Y fuerza que cada vez que se ejecute &variable_input pregunte por el valor.
          SET SERVEROUTPUT ON;
          DECLARE
               v_first_name VARCHAR2(50);
               v_last_name VARCHAR2(50);
          BEGIN
               SELECT first_name, last_name
                    INTO v_first_name, v_last_name
                    FROM hr.employees
               WHERE employee_id = &employee_input;--& Variable de sustitución.
               DBMS_OUTPUT.PUT_LINE('Nombre Apellido: ' || v_first_name || ' - ' || v_last_name);
          END;

/**** SALIDA POR PANTALLA ****/
     SET SERVEROUTPUT ON; -- Activa la salida por pantalla
     DBMS_OUTPUT.PUT_LINE('Hola ' || nombre);
     DBMS_OUTPUT.PUT_LINE('Error en la aplicación ' || SQLERRM);

/**** EXCEPCIONES ****/
-- Al igual que en otros lenguajes permite controlar los errores
EXCEPTION
     /*Para levantar las personalizadas surgen de otros bloques (por ej. en un IF) con RAISE error_perso_1;*/
     WHEN error_perso_1 THEN -- Definida por el usuario
          RAISE_APPLICATION_ERROR([-20001 a -20999],'Mensaje de error personalizado'); -- Creas un error indicado un nº ORA entre 20001 y 20999
     WHEN mirar_tabla_debajo THEN -- Definida por el sistema
          DBMS_OUTPUT.PUT_LINE('SQLCODE: ' || SQLCODE); -- SQLCODE muestra el código que ha fallado
          DBMS_OUTPUT.PUT_LINE('SQLERRM: ' || SQLERRM); -- SQLERRM Devuelve el código de error especifico.
     WHEN OTHERS THEN -- Indicaciones para el resto de errores
          /*Este código permite crear una tabla como log de errores*/
          err_code := SQLCODE;
          err_msg := SUBSTR(SQLERRM, 1, 200);
          INSERT INTO log_table (error_number, error_message)
          VALUES (err_code, err_msg);
-- Excepciones comunes (X = USAR)
    X TOO_MANY_ROWS     -- Se produce cuando SELECT xxx INTO devuelve más de una fila.
    X NO_DATA_FOUND     -- Se produce cuando SELECT xxx INTO no devuelve ninguna fila.
      LOGIN_DENIED      -- Error cuando intentamos conectarnos a Oracle con un login y clave no validos.
      NOT_LOGGED_ON     -- Se produce cuando intentamos acceder a la base de datos sin estar conectados.
      PROGRAM_ERROR     -- Se produce cuando hay un problema interno en la ejecución del programa.
    X VALUE_ERROR       -- Se produce cuando hay un error aritmético o de conversión.
    X ZERO_DIVIDE       -- Se puede cuando hay una división entre 0.
    X DUP_VAL_ON_INDEX  -- Se crea cuando se intenta almacenar un valor que crearía duplicados en la clave primaria o en una columna con restricción UNIQUE.
    X INVALID_NUMBER    -- Se produce cuando se intenta convertir una cadena a un valor numérico.

/**** ESTRUCTURAS DE CONTROL ****/
/*CONDICIONAL*/
-- En SQL las condiciones pueden ser = a TRUE NULL FALSE (FALSE y NULL son iguales)
     IF (condicion) THEN
         ejecuciones;
     ELSIF (condicion2) AND (condicion2_2) THEN
         ejecuciones2;
     ELSE
         ejecuciones3;
     END IF;
-- Se pueden usar CASE al igual que en SELECT
     CASE [expresion]
          WHEN condicion1 THEN resultado1;
          WHEN condicion2 THEN resultado2;
          ...
          WHEN condicionN THEN resultadoN;
     ELSE resultado;
     END CASE ;
