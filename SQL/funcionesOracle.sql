/*** FUNCIONES NUMÉRICAS ***/
-- REDONDEOS --
ROUND(n,[decimales]) -- Redondea 8.239 -> 8.24 \
                                                decimales = 2
TRUNC(n,[decimales]) -- Trunca 8.239 -> 8.23   /

-- MATEMATICAS --
MOD(n1,n2) -- Devuelve el resto
POWER(valor,exponente) -- Eleva el valor al exponente indicado
SQRT(n) -- Calcula la raíz cuadrada de n
SIGN(n) -- Devuelve 1 si n es positivo, cero si vale cero y -1 si es negativo
ABS(n) -- Valor absoluto

/*** FUNCIONES DE CARACTERES ***/
LOWER(texto) -- Convierte a minúsculas
UPPER(texto) -- Convierte a mayúsculas
INITCAP(texto) -- Convierte la primera letra de cada palabra a mayúsculas
