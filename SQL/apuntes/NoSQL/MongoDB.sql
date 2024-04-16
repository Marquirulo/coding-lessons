/*
----- ARQUITECTURA --> BBDD{ COLECCION{ DOCUMENTOS{ _ID } } } -----
«_id» es un campo obligatorio para cada documento. Representa un valor único y puede considerarse como la clave principal del documento para identificarlo dentro de la colección.

Un documento es el equivalente a un registro en una base de datos tradicional. Se compone de campos de nombre y valor. Cada campo es una asociación entre un nombre y un valor y es similar a una columna en una base de datos relacional.

Una colección es un grupo de documentos de MongoDB, y se corresponde con una tabla creada con cualquier otro RDBMS como Oracle en una base de datos relacional. No tiene una estructura predefinida.

Una base de datos es un contenedor de colecciones, al igual que un RDBMS es un contenedor de tablas para las bases de datos relacionales. Cada uno tiene su propio conjunto de archivos en el sistema de archivos. Un servidor MongoDB puede almacenar múltiples bases de datos.
*/
/*** OPERACIONES BASICAS ***/
db -> Muestra la BBDD actual
show databases -> Muestra las BBDD
use nombre_BBDD -> Cambia de BBDD activa
db.nombre_coleccion.find() -> Consultar los datos de una colección 
  
Insertar documentos en una coleccion (registros en tablas):
-- Inserta un único registro
  db.personas.insertOne({"Tipo":"Profesor", 
                         "Nombre":"Ana",
                         "Apellidos":"Palma",
                         "Asignaturas":["Matemáticas","Física","Química"]})
-- Inserta varios registros
  db.personas.insertMany([{Tipo: "Alumno", Nombre: "Felipe", Apellidos: "Martín", Calificaciones: {"Matemáticas": 8, "Física": 5.5}},
                          {Tipo: "Profesor", Nombre: "Irene", Apellidos: "Pérez", Asignaturas: ["Inglés","Física","Dibujo"]}])

Importación de ficheros (Desde CMD): Requiere de la utilidad --> mongodb-org-tools
mongoimport ruta_archivo.json -d database -c coleccion --jsonArray
/* Si el .json no es un array de documentos, sino documentos uno tras otro, no hay que utilizar la opción –jsonArray */
