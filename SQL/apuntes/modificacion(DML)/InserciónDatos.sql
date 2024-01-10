/*Para realizar modificaiones debemos realizar dos pasos. 1º La modificacion y 2º la comprobación usando visualización*/
/*Para que la inserción sea correcta los valores deben estar en orden y coincidir en el tipo*/
/**** INSERT ****/
  /*Añadir registros completos*/
    INSERT INTO JOBS VALUES ('REP', 'REPRESENTANTE', '1800')
  /*Añadir valores sueltos de registros, si no se indica ningun valor se rellen el valor DF o NULL*/
    INSERT INTO JOBS (JOB_ID, JOB_TITTLE) VALUES ('REP', 'REPRESENTANTE')
