/*Creación de Tabla e Inserción de Registros*/
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
    fecha_nac   DATE,
    CONSTRAINT empleados_ck CHECK (sexo IN ('H','M','N/A'))
);
INSERT INTO empleados VALUES (98563247, 'Marcos','Berrocal','Solis','d1','d11','Fuenlabrada','Madrid',28943,'H','03/03/2005');
INSERT INTO empleados VALUES (45632791, 'María','García','Ballesteros','d2','d22','Móstoles','Madrid',27145,'M','01/08/1994');
INSERT INTO empleados VALUES (12335794, 'Julia','Sánchez','Del Bosque','Paseo del Álamo, 3','d33','Ávila','Ávila',84569,'M','25/02/1980');
INSERT INTO empleados VALUES (34569218, 'Iris','Pérez','Texeira','d4','d44','Barcelona','Barcelona',87596,'N/A','13/10/1969');

CREATE TABLE historial_salarial (
    empleado_dni    NUMBER(8)   PRIMARY KEY,
    salario         NUMBER(9)   NOT NULL,
    fecha_comienzo  DATE,
    fecha_fin       DATE,
    CONSTRAINT hist_sal_fk FOREIGN KEY (empleado_dni) REFERENCES empleados
);
INSERT INTO historial_salarial VALUES (98563247,57000,'21/11/2023','');
INSERT INTO historial_salarial VALUES (45632791,13459,'06/09/2004','26/02/2019');
INSERT INTO historial_salarial VALUES (12335794,23485,'18/04/2017','');
INSERT INTO historial_salarial VALUES (34569218,9568,'3/01/2024','03/02/2024');

CREATE TABLE universidades(
    univ_cod        NUMBER(5)   PRIMARY KEY,
    nombre_univ     VARCHAR(25) NOT NULL,
    ciudad          VARCHAR2(20),
    municipio       VARCHAR2(20),
    cod_postal      NUMBER(5)
);
INSERT INTO universidades VALUES (58746, 'Nebrija', 'Madrid', 'Móstoles', 28936);
INSERT INTO universidades VALUES (62345, 'UIC', 'Barcelona', 'Barcelona', 24932);
INSERT INTO universidades VALUES (95124, 'IE University', 'Segovia', 'Segovia', 29853);
INSERT INTO universidades VALUES (34856, 'Rey Juan Carlos I', 'Madrid', 'Fuenlabrada', 28944);


CREATE TABLE estudios (
    empleado_dni    NUMBER(8)    PRIMARY KEY,
    universidad     NUMBER(5)    NOT NULL,
    año             NUMBER(4),
    grado           VARCHAR2(20),
    especialidad    VARCHAR(30),
    CONSTRAINT estudios_fk  FOREIGN KEY (empleado_dni) REFERENCES empleados,
    CONSTRAINT estudios_fk2 FOREIGN KEY (universidad) REFERENCES universidades,
    CONSTRAINT estudios_ck CHECK (año > 2000)
);
INSERT INTO estudios VALUES (98563247,34856,2020,'ASIR','Informática');
INSERT INTO estudios VALUES (45632791,95124,2005,'Contabilidad','Comercio');
INSERT INTO estudios VALUES (12335794,95124,2016,'ADE','Empresariales');
INSERT INTO estudios VALUES (34569218,58746,2023,'Marketing','Publicidad');

CREATE TABLE trabajos(
    trabajo_cod         NUMBER(5)       PRIMARY KEY,
    nombre_trab     VARCHAR2(20)    NOT NULL,
    salario_min     NUMBER(9)       NOT NULL,
    salario_max     NUMBER(9)       NOT NULL,
    CONSTRAINT trabajos_ck CHECK (salario_min BETWEEN 15000 AND 25000)
);
INSERT INTO trabajos VALUES (00001,'Analista de Seguridad',25000,8000);
INSERT INTO trabajos VALUES (00002,'Contable',17000,30000);
INSERT INTO trabajos VALUES (00003,'Direccion',23000,50000);
INSERT INTO trabajos VALUES (00004,'Publicitario',15000,4000);

CREATE TABLE departamentos(
    dept_no         NUMBER(5)       PRIMARY KEY,
    nombre_dpto     VARCHAR2(30)    NOT NULL,
    dpto_padre      NUMBER(5),
    presupuesto     NUMBER(9)       NOT NULL,
    pres_actual     NUMBER(9),
    CONSTRAINT departamentos_fk FOREIGN KEY (dpto_padre) REFERENCES departamentos
);

CREATE TABLE historial_laboral(
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

CREATE TABLE Categorias(
    cod_categoria   VARCHAR2(5) PRIMARY KEY,
    categoria       VARCHAR2(15)
);
INSERT INTO categorias VALUES ('B', 'Becario');
INSERT INTO categorias VALUES ('J', 'Junior');
INSERT INTO categorias VALUES ('S', 'Senior');
INSERT INTO categorias VALUES ('M', 'Manager');
