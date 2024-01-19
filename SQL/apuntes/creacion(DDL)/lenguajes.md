DCL (Data Control Language) -> Define permisos de acceso a distintos objetos de la BBDD -> GRANT y REVOKE
DDL () -> Define los objetos (metadatos) -> NO permiten COMMIT y ROLLBACK
DML () -> Gestionar y manipular datos -> Permiten COMMIT y ROLLBACK

/**** TIPOS DE DATOS ****/
              TEXTO
Texto de anchura fija | CHAR(n)
Texto de anchura variable | VARCHAR2(n)

            NÚMEROS
Enteros posición decimal | NUMBER(n)
Decimal de coma variable | NUMBER
Decimal de coma fija | NUMBER(m,d)

            FECHAS
Fechas | DATE
Fecha y hora | TIMESTAMP

      DATOS DE GRAN TAMAÑO
Texto largo | LONG (en desuso)
Texto largo | CLOB

          ESPECIALES
Referencia a fila | ROWID -> Identifica cada registro
