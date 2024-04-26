--1
db.biblio.find({"organization.services":{$regex:".*puestos de lectura.*"}})
--2
db.biblio.find({relation:{$regex:".*http.*"}})
db.biblio.find({relation:{$regex:".*ftp.*"}})
--3
db.biblio.find({$or:[{relation:{$regex:".*http.*"}},{relation:{$regex:".*ftp.*"}}]})
--4
db.biblio.find({title:{$regex:'.*bibliobús.*',$options:'i'}},{"address.postal-code":1,"address.locality":1,_id:0}).sort({"address.postal-code":-1})
--5
db.personas.insertMany([
{Tipo: "Profesor", Nombre: "Ana", Apellidos: "Palma", Asignaturas: ["Matemáticas","Física","Química"]},
{Tipo: "Alumno", Nombre: "Felipe", Apellidos: "Martín", Calificaciones: {"Matemáticas": 8, "Física": 5.5}},
{Tipo: "Profesor", Nombre: "Irene", Apellidos: "Pérez", Asignaturas: ["Inglés","Física","Dibujo"]},
{Tipo: "Alumno", Nombre: "Raquel", Apellidos: "López", Calificaciones: {"Matemáticas": 9, "Física": 7.5, "Inglés": 6}},
{Tipo: "Administrativo", Nombre: "Luis", Nominas:[{Mes: "Octubre", "Cantidad": 1850.90},{Mes: "Noviembre", "Cantidad":1600.50}]},
{Tipo: "Administrativo", Nombre: "Marisa", Nominas:[{Mes: "Octubre", "Cantidad": 1420.30},{Mes: "Noviembre","Cantidad": 1850.90}]}
])
--6
db.personas.find({"Calificaciones.Física":7.5})
--7
db.personas.find({$and:[{"Calificaciones.Física":7.5},{"Calificaciones.Inglés":6}]})
--8
db.personas.find({$or:[{"Calificaciones.Física":7.5},{"Calificaciones.Matemáticas":8}]})
--9
db.personas.find({Tipo:"Administrativo"})
--10
db.personas.find({$and:[{Tipo:"Alumno"},{"Calificaciones.Física":7.5},{"Calificaciones.Inglés":6}]})
--11
db.personas.find({$or:[{Nombre:{$regex:"F.*"}},{Tipo:"Aministrativo"}]})
--12
db.personas.find({$or:[{Nombre:{$regex:"F.*", $options:'i'}},{Tipo:"Aministrativo"}]})
--13
db.personas.find({"Nominas.Cantidad":{$eq:1600.5}})
--14
db.personas.find({"Nominas.Cantidad":{$lt:1500}})
--15
mongoimport C:\Users\usuario\Downloads\restaurants_practicas.json -d ocio -c restaurants
--16
db.restaurants.find({},{restaurant_id:1, name:1, borough:1, cuisine:1})
--17
db.restaurants.find({},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0})
--18
db.restaurants.find({borough:"Bronx"})
--19
db.restaurants.find({borough:"Bronx"}).limit(5)
--20
db.restaurants.find({borough:"Bronx"}).skip(5).limit(5)
--21
db.restaurants.find({$and:[{cuisine:{$ne:"American"}},{"grades.score":{$gt:70}}]})
--22
db.restaurants.find({$and:[{cuisine:{$ne:"American"}},{"grades.grade":"A"},{borough:{$ne:"Brooklyn"}}]})
--23
db.restaurants.find({name:{$regex:'^Will.*',$options:'i'}},{restaurant_id:1, name:1, borough:1, cuisine:1})
--24
db.restaurants.find({$and:[{borough:"Bronx"},{cuisine:{$nin:["American","Chinese"]}}]})
--25
db.restaurants.find({$or:[{name:{$regex:'^Will.*',$options:'i'}},{cuisine:{$nin:["American","Chinese"]}}]},{restaurant_id:1, name:1, borough:1, cuisine:1})
--26
db.restaurants.find({$and:[{"address.coord.1":{$gt:42}},{"address.coord.1":{$lte:52}}]},{restaurant_id:1, name:1, "address.coord":1})
--27
db.restaurants.find().sort({"name":1})






