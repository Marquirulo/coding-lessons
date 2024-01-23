/*Las restricciones de tipo FOREIGN KEY provocan una restricción de integridad referencial, en la que
no se pueden indicar datos en las claves secundarias que no existan en las claves principales
relacionadas.
Oracle dispone de 2 políticas de borrado:
  • ON DELETE CASCADE: si se borran datos en la tabla padre, automáticamente se eliminarán esos registros en la tabla hija.
  • ON DELETE SET NULL: si se borran datos en la tabla padre, los registros correspondientes en la tabla hija se cambiarán a null.
Si no especificamos ninguna de estas opciones por defecto el borrado es RESTRICT, es decir, no se permite el borrado si rompe la restricción de integridad.*/

/**** ON DELETE CASCADE ****/
/*Si borramos un registros cuya PK es FK en otra tabla se borran todos los registros con esta FK*/
CREATE TABLE EMPLEADO (
  COD_EMPLE NUMBER(4) PRIMARY KEY,
  APELLIDO VARCHAR2(10),
  COD_DEPT NUMBER(2),
  CONSTRAINT FK_DEPART FOREIGN KEY(COD_DEPT) REFERENCES DEPARTAMENTO ON DELETE CASCADE
);


/**** ON DELETE SET NULL ****/
/*Si borramos un registros cuya PK es FK en otra tabla esta FK se convierte en NULL*/
