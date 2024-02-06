/* Tipos de datos:
     Escalares: Almacenan un valor único.
     Compuestos: Colecciones y registros
     Referencias:
     LOB:*/
/*
VARCHAR(n)
NUMBER(p,e)
BOOLEAN(TRUE|FALSE|NULL)
DATE
TIMESTAMP(p)
*/

/**** VARIABLES ****/
importe number(8,2); --Inicializar una variable (DF = NULL)
contador number(2,0) := 0; -- Inicializar una variable con un valor
nombre char(20) NOT NULL := 'Marcos'; -- Inicializar una variable con un valor y fuerzo que siempre tenga un valor
eliminado BOOLEAN DEFAULT FALSE; -- Inicializar una variable con un falor por defecto
