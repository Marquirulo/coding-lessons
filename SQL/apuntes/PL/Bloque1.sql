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

/**** ATRIBUTOS ****/
     /* %TYPE */
     -- Permiten asignar el tipo de una variable referenciada a un campo o variable ya existente
          n_dept depart.cod_dept%TYPE;
     /* %ROWTYPE */
          
/**** BLOQUE DE LOS PROCEDIMIENTOS ****/
 /* BLOQUE ANÓNIMO */
     DECLARE [IS | AS] -- OPCIONAL
          [declaraciones] -- Definimos todos los objetos
     BEGIN
          [instrucciones] -- Conteiene las sentencias ejecutables de PL/SQL
     EXCEPTION -- OPCIONAL
          [tratamiento de excepciones] -- Tratamiento de errores (Como en Python)
     END;

/**** SALIDA POR PANTALLA ****/
     SET SERVEROUTPUT ON; -- Activa la salida por pantalla
     DBMS_OUTPUT.PUT_LINE('Hola ' || nombre);
