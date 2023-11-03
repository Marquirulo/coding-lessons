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
NVL(valor,sustituto) -- Si el valor es NULL devuelve sustituto
NVL2(valor,sustituto1,sustituto2) -- Si el valor es NULL devuelve sustituto2, si no devuelve sustituto1
