/*** FUNCIONES NUMÉRICAS ***/
-- REDONDEOS --
ROUND(n,[decimales]) -- Redondea 8.2387 -> 8.239 \
                                                  decimales = 3
TRUNC(n,[decimales]) -- Trunca 8.2387 -> 8.238   /

-- MATEMÁTICAS --
MOD(n1,n2) -- Devuelve el resto
POWER(valor,exponente) -- Eleva el valor al exponente indicado
SQRT(n) -- Calcula la raíz cuadrada de n
SIGN(n) -- Devuelve 1 si n es positivo, cero si vale cero y -1 si es negativo
ABS(n) -- Valor absoluto

/*** FUNCIONES DE CARACTERES ***/
-- CONVERSIÓN --
LOWER(texto) -- Convierte a minúsculas
UPPER(texto) -- Convierte a mayúsculas
INITCAP(texto) -- Convierte la primera letra de cada palabra a mayúsculas

-- TRANSFORMACIÓN --
RTRIM(texto) -- Elimina los espacios a la derecha del texto
LTRIM(texto) -- Elimina los espacios a la izquierda del texto
TRIM(texto) -- Elimina los espacios en blanco a la izquierda y la derecha del texto y los espacios dobles del interior.
SUBSTR(texto,n[,m]) -- Selecciona los caracteres m a partir de la posicion +/- n   EJ. SUBSTR(texto,3,3) -> xto
LENGTH(texto) -- Indica el tamaño del texto
REVERSE(texto) -- Invierte el texto

/*** FUNCIONES DE TRABAJO CON NULL ***/
NVL(valor,sustituto) -- Si el valor es NULL devuelve sustituto (Los sustitutos deben ser del mismo tipo de dato)
NVL2(valor,sustituto1,sustituto2) -- Si el valor es NULL devuelve sustituto2, si no, devuelve sustituto1

/*** FUNCIONES DE FECHA ***/
SYSDATE -- Fecha y Hora actuales

-- CALCULAR FECHAS --
ADD_MONTHS(fecha, n) -- Añade/Sustrae n meses a la fecha
MONTHS_BETWEEN(fecha1, fecha2) -- Diferencia en meses entre las dos fechas
NEXT_DAY(fecha,dia) -- Indica el siguiente dia despues de esa fecha. dia = [Sábado|6]
LAST_DAY(fecha) -- Ultimo dia del mes de esa fecha
EXTRACT({day|month|year} FROM fecha) -- Extrae el valor indicado de la fecha indicada
GREATEST(fecha1, fecha2,..) -- Saca la fecha más moderna
LEAST(fecha1, fecha2,..) -- Saca la fecha más antigua
ROUND|TRUNC(fecha [,'YEAR|MONTH|HH24|DAY']) -- Redondea|Trunca al valor de aplicar el formato

/*** FUNCIONES DE CONVERSION ***/
  /* modelodeFormato cumple la función de máscara
     MÁSCARAS:
       DDMMYYYY
       DD/MM/YYY
  */
TO_CHAR(expresión [,modeloDeFormato])
TO_NUMBER(expresión [,modeloDeFormato])
TO_DATE(expresión [,modeloDeFormato])

/*** FUNCIONES CONDICIONALES ***/
-- CASE --
SELECT nombre,
  CASE cotizacion
      WHEN 1 THEN salario*0.85
      WHEN 2 THEN salario*0.93
      WHEN 3 THEN salario*0.96
      ELSE salario*0.2
  END
FROM empleados;
/*Puede haber CASE complejos indicando  ops. lógicas*/
SELECT nombre,
  CASE 
      WHEN nota>=5 THEN 'Suficiente'
      WHEN nota>=7 THEN 'Notable'
      WHEN nota>=9 THEN 'Sobresaliente'
      ELSE 'Suspenso'
  END AS calificacion
FROM alumnos;

-- DECODE --
-- Permite simplificar los CASE SIMPLES (No puedes usar ops. lógicos)
SELECT nombre,
DECODE(cotizacion,
  1, salario*0.85,
  2, salario*0.93,
  3, salario*0.96,
  salario*0.2) -- El ELSE se pone al final en valor único
FROM empleados;

/*** AGRUPACIONES ***/
MAX(salario)
MIN(salario)
AVG(salario)
COUNT(salario) --> Cuenta el nº de registros (Si pongo el nombre de columna no cuenta los NULL)
