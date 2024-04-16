Las bases de datos NoSQL son aquellas que no siguen el modelo clásico del sistema de gestión de datos relacionales. No usan el SQL como lenguaje principal de consultas, y además, en el almacenamiento de los datos no se utilizan estructuras fijas de almacenamiento.

Con la llegada de la web 2.0 (Facebook, Twitter, Youtube), cualquier usuario podía subir contenido, provocando así un crecimiento exponencial de los datos. surgen así problemas para gestionar y acceder a toda esa información almacenada en BBDD relacionales.

Surgen de este modo las BBDD NoSQL que intentan resolver problemas de almacenamiento masivo, alto desempeño, procesamiento masivo de transacciones (sitios con alto tránsito) y, en términos generales, ser alternativas NoSQL a problemas de persistencia y almacenamiento masivo (voluminoso) de información para las organizaciones.

**VENTAJAS**
● Se ejecutan en máquinas con pocos recursos.
● Escalabilidad horizontal.
● Pueden manejar gran cantidad de datos.
● No genera cuellos de botella.

**DIFERENCIAS**
● Rendimiento
● Fiabilidad
● Disponibilidad
● Consistencia
● Almacenamiento
● Escalabilidad

**TIPOS**
● *Clave-valor (CASSANDRA)*
Son el modelo de base de datos NoSQL más popular, además de ser la más sencilla en cuanto a funcionalidad.
En este tipo de sistema, cada elemento está identificado por una llave única, lo que permite la recuperación de la información de forma muy
rápida, información que habitualmente está almacenada como un objeto binario (BLOB).
Se caracterizan por ser muy eficientes tanto para las lecturas como para las escrituras.
● *Documentales (MongoDB)*
Este tipo almacena la información como un documento, generalmente utilizando para ello una estructura simple como JSON o XML y donde se
utiliza una clave única para cada registro.
Este tipo de implementación permite, además de realizar búsquedas por clave–valor, realizar consultas más avanzadas sobre el contenido del documento.
Son las bases de datos NoSQL más versátiles. Se pueden utilizar en gran cantidad de proyectos, incluyendo muchos que tradicionalmente funcionarían sobre bases de datos relacionales.

● *Grafo*
En este tipo de bases de datos, la información se representa como nodos de un grafo y sus relaciones con las aristas del mismo, de manera que se puede hacer uso de la teoría de grafos para recorrerla.
Para sacar el máximo rendimiento a este tipo de bases de datos, su estructura debe estar totalmente normalizada, de forma que cada tabla tenga una sola columna y cada relación dos.
Este tipo de bases de datos ofrece una navegación más eficiente entre relaciones que en un modelo relacional.

● *Columnas anchas*
A diferencia de las bases de datos relacionales, las bases de datos en
columnas almacenan sus datos por columnas, en lugar de por filas. Estas
columnas se agrupan para formar subgrupos.

**BASE**
Basically-Available: En lugar de imponer la consistencia inmediata, las bases de datos NoSQL garantizarán la disponibilidad de los datos distribuyéndolos y replicándolos entre los nodos del clúster de bases de datos.
