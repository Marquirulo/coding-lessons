/*1*/
CREATE TABLE fabricantes(
    COD_FABRICANTE NUMBER(3) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR2 (15),
    PAIS VARCHAR2 (15),
    CONSTRAINT fabricantes_ck1 CHECK (nombre = UPPER(nombre)),
    CONSTRAINT fabricantes_ck2 CHECK (pais = UPPER(pais))
);

CREATE TABLE articulos (
    COD_ARTICULO VARCHAR2(20) NOT NULL,
    COD_FABRICANTE NUMBER(3) NOT NULL,
    PESO NUMBER(3) NOT NULL,
    CATEGORIA VARCHAR2(10) NOT NULL,
    PRECIO_VENTA NUMBER(4),
    PRECIO_COSTE NUMBER(4),
    EXISTENCIAS NUMBER(5),
    CONSTRAINT articulos_pk PRIMARY KEY (COD_ARTICULO, COD_FABRICANTE, PESO, CATEGORIA),
    CONSTRAINT articulos_fk1 FOREIGN KEY (cod_fabricante) REFERENCES fabricantes,
    CONSTRAINT articulos_ck1 CHECK (peso > 0),
    CONSTRAINT articulos_ck2 CHECK (precio_venta > 0),
    CONSTRAINT articulos_ck3 CHECK (precio_coste > 0),
    CONSTRAINT articulos_ck4 CHECK (categoria in ('primera', 'segunda', 'tercera'))
);

CREATE TABLE tiendas (
    NIF VARCHAR2(10) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR2 (29),
    DIRECCION VARCHAR2 (20),
    POBLACION VARCHAR2(20),
    PROVINCIA VARCHAR2 (20),
    COD_POSTAL NUMBER(5),
    CONSTRAINT tiendas_ck1 CHECK (provincia = UPPER(provincia))
);

CREATE TABLE PEDIDOS(
    NIF               VARCHAR2(10) NOT NULL,
    COD_ARTICULO      VARCHAR2(20) NOT NULL,
    COD_FABRICANTE    NUMBER(3) NOT NULL,
    PESO              NUMBER(3) NOT NULL,
    CATEGORIA         VARCHAR2(10) NOT NULL,
    FECHA_PEDIDO      DATE NOT NULL,
    UNIDADES_PEDIDAS  NUMBER(4),
    CONSTRAINT pedidos_pk PRIMARY KEY (NIF, COD_ARTICULO, COD_FABRICANTE, PESO, CATEGORIA, FECHA_PEDIDO),
    CONSTRAINT pedidos_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes,
    CONSTRAINT pedidos_fk2 FOREIGN KEY (COD_ARTICULO, COD_FABRICANTE, PESO,CATEGORIA) REFERENCES ARTICULOS (COD_ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) ON DELETE CASCADE,
    CONSTRAINT pedidos_fk3 FOREIGN KEY (nif) REFERENCES TIENDAS,
    CONSTRAINT pedidos_ck1 CHECK (unidades_pedidas > 0),
    CONSTRAINT pedidos_ck2 CHECK (categoria IN ('primera', 'segunda', 'tercera'))
);

CREATE TABLE VENTAS(
    NIF                VARCHAR2(10) NOT NULL,
    COD_ARTICULO       VARCHAR2(20) NOT NULL,
    COD_FABRICANTE     NUMBER(3) NOT NULL,
    PESO               NUMBER(3) NOT NULL,
    CATEGORIA          VARCHAR2(10) NOT NULL,
    FECHA_VENTA        DATE NOT NULL,
    UNIDADES_VENDIDAS  NUMBER(4),
    CONSTRAINT ventas_pk PRIMARY KEY(NIF,COD_ARTICULO,COD_FABRICANTE, PESO, CATEGORIA, FECHA_VENTA),
    CONSTRAINT ventas_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes, 
    CONSTRAINT ventas_fk2 FOREIGN KEY (COD_ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) REFERENCES ARTICULOS (COD_ARTICULO, COD_FABRICANTE, PESO, CATEGORIA),
    CONSTRAINT ventas_fk3 FOREIGN KEY (nif) REFERENCES tiendas,
    CONSTRAINT ventas_ck1 CHECK (unidades_vendidas > 0),
    CONSTRAINT ventas_ck2 CHECK (categoria IN ('primera', 'segunda', 'tercera'))
);

SELECT * FROM all_constraints WHERE TABLE_NAME = 'TIENDAS';

/*Ej2*/
ALTER TABLE tiendas 
    ADD CONSTRAINT tiendas_ck2 CHECK (nombre = LOWER(nombre));
    
/*Ej3*/
ALTER TABLE pedidos
    MODIFY unidades_pedidas NUMBER(6);

ALTER TABLE ventas
    MODIFY unidades_vendidas NUMBER(6);
    
/*Ej4*/
ALTER TABLE tiendas
    ADD CONSTRAINT tiendas_ck3 CHECK (provincia != 'TOLEDO');
    
/*Ej5*/
ALTER TABLE pedidos
    ADD pvp NUMBER(4);
ALTER TABLE ventas
    ADD pvp NUMBER(4);
    
/*Ej6*/
ALTER TABLE tiendas
    MODIFY nombre VARCHAR2(100);
    
/*Ej7*/
CREATE TABLE piezas (
    cod_pieza NUMBER(5) PRIMARY KEY,
    nombre VARCHAR2(30),
    pieza_aux NUMBER(5),
    peso NUMBER(5,2) NOT NULL,
    CONSTRAINT piezas_fk FOREIGN KEY (pieza_aux) REFERENCES piezas
);

/*ej8*/
INSERT INTO piezas (cod_pieza, nombre, peso) VALUES (82540,'rodillo',32.4);

/*Ej9*/
INSERT INTO piezas VALUES (34501, 'rueda', 82540, 40);

/*Ej10*/
INSERT INTO piezas VALUES (65497, 'remolque', 54761, 90);   --  Da error de integridad

/*Ej11*/
ALTER TABLE profesores 
    ADD cod_asig NUMBER(2);
    
/*Ej12*/
CREATE TABLE tasig (
    cod_asig NUMBER(2),
    nom_asig VARCHAR2(20)
);

/*Ej13*/
ALTER TABLE tasig
    ADD CONSTRAINT tasig_pk PRIMARY KEY (cod_asig);
    
/*Ej14*/
ALTER TABLE profesores
    ADD CONSTRAINT cod_asig FOREIGN KEY (cod_asig) REFERENCES tasig;

/*Ej15*/
DROP TABLE tasig CASCADE CONSTRAINTS;
