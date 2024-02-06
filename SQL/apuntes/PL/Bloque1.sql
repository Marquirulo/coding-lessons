-- Solo DML
/* Tipos de datos:
     Escalares: Nº, Caracteres, Fechas...
     Compuestos: Colecciones y registros
     Referencias: Punteros
     LOB: Localizadores
*/
/*
VARCHAR(n)
NUMBER(p,e)
BOOLEAN(TRUE|FALSE|NULL)
DATE
TIMESTAMP(p)
*/

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

/**** SALIDA POR PANTALLA ****/
     SET SERVEROUTPUT ON; -- Activa la salida por pantalla
     DBMS_OUTPUT.PUT_LINE('Hola ' || nombre);
     DBMS_OUTPUT.PUT_LINE('Error en la aplicación ' || SQLERRM);
