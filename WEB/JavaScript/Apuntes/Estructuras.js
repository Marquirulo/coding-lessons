/**** FUNCIONES ****/
  function miFuncion(num1, num2){ //A las funciones podemos añadirles parámetros
    //Código
    return valorRetorno; //Valor que devuelve la función al entorno global tras su ejecución
  }
//Llamada
  miFuncion(1, 4)
  resultado = miFuncion(1, 4) // Si queremos guardar el return
/**** ARRAYS ****/
//Creación
  let miArray = ['norte', 'sur', 'este', 'oeste'];
  let otroArray = new Array('norte', 'sur', 'este', 'oeste');
  let otroArray2 = new Array(); //Array vacío
  let otroArray3 = new Array(4); //Indica el tamaño que tendrá
//Acceso y Modificación
  miArray[0]; //Accede al primer elemento del Array
  miArray[0] = 'noroeste'; //Modifica/Crea el valor de esa posción del Array
  miarray.length; //Muestra el tamaño del Array

/**** CONDICIONALES ****/
//If - Else
  if (a==b) {
    //Código
  } else if (a==c) {
    //Código
  } else {
    //Código
  }
//Switch
  switch (variable) {
    case valor_1 :
      //Código
    break;
    case valor_2 :
      //Código
    break;
    case valor_3 :
      //Código
    break;
    default :
      //Código
    break;
  }

/**** BUCLES ****/
//For
  for (i=1 /*Inicialización*/; i <= 10 /*Condición*/; i++ /*Actualización*/) {
    //Código
  }
//For in
  for (i in miarray) {
    print(miarray(i);
  }
//While
  while (i < 10) {
    //Código
    i++; //Actualización de la variable para que en algún punto deje de cumplirse
  }
//Do while (garantiza que el código se ejecute una vez aunque no se cumpla la condición nunca)
  do {
    //Código
  } while (i > 10)
