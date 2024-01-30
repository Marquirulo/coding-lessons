//Hay tres maneras de acceder a los elementos de un formulario
    document.getElementById('nombre'); //Usando los metodos propios del DOM
    document.forms[0].elements[0]; //Usando los Arrays de formulario
    document.formulario; //El DOM permite acceder mediante el atributo name del formulario de esta manera

//Para obtener el valor de los formularios usamos:
    //Texto y textarea
        let valor = document.getElementById("texto").value;

    //Radio y Checkbox
      //Aquí nos interesa conocer cual está seleccionado por lo cual usariamos el siguiente:
        let elementos = document.getElementsByName("pregunta");
        let seleccionado = [];
      //Esto craera un array con los valores seleccionados y para tratarlos despues
        for (let i = 0; i < elementos.length; i++) {
            if (elementos[i].checked) {
                seleccionado.push(elementos[i].value);
            }
        }

    //Select
       //selectedIndex reconoce cual opcion/es esta seleccionado
        var lista = document.getElementById("opciones");
       // Obtener el valor de la opción seleccionada
        var valorSeleccionado = lista.options[lista.selectedIndex].value;

//Dar el foco a un elemento
    document.getElementById("").focus();

//Evitar reenvio del formulario
    function enviar(this){
        this.disabled = true;
        this.value ='Enviando...'; 
        this.form.submit();
    }
//Podemos limitar el nº de caracteres en un elemento utilizando onkeypress
    function limita(maximoCaracteres) {
     var elemento = document.getElementById("texto");
     if(elemento.value.length >= maximoCaracteres ) {
         return false; // Al devolver false onkeypress no realizara su funcion normal (escribir un caracter)
     } else {
         return true;
     }
    }
/*<textarea id="texto" onkeypress="return limita(100);"></textarea>*/
//VALIDACIONES
    //isNaN()
        valor = document.getElementById("campo").value;
        if (isNaN(valor)) { //Comprueba si el dato es un nº valido ("3") tambien lo entiende como numero
            return false;
        }
    //select
        indice = document.getElementById("opciones").selectedIndex;
        if (indice == null || indice == 0) { //Comprueba que se haya seleccionado una opcion que no se la 1ª ya que la 1ª es "Seleccione una opcion"
            return false;
        }
    //A un nivel más avanzado se pueden usar RegExp
        regExp.test(valorAValidar)
      //Ej: Comprueba que el formato sea +00 000000000 o +000 000000000
        /^\+\d{2,3}\s\d{9}$/.test(valor) 
