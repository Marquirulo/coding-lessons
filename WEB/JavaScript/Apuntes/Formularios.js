//Hay tres maneras de acceder a los elementos de un formulario
    document.getElementById('nombre'); //Usando los metodos propios del DOM
    document.froms[0].elements[0]; //Usando los Arrays de formulario
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
