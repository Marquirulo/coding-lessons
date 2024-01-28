//Hay dos maneras de acceder a los elementos de un formulario
document.getElementById('nombre'); //Usando los metodos propios del DOM
document.froms[0].elements[0]; //Usando los Arrays de formulario
document.formulario; //El DOM permite acceder mediante el atributo name del formulario de esta manera

//Para obtener el valor de los formularios usamos:
//Texto y textarea
var valor = document.getElementById("texto").value;
//Radio
//Aquí nos interesa conocer cual está seleccionado por lo cual usariamos el siguiente:
var elementos = document.getElementsByName("pregunta");
for(var i=0; i<elementos.length; i++) {
alert(" Elemento: " + elementos[i].value + "\n Seleccionado: " +
elementos[i].checked);
} 
