/* Creamos un usuario denominado "usuario", con contraseña "usuario", le asignamos espacio en "system" (100M). 
Antes lo eliminamos por si existe */

DROP USER usuario CASCADE;

CREATE USER usuario IDENTIFIED BY usuario
DEFAULT tablespace system
quota 100M ON system;

/* Concedemos usuarios permiso para conectarse */

GRANT CREATE SESSION TO usuario;

/* Concedemos permiso para crear tablas y vistas al usuario */

GRANT CREATE TABLE, CREATE VIEW TO usuario;

/* Concedemos permiso para crear triggers y procedimientos a ambos usuarios */
GRANT CREATE TRIGGER, CREATE PROCEDURE TO usuario;
