DCL (Data Control Language) -> Define permisos de acceso a distintos objetos de la BBDD -> GRANT y REVOKE
DDL () -> Define los objetos (metadatos) -> NO permiten COMMIT y ROLLBACK
DML () -> Gestionar y manipular datos -> Permiten COMMIT y ROLLBACK

# TIPOS DE DATOS
| Descripcion | Tipo | Otros |
| --------- | --------- | --------- |
|TEXTO|
|Texto de anchura fija | CHAR(n)|
|Texto de anchura variable | VARCHAR2(n)|
|NÚMEROS|
|Enteros posición decimal | NUMBER(n): n es el máx de dígitos|
|Decimal de coma variable | NUMBER|
|Decimal de coma fija | NUMBER(p,s): p es la precisión máxima del número y s es la escala (número de decimales a la derecha de la coma)|
|FECHAS|
|Fechas | DATE|
|Fecha y hora | TIMESTAMP|
|DATOS DE GRAN TAMAÑO|
|Texto largo | LONG (en desuso)|
|Texto largo | CLOB|
|ESPECIALES|
|Referencia a fila | ROWID -> Identifica cada registro|

# TABLAS DICCIONARIOS
ALL_TABLES
ALL_TAB_COLUMNS
ALL_CONSTRAINTS
