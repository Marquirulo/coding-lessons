/**** Variables ******/
  var edad = 20; // Podemos crear variables con valor
  var dia, mes, calle; // O crear varias variables sin valor en una misma linea
  //Actualmente se recomiendan los siguientes terminos
  let edad = 20 // Para variables
  const nombre = 'Marcos' // Para constantes
  //Para saber el tipo de variable podemos usar typeof
  let num = 2
  alert(typeof num) //OUTPUT: << number >>
  alert(typeof nada) //OUTPUT: << undefined >>
/**** Input ****/
  prompt('Introduce tu nombre: ', 'Nombre') //El primer parámetro indica el mesaje en pantalla y el segundo el valor por defecto
