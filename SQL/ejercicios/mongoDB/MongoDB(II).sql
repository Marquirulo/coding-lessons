/*Ej1*/
db.biblio.find({"organization.services":{$regex:".*puestos de lectura.*"}})
db.biblio.find({relation:{$regex:".*http.*"}})
db.biblio.find({relation:{$regex:".*ftp.*"}})
db.biblio.find({$or:[{relation:{$regex:".*http.*"}},{relation:{$regex:".*ftp.*"}}]})
