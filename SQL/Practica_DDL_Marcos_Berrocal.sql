/********* BORRADO PREVIO DE LAS TABLAS *********/
--Borro todas las tablas que voy a crear para evitar errores en caso de que ya existan unas con el mismo nombre, además incluyo el CASCADE CONSTRAINTS para evitar problemas en el borrado por integridad referencial.
DROP TABLE empleados CASCADE CONSTRAINTS;
DROP TABLE historial_salarial CASCADE CONSTRAINTS;
DROP TABLE universidades CASCADE CONSTRAINTS;
DROP TABLE estudios CASCADE CONSTRAINTS;
DROP TABLE trabajos CASCADE CONSTRAINTS;
DROP TABLE departamentos CASCADE CONSTRAINTS;
DROP TABLE historial_laboral CASCADE CONSTRAINTS;
DROP TABLE categorias CASCADE CONSTRAINTS;


/********* TABLA EMPLEADOS *********/
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
    CONSTRAINT empleados_ck CHECK (sexo IN ('H','M','N/A')) -- Creo una regla de validación para que el campo sexo solo pueda contener los valores 'H','M','N/A'
);

-- Añado 4 registros a la tabla
INSERT INTO empleados VALUES (98563247, 'Marcos','Berrocal','Solis','d1','d11','Fuenlabrada','Madrid',28943,'H','03/03/2005');
INSERT INTO empleados VALUES (45632791, 'María','García','Ballesteros','d2','d22','Móstoles','Madrid',27145,'M','01/08/1994');
INSERT INTO empleados VALUES (12335794, 'Julia','Sánchez','Del Bosque','Paseo del Álamo, 3','d33','Ávila','Ávila',84569,'M','25/02/1980');
INSERT INTO empleados VALUES (34569218, 'Iris','Pérez','Texeira','d4','d44','Barcelona','Barcelona',87596,'N/A','13/10/1969');

COMMIT;

/********* TABLA HISTORIAL_SALARIAL *********/
CREATE TABLE historial_salarial (
    empleado_dni    NUMBER(8)   PRIMARY KEY,
    salario         NUMBER(9)   NOT NULL,
    fecha_comienzo  DATE,
    fecha_fin       DATE,
    CONSTRAINT hist_sal_fk FOREIGN KEY (empleado_dni) REFERENCES empleados -- Declaro empleado_dni como FK de empleados
);

-- Añado 4 registros a la tabla
INSERT INTO historial_salarial VALUES (98563247,57000,'21/11/2023','');
INSERT INTO historial_salarial VALUES (45632791,13459,'06/09/2004','26/02/2019');
INSERT INTO historial_salarial VALUES (12335794,23485,'18/04/2017','');
INSERT INTO historial_salarial VALUES (34569218,9568,'3/01/2024','03/02/2024');

COMMIT;

/********* TABLA UNIVERSIDADES *********/
CREATE TABLE universidades(
    univ_cod        NUMBER(5)   PRIMARY KEY,
    nombre_univ     VARCHAR(25) NOT NULL,
    ciudad          VARCHAR2(20),
    municipio       VARCHAR2(20),
    cod_postal      NUMBER(5)
);

-- Añado 4 registros a la tabla
INSERT INTO universidades VALUES (58746, 'Nebrija', 'Madrid', 'Móstoles', 28936);
INSERT INTO universidades VALUES (62345, 'UIC', 'Barcelona', 'Barcelona', 24932);
INSERT INTO universidades VALUES (95124, 'IE University', 'Segovia', 'Segovia', 29853);
INSERT INTO universidades VALUES (34856, 'Rey Juan Carlos I', 'Madrid', 'Fuenlabrada', 28944);

COMMIT;

/********* TABLA ESTUDIOS *********/
CREATE TABLE estudios (
    empleado_dni    NUMBER(8)    PRIMARY KEY,
    universidad     NUMBER(5)    NOT NULL,
    año             NUMBER(4),
    grado           VARCHAR2(20),
    especialidad    VARCHAR(30),
    CONSTRAINT estudios_fk  FOREIGN KEY (empleado_dni) REFERENCES empleados, -- Declaro empleado_dni como FK de empleados(dni)
    CONSTRAINT estudios_fk2 FOREIGN KEY (universidad) REFERENCES universidades, -- Declaro universidad como FK de universidades(univ_cod)
    CONSTRAINT estudios_ck CHECK (año > 2000) -- Creo una regla de validación para que el campo año tenga que ser posterior al 2000
);
    
-- Añado 4 registros a la tabla
INSERT INTO estudios VALUES (98563247,34856,2020,'ASIR','Informática');
INSERT INTO estudios VALUES (45632791,95124,2005,'Contabilidad','Comercio');
INSERT INTO estudios VALUES (12335794,62345,2016,'ADE','Empresariales');
INSERT INTO estudios VALUES (34569218,58746,2023,'Marketing','Publicidad');

COMMIT;

/********* TABLA TRABAJOS *********/
CREATE TABLE trabajos(
    trabajo_cod         NUMBER(5)       PRIMARY KEY,
    nombre_trab     VARCHAR2(20)    NOT NULL,
    salario_min     NUMBER(9)       NOT NULL,
    salario_max     NUMBER(9)       NOT NULL,
    CONSTRAINT trabajos_ck CHECK (salario_min BETWEEN 15000 AND 25000) -- Creo una regla de validación para que el campo salario_min tenga que estar en el rango entre 15000 y 25000
);

