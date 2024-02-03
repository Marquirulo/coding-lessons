/*Parte1*/
CREATE TABLE empleados (
    dni         NUMBER(8)       PRIMARY KEY,
    nombre      VARCHAR2(10)    NOT NULL,
    apellido1   VARCHAR2(15)    NOT NULL,
    apellido2   VARCHAR2(15),
    direcc1     VARCHAR2(25),
    direcc2     VARCHAR2(20),
    ciudad      VARCHAR2(20),
    provincia   VARCHAR2(10),
    cod_postal  NUMBER(5),
    sexo        VARCHAR2(3),
    fecha_nac   DATE
);

CREATE TABLE HISTORIAL_SALARIAL (
    empleado_dni    NUMBER(8)   PRIMARY KEY,
    salario         NUMBER(9)   NOT NULL,
    fecha_comienzo  DATE,
    fecha_fin       DATE,
    CONSTRAINT hist_sal_fk FOREIGN KEY (empleado_dni) REFERENCES empleados
);

CREATE TABLE UNIVERSIDADES(
    univ_cod        NUMBER(5)   PRIMARY KEY,
    nombre_univ     VARCHAR(25) NOT NULL,
    ciudad          VARCHAR2(20),
    municipio       VARCHAR2(20),
    cod_postal      NUMBER(5)
);

CREATE TABLE ESTUDIOS (
    empleado_dni    NUMBER(8)    PRIMARY KEY,
    universidad     NUMBER(5)    NOT NULL,
    año             NUMBER(4),
    grado           VARCHAR2(20),
    especialidad    VARCHAR(30),
    CONSTRAINT estudios_fk  FOREIGN KEY (empleado_dni) REFERENCES empleados,
    CONSTRAINT estudios_fk2 FOREIGN KEY (universidad) REFERENCES universidades,
    CONSTRAINT estudios_ck CHECK (año > 2000)
);

CREATE TABLE TRABAJOS(
    dept_no         NUMBER(5)       PRIMARY KEY,
    nombre_trab     VARCHAR2(20)    NOT NULL,
    salario_min     NUMBER(9)       NOT NULL,
    salario_max     NUMBER(9)       NOT NULL,
    CONSTRAINT trabajos_ck CHECK (salario_min BETWEEN 15000 AND 25000)
);

CREATE TABLE DEPARTAMENTOS(
    dept_no         NUMBER(5)       PRIMARY KEY,
    nombre_dpto     VARCHAR2(30)    NOT NULL,
    dpto_padre      NUMBER(5),
    presupuesto     NUMBER(9)       NOT NULL,
    pres_actual     NUMBER(9),
    CONSTRAINT departamentos_fk FOREIGN KEY (dpto_padre) REFERENCES departamentos
);

CREATE TABLE HISTORIAL_LABORAL(
    empleado_dni    NUMBER(8)   PRIMARY KEY,
    trabajo_cod     NUMBER(5),
    fecha_inicio    DATE,
    fecha_fin       DATE,
    dept_cod        NUMBER(5),
    supervisor_dni  NUMBER(8),
    CONSTRAINT hist_laboral_fk FOREIGN KEY (empleado_dni) REFERENCES empleados,
    CONSTRAINT hist_laboral_fk2 FOREIGN KEY (trabajo_cod) REFERENCES trabajos,
    CONSTRAINT hist_laboral_fk3 FOREIGN KEY (dept_cod) REFERENCES trabajos,
    CONSTRAINT hist_laboral_fk4 FOREIGN KEY (supervisor_dni) REFERENCES empleados
);

CREATE TABLE CATEGORIAS(
    cod_categoria   VARCHAR2(5) PRIMARY KEY,
    categoria       VARCHAR2(15)
);

SELECT * FROM HISTORIAL_LABORAL;
