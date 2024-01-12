Como se ha comentado anteriormente, una transacción está formada por una serie de instrucciones DML. Una transacción comienza con la primera instrucción DML que se ejecute y finaliza al darse alguna de estas
situaciones:

  ■ Una instrucción COMMIT (todas las instrucciones de la transacción se aceptan)
  ■ Una instrucción ROLLBACK (se anulan todas las instrucciones de la transacción)
  ■ Una instrucción DDL, como CREATE TABLE, ALTER TABLE, etc. En este caso la transacción se acepta (como si hubiéramos hecho un COMMIT).
  ■ Una instrucción DCL (como GRANT por ejemplo). Al igual que en el caso anterior, la transacción quedará aceptada.
  ■ Que el usuario abandone la sesión. En ese caso se anula la transacción, salvo que el software que use el usuario realice un COMMIT automáticamente antes de cerrar la sesión. De hecho, muchos entornos de trabajo preguntan, antes de cerrar la sesión, lo que deseamos hacer con la transacción en curso. Indudablemente si cerramos la sesión por un fallo o de forma indebida, entonces seguro que la
transacción se anula.
  ■ Caída del sistema. Se anula la transacción.
  
De este modo aseguramos que los datos serán consistentes y podremos probar los resultados de algunas instrucciones sin peligro antes de realizar su versión definitiva.

/**** ACID ****/
  • Atomicidad (A). Que implica que ninguna instrucción se pueda quedar a medias. Es decir o se ha ejecutado completamente o no, aunque ocurra un error grave en el servidor.
  • Consistencia (C). Asegura que una transacción siempre mantiene la integridad de los datos, se anule o se lleve finalmente a cabo la transacción. Incluso en cualquier momento intermedio de la transacción.
  • Aislamiento (I). Asegura que las transacciones simultáneas no se afecten entre sí. Es decir que una transacción será independiente de la otra.
  • Durabilidad (D). Asegura que cuando se confirme la transacción, los efectos de sus instrucciones serán definitivos, independientemente de que el sistema se apague o cierre por un error grave.
