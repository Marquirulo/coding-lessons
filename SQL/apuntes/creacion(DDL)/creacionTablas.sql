/**** REGLAS ****
● Deben comenzar con una letra
● No deben tener más de 30 caracteres
● Solo se permiten utilizar letras del alfabeto (inglés), números o el signo de subrayado (también los signos $ y #, pero esos se utilizan de manera especial, por lo que no son recomendados)
● No puede haber dos tablas con el mismo nombre dentro del mismo esquema (pueden coincidir los nombres si están en distintos esquemas)
● No puede coincidir con el nombre de una palabra reservada SQL (por ejemplo no se puede llamar SELECT a una tabla)
● En el caso de que el nombre tenga espacios en blanco o caracteres nacionales (permitido solo en algunas bases de datos), entonces se suele entrecomillar con comillas dobles. En el estándar SQL 99 (respetado por Oracle) se pueden utilizar comillas dobles al poner el nombre de la tabla a fin de hacerla sensible a las mayúsculas (se diferenciará entre “FACTURAS” y “Facturas”). ¡¡MEJOR USAR _ !!
****/

/**** CREACION ****/
    CREATE TABLE EMPLEADO (DNI            VARCHAR2(9),
                           EDAD           NUMBER,
                           COD_PROVINCIA  NUMBER(2),
                           EXPEDIENTE     VARCHAR2(30),
                           FECHA_CARGA    DATE);
  /* PK */
    CREATE TABLE EMPLEADO (DNI             VARCHAR2(9)  PRIMARY KEY,
                           EDAD            NUMBER,
                           COD_PROVINCIA   NUMBER(2),
                           EXPEDIENTE      VARCHAR2(30),
                           FECHA_CARGA     DATE);
  /* NOT NULL */
    CREATE TABLE EMPLEADO (DNI            VARCHAR2(9)   PRIMARY KEY,
                           EDAD           NUMBER        NOT NULL,
                           COD_PROVINCIA  NUMBER(2),
                           EXPEDIENTE     VARCHAR2(30),
                           FECHA_CARGA    DATE);
  /* UNIQUE */
    CREATE TABLE EMPLEADO (DNI            VARCHAR2(9)   PRIMARY KEY,
                           EDAD           NUMBER        NOT NULL,
                           COD_PROVINCIA  NUMBER(2),
                           EXPEDIENTE     VARCHAR2(30)  UNIQUE,
                           FECHA_CARGA    DATE);

  /* DEFAULT */
    CREATE TABLE EMPLEADO (DNI            VARCHAR2(9)   PRIMARY KEY,
                           EDAD           NUMBER        NOT NULL,
                           COD_PROVINCIA  NUMBER(2),
                           EXPEDIENTE     VARCHAR2(30)  UNIQUE,
                           FECHA_CARGA    DATE          DEFAULT SYSDATE);
/**** RESTRICCIONES ****/
-- tabla_columna_restriccion Ej. emp_cod_pk
/* RESTRICCION */
  /* PK (Primary Key) */
    --SIMPLE
    CREATE TABLE clientes( dni VARCHAR(9),
                                   nombre VARCHAR(50)
                                   CONSTRAINT clientes_pk PRIMARY KEY(dni));

    --COMPUESTA
    CREATE TABLE alquileres(dni VARCHAR(9),
                                    cod_pelicula NUMBER(5),
                                    CONSTRAINT alquileres_pk PRIMARY KEY(dni,cod_pelicula));

  /* FK (Foreign Key) */
    CREATE TABLE existencias(
        tipo VARCHAR2(2),
        modelo NUMBER(3),
        n_almacen NUMBER(1),
        cantidad NUMBER(7),
        CONSTRAINT existencias_fk1 FOREIGN KEY(tipo,modelo) REFERENCES piezas,
        CONSTRAINT existencias_fk2 FOREIGN KEY(n_almacen) REFERENCES almacenes,
        CONSTRAINT existencias_pk PRIMARY KEY(tipo,modelo,n_almacen));

  /* CK (Check) */ --> Aplica condiciones a los datos de los campos 
    CREATE TABLE existencias(
        tipo VARCHAR2(2),
        modelo NUMBER(3),
        n_almacen NUMBER(1),
        cantidad NUMBER(7),
        CONSTRAINT existencias_fk1 FOREIGN KEY(tipo,modelo) REFERENCES piezas,
        CONSTRAINT existencias_fk2 FOREIGN KEY(n_almacen) REFERENCES almacenes,
        CONSTRAINT existencias_ck1 CHECK (tipo in ('A','B')),
        CONSTRAINT existencias_ck2 CHECK (cantidad between 1 and 5000),
        CONSTRAINT existencias_pk PRIMARY KEY(tipo,modelo,n_almacen));

/**** CREACION DE TABLAS IDENTICAS ****/
 /*Esto copia la estructura y los registros pero no las restricciones (pk,fk...). Esto habrá qeu añadirlo una vez creada.*/
   CREATE TABLE tabla_nueva AS SELECT * FROM tabla_antigua;
