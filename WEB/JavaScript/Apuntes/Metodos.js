/**** IDENTIFICACION DE ELEMENTOS ****/
  document.getElementById('idDemo');
  document.getElementByTagName('p'); //Selecciona etiquetas HTML
  document.getElementByName('nombre') ;
  document.getElementByClassName('colores');

/**** CAMBIAR CONTENIDO DE LOS ELEMENTOS ****/
  //element = elemento seleccionado
  element.innerHTML + ' tenemos agua'; //Añade el texto tras el + 
  element.src = 'fondo.png'; //Modifica un atributo
  element.setAttribute(placeholder, "Ingrese sus datos: "); //Añade un atributo y su valor
  element.style.color = green; // Cambia el style (css)