-- Añado 4 registros a la tabla
INSERT INTO trabajos VALUES (00001,'Analista de Red',25000,8000);
INSERT INTO trabajos VALUES (00002,'Contable',17000,30000);
INSERT INTO trabajos VALUES (00003,'Direccion',23000,50000);
INSERT INTO trabajos VALUES (00004,'Publicitario',15000,4000);


COMMIT;

/********* TABLA DEPARTAMENTOS *********/
CREATE TABLE departamentos(
    dept_no         NUMBER(5)       PRIMARY KEY,
    nombre_dpto     VARCHAR2(30)    NOT NULL,
    dpto_padre      NUMBER(5),
    presupuesto     NUMBER(9)       NOT NULL,
    pres_actual     NUMBER(9),
    CONSTRAINT departamentos_fk FOREIGN KEY (dpto_padre) REFERENCES departamentos -- Declaro dpto_padre como FK de departamentos(dept_no)
);

-- Añado 4 registros a la tabla
INSERT INTO departamentos VALUES (00001, 'Direccion', NULL, 15236984, 10000247);
INSERT INTO departamentos VALUES (00002, 'Finanzas', 00001, 78956, 645812);
INSERT INTO departamentos VALUES (00003, 'Contabilidad', 00002, 325698, 302568);
INSERT INTO departamentos VALUES (00004, 'IT', 00001, 123548, 96253);

COMMIT;

/********* TABLA HISTORIAL_LABORAL *********/
CREATE TABLE historial_laboral(
    empleado_dni    NUMBER(8)   PRIMARY KEY,
    trabajo_cod     NUMBER(5),
    fecha_inicio    DATE,
    fecha_fin       DATE,
    dept_cod        NUMBER(5),
    supervisor_dni  NUMBER(8),
    CONSTRAINT hist_laboral_fk FOREIGN KEY (empleado_dni) REFERENCES empleados, -- Declaro empleado_dni como FK de empleados(dni)
    CONSTRAINT hist_laboral_fk2 FOREIGN KEY (trabajo_cod) REFERENCES trabajos, -- Declaro trabajo_cod como FK de trabajos(trabajo_cod)
    CONSTRAINT hist_laboral_fk3 FOREIGN KEY (dept_cod) REFERENCES departamentos, -- Declaro dept_cod como FK de departamentos(dept_no)
    CONSTRAINT hist_laboral_fk4 FOREIGN KEY (supervisor_dni) REFERENCES empleados -- Declaro supervisor_dni como FK de empleados(dni)
);

COMMIT;

-- Añado 4 registros a la tabla
INSERT INTO historial_laboral VALUES (98563247, 00001, '05/05/2020', NULL, 00004, 12335794);
INSERT INTO historial_laboral VALUES (45632791, 00002, '05/05/2023', NULL, 00003, 12335794);
INSERT INTO historial_laboral VALUES (12335794, 00003, '26/02/2014', NULL, 00001, NULL);
INSERT INTO historial_laboral VALUES (34569218, 00004, '04/12/2008', '19/11/2022', 0002, 45632791);

COMMIT;

/********* TABLA CATEGORIAS *********/
CREATE TABLE categorias(
    cod_categoria   VARCHAR2(5) PRIMARY KEY,
    categoria       VARCHAR2(15)
);

-- Añado 4 registros a la tabla
INSERT INTO categorias VALUES ('B', 'Becario');
INSERT INTO categorias VALUES ('J', 'Junior');
INSERT INTO categorias VALUES ('S', 'Senior');
INSERT INTO categorias VALUES ('M', 'Manager');

COMMIT;


/*********** PARTE II ***********/
/*Ej 1*/
ALTER TABLE trabajos MODIFY nombre_trab UNIQUE; -- Modifico la tabla trabajos para que no pueda haber dos con el mismo nombre
ALTER TABLE departamentos MODIFY nombre_dpto UNIQUE; -- Modifico la tabla departamentos para que no pueda haber dos con el mismo nombre

/*Ej 2,3,4*/
ALTER TABLE empleados -- Realizo todas la modificaciones de empleados en una sola ejecución
    ADD valoracion NUMBER(2) -- Añado un campo valoración de tipo numérico, con precisión 2 ya que el máx número que se podrá poner es el 10.
    ADD CONSTRAINT empleados_ck2 CHECK (valoracion BETWEEN 1 AND 10) -- Añado la restricción para que solo pueda tomar valores entre 1 y 10
    MODIFY nombre NULL -- Modifico el campo nombre para que permita los valores nulos
    ADD cod_categoria VARCHAR2(5) -- Añado el campo cod_categoría
    ADD CONSTRAINT empleados_fk FOREIGN KEY (cod_categoria) REFERENCES categorias; -- Declaro cod_categoria como FK de categorias(cod_categoria) para mantener la integridad referencial.
    
/*Ej 5*/
UPDATE empleados -- En una ejecución asigno un valor al campo cod_categoria a los 4 registros de empleados (2 Manager y 2 Senior)
    SET cod_categoria = CASE dni
                            WHEN 98563247 THEN 'M'
                            WHEN 45632791 THEN 'S'
                            WHEN 12335794 THEN 'S'
                            WHEN 34569218 THEN 'M'
                            ELSE cod_categoria
                        END;
