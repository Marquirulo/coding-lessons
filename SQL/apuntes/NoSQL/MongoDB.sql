/*
----- ARQUITECTURA -> BBDD{ COLECCION{ DOCUMENTOS{ _ID } } } -----
«_id» es un campo obligatorio para cada documento. Representa un valor único y puede considerarse como la clave principal del documento para identificarlo dentro de la colección.

Un documento es el equivalente a un registro en una base de datos tradicional. Se compone de campos de nombre y valor. Cada campo es una asociación entre un nombre y un valor y es similar a una columna en una base de datos relacional.

Una colección es un grupo de documentos de MongoDB, y se corresponde con una tabla creada con cualquier otro RDBMS como Oracle en una base de datos relacional. No tiene una estructura predefinida.

Una base de datos es un contenedor de colecciones, al igual que un RDBMS es un contenedor de tablas para las bases de datos relacionales. Cada uno tiene su propio conjunto de archivos en el sistema de archivos. Un servidor MongoDB puede almacenar múltiples bases de datos.
*/

/*** OPERACIONES BASICAS ***/
db -> Muestra la BBDD actual
show databases -> Muestra las BBDD
show collections -> Muestra las colecciones
use nombre_BBDD -> Cambia de BBDD activa
db.nombre_coleccion.find() -> Consultar los datos de una colección 

  
/*** Insertar documentos en una coleccion (registros en tablas): ***/
-- Inserta un único registro
  db.personas.insertOne({"Tipo":"Profesor", 
                         "Nombre":"Ana",
                         "Apellidos":"Palma",
                         "Asignaturas":["Matemáticas","Física","Química"]})
-- Inserta varios registros
  db.personas.insertMany([{Tipo: "Alumno", Nombre: "Felipe", Apellidos: "Martín", Calificaciones: {"Matemáticas": 8, "Física": 5.5}},
                          {Tipo: "Profesor", Nombre: "Irene", Apellidos: "Pérez", Asignaturas: ["Inglés","Física","Dibujo"]}])

  
Importación de ficheros (Desde CMD): Requiere de la utilidad --> mongodb-org-tools (Añadirla al PATH)
mongoimport ruta_archivo.json -d database -c coleccion --jsonArray
/* Si el .json no es un array de documentos, sino documentos uno tras otro, no hay que utilizar la opción --jsonArray */

/*** Borrar ***/
  Eliminar la base de datos activa:
    db.dropDatabase()
  Eliminar una colección:
    db.<colección>.drop()

/*** Consultas y Proyecciones ***/
db.nombre_coleccion.find()
db.people.find().pretty() --> Devuelve formateado
db.nombre_coleccion.findOne() --> Devuelve el primero de las coincidencias
db.personas.find({Tipo: "Profesor", Nombre:"Ana"}) -> Aplica un filtro (consulta con WHERE)
db.personas.find({Tipo:"Alumno"},{Tipo:1, Nombre:1, _id:0}) --> Indica una proyeccion (Que campos se muestran y cuales no) (No se pueden combinar proy. de inclusion y exclusion salvo para quitar el _id)
  
/** BUSCAR ARRAYS **/
db.personas.find({"Calificaciones.Matemáticas":9}) --> DOT NOTATION: Permite buscar coincidencias parciales
db.personas.find({"Calificaciones":{"Matemáticas":9,"Física":7.5,"Inglés": 6}}) --> Busca coincidencia exacta
db.personas.find({"Nominas.0.Cantidad": 1850.90}) --> Permite buscar por el indice del documento (El primer objeto 0)

/*** OTRAS FUNCIONES ***/
db.personas.find().sort({Nombre:1}) --> Orden ascendente
db.personas.find().sort({Nombre:-1}) --> Orden descendente
db.personas.find().limit(num) --> Limita el número de resultados a mostrar
db.personas.find().skip(num) --> Salta un número de documentos en las consultas.
-- Recomendable: .find().skip(num).limit(num)
  
/*** OPERADORES ***/
$eq    IGUAL
$gt    MAYOR
$gte   MAYOR O IGUAL
$in    PERTENENCIA A UN CONJUNTO DE VALORES
$lt    MENOR
$lte   MENOR O IGUAL
$ne    NO IGUAL O DISTINTO
$nin   NO PERTENENCIA A UN CONJUNTO DE VALORES
$and   INDICA QUE SE CUMPLAN AMBAS CONDICIONES
$or    INDICA QUE SES CUMPLA UNA U OTRA CONDICIÓN (O AMBAS)
$not   INVIERTE LA CONDICION
$regex PERMITE INCLUIR EXPREASIONES REGULARES
  $options PERMITE AÑADIR OPCIONES AL $regex. 
    $options:'i' --> Ignora Mayus/Minus

/* EJEMPLOS */
  db.personas.find({Tipo:{$in: ["Profesor","Alumno"]}}
  db.personas.find({$and:[{Nombre:"Felipe"},{"Calificaciones.Matemáticas":{$not:{$lt:5}}}]})
  db.personas.find({Nombre: {$regex: '^J'}})
  db.personas.find({Nombre: {$regex: 'U', $options: 'i'}})
  
