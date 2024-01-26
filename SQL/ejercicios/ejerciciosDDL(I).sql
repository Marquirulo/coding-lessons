/*EJ3*/
CREATE TABLE ejemplo1 (
    dni     VARCHAR2(10),
    nombre  VARCHAR2(30),
    edad    NUMBER(2),
    fecha   DATE    DEFAULT SYSDATE,
    CONSTRAINT ejemplo1_pk PRIMARY KEY (dni)
);

INSERT INTO ejemplo1 (dni, nombre, edad)
VALUES ('12345678V', 'Santiago', 36);

/*EJ4*/
CREATE TABLE ejemplo2 (
    dni     VARCHAR2(10),
    nombre  VARCHAR2(30) DEFAULT 'No definido',
    usuario NUMBER       DEFAULT 0
);

INSERT INTO ejemplo2 (dni)
VALUES ('1234567R');

/*EJ5*/
CREATE TABLE ejer5 (
    dni     VARCHAR2(10) NOT NULL,
    nombre  VARCHAR2(30),
    edad    NUMBER(2) NOT NULL,
    curso   NUMBER,
    CONSTRAINT ejer5_pk PRIMARY KEY (dni),
    CONSTRAINT ejer5_c1 CHECK (edad BETWEEN 5 AND 20),
    CONSTRAINT ejer5_c2 CHECK (nombre = UPPER(nombre)),
    CONSTRAINT ejer5_c3 CHECK (curso IN (1,2,3))
);

INSERT INTO ejer5 VALUES ('12345X','Pepe',4,1);
INSERT INTO ejer5 VALUES ('12345X','PEPE',10,2);
INSERT INTO ejer5 VALUES ('12345X','MARIA',12,2);
INSERT INTO ejer5 VALUES ('22345X','MARIA',12,5);
INSERT INTO ejer5 VALUES ('22345X','MARIA',12,2);

/*EJ6*/
CREATE TABLE ejer6 (
    dni     VARCHAR2(10),
    nombre  VARCHAR2(30) UNIQUE,
    edad    NUMBER(2),
    fecha   DATE DEFAULT SYSDATE,
    CONSTRAINT ejer6_pk PRIMARY KEY (dni)
);

INSERT INTO ejer6 (dni, nombre, edad) VALUES ('12345Z', 'LUIS', 20);
INSERT INTO ejer6 (dni, nombre, edad) VALUES ('12345Y', 'LUIS', 21);

select * from ejer6;

/*EJ7*/
CREATE TABLE ejer7 AS SELECT * FROM ejer6;

/*EJ8*/
CREATE TABLE ejer8 AS SELECT dni iden, nombre usua, edad anos, fecha hoy FROM ejer7;

/*EJ9*/
CREATE TABLE emple_depart AS
    SELECT e.apellido, d.dnombre
        FROM emple e
    JOIN depart d USING (dept_no);

/*EJ10*/
CREATE TABLE dept_ventas AS
    SELECT e.apellido, d.dnombre, sysdate fecha_alta
        FROM emple e
    JOIN depart d USING (dept_no)
    WHERE UPPER(d.dnombre) = 'VENTAS';
