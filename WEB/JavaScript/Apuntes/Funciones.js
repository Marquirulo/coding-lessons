/**** VARIABLES ******/
  var edad = 20; //Podemos crear variables con valor,
  var dia, mes, calle; //O crear varias variables sin valor en una misma linea
  //Actualmente se recomiendan los siguientes terminos
  let edad = 20; // Para variables
  const nombre = 'Marcos'; //Para constantes
  //Para saber el tipo de variable podemos usar typeof
  let num = 2;
  alert(typeof num); //OUTPUT: << number >>
  alert(typeof nada); //OUTPUT: << undefined >>

/**** ENTRADAS DE DATOS ****/
  prompt('Introduce tu nombre: ', 'Nombre'); //El primer parámetro indica el mesaje en pantalla y el segundo el valor por defecto

/**** OPERADORES ****
  *** Caracteres de escape ***            *** Operadores Aritméticos***
    \n : Salto de línea.                     + : Suma / Concatenación
    \" : Comillas dobles.                    - : Resta
    \' : Comillas simples.                   * : Multiplicación
    \t : Tabulador.                          / : División
    \r : Retorno del carro.                  % : Módulo
    \f : Avance de página.                   ++ : Incremento
    \b : Retroceder espacio.                 -- : Decremento
    \\ : Contrabarra.
  *** Operadores de Asignación (con variables)***
    += : Suma dos números y asigna el valor al primero
    -= : Resta dos números y asigna el valor al primero
    *= : Multiplica dos números y asigna el valor al primero
    /= : Divide dos números y asigna el valor al primero
    %= : Saca el resto de dos números y asigna el valor al primero
  *** Operadores Condicionales ***                                  *** Operadores Lógicos ****
    == : Igual                                                        && : AND
    === : Idéntico //Comprueba que los valores sean del mismo tipo    || : OR
    != : Distinto                                                     ! : NOT 
    !== : No Idéntico
    > : Mayor
    < : Menor
    >= : Mayor o igual
    <= : Menor o igual
*/
