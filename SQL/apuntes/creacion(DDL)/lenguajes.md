DCL (Data Control Language) -> Define permisos de acceso a distintos objetos de la BBDD -> GRANT y REVOKE
DDL () -> Define los objetos (metadatos) -> NO permiten COMMIT y ROLLBACK
DML () -> Gestionar y manipular datos -> Permiten COMMIT y ROLLBACK

# TIPOS DE DATOS
| Descripcion | Tipo |
| --------- | --------- |
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

<table>
      <thead>
        <tr>
            <th>Descripcion</th>
            <th>Comando</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=4 align="center">R1 Text</td>
            <td rowspan=2 align="center">R2 Text A</td>
            <td align="center">R3 Text A</td>
        </tr>
        <tr>
            <td align="center">R3 Text B</td>
        </tr>
        <tr>
            <td rowspan=2 align="center">R2 Text B</td>
            <td align="center">R3 Text C</td>
        </tr>
        <tr>
            <td align="center">R3 Text D</td>
        </tr>
    </tbody>

</table>

# TABLAS DICCIONARIOS
ALL_TABLES
ALL_TAB_COLUMNS
ALL_CONSTRAINTS
