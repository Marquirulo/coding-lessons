/**** Ejemplos 1 ****/
CREATE TABLE ZONAS ( COD_ZONA     NUMBER(2),
                     NOMBRE_ZONA  VARCHAR2(15) NOT NULL,
                     MAS_DATOS    VARCHAR2(60));

/**** Ejemplos 2 ****/
CREATE TABLE zapatos (id_zapato VARCHAR2(20),
                      tipo_zapato VARCHAR2(30) NOT NULL,
                      material VARCHAR2(15),
                      talla NUMBER(2),
                      genero VARCHAR2(1) NOT NULL,
                      CONSTRAINT zapatos_pk PRIMARY KEY(id_zapato),
                      CONSTRAINT zapatos_ck1 CHECK (genero in ('H','M')));
                      
/**** Ejemplos 3 ****/

CREATE TABLE provincias (cod_prov   NUMBER(2),
                         nom_prov   VARCHAR2(15),
                         CONSTRAINT provincias_pk PRIMARY KEY (cod_prov));
                         
CREATE TABLE personas (dni       NUMBER(8),
                       nombre    VARCHAR2(15),
                       direccion VARCHAR2(25),
                       poblacion VARCHAR2(20),
                       cod_prov  NUMBER(2) NOT NULL,
                       CONSTRAINT personas_pk PRIMARY KEY (dni),
                       CONSTRAINT personas_fk FOREIGN KEY (cod_prov) REFERENCES provincias);        
                       
INSERT INTO provincias VALUES (6, 'Badajoz');                       
INSERT INTO provincias VALUES (28, 'Madrid');
                       
INSERT INTO personas VALUES (1111, 'Alex', 'Hernan Cortes, 13', 'Zafra', 6);                       
INSERT INTO personas VALUES (2222, 'Violeta', 'Los Pinos 155', 'Madrid', 28);                       
INSERT INTO personas VALUES (3333, 'Roque', 'Avda. del Aljarafe, 21', 'Ecija', 41);
