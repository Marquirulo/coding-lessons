/*EJ1*/
SELECT ciudad, codigo_postal
    FROM oficina
WHERE UPPER(pais) = 'ESPAÑA';

/*EJ2*/
SELECT nombre, apellido1, apellido2
    FROM empleado
WHERE codigo_jefe IS NULL;

/*EJ3*/
SELECT nombre, puesto
    FROM empleado
WHERE UPPER(puesto) <> 'DIRECTOR OFICINA';

/*EJ4*/
SELECT *
    FROM pedido
WHERE UPPER(estado) = 'PENDIENTE';

/*EJ5*/
SELECT nombre||' '||apellido1||' '||apellido2 Nombre_Apellido
    FROM empleado
WHERE UPPER(codigo_oficina) = 'BCN-ES';

/*EJ6*/
SELECT c.nombre_cliente, e.nombre Rep_ventas
    FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado;

/*EJ7*/
SELECT DISTINCT c.nombre_cliente
    FROM cliente c, pedido p
WHERE p.codigo_cliente = c.codigo_cliente
    AND UPPER(ciudad) = 'MIAMI';
    
/*EJ8*/
SELECT c.nombre_cliente, p.fecha_pago
    FROM cliente c, pago p
WHERE p.codigo_cliente = c.codigo_cliente
    AND EXTRACT(year FROM p.fecha_pago) = '2007';

/*EJ9*/
SELECT DISTINCT c.nombre_cliente, p.codigo_pedido, p.fecha_entrega, p.fecha_esperada
    FROM cliente c, pedido p
WHERE p.codigo_cliente = c.codigo_cliente
    AND p.fecha_entrega > p.fecha_esperada ;
    
/*EJ10*/
SELECT *
    FROM empleado
WHERE codigo_jefe = (SELECT codigo_jefe
                        FROM empleado
                     WHERE codigo_empleado = 8);
/*EJ11*/
SELECT *
    FROM producto
WHERE proveedor = (SELECT proveedor
                        FROM producto
                    WHERE UPPER(codigo_producto) = 'FR-11');
                    
/*EJ12*/
SELECT *
    FROM empleado
WHERE codigo_oficina = (SELECT codigo_oficina
                            FROM empleado
                        WHERE codigo_empleado = 27);

/*EJ13*/
SELECT *
    FROM cliente
WHERE codigo_empleado_rep_ventas = (SELECT codigo_empleado_rep_ventas
                                        FROM cliente
                                    WHERE codigo_cliente = 11);
                                    
/*EJ14*/
SELECT *
    FROM producto
WHERE precio_venta < (SELECT precio_venta
                        FROM producto
                      WHERE codigo_producto = 'OR-134');
                      
/*EJ15*/
SELECT p.codigo_pedido
    FROM pedido p, detalle_pedido d, producto pr
WHERE d.codigo_pedido = p.codigo_pedido
    AND d.codigo_producto = pr.codigo_producto
    AND pr.precio_venta = (SELECT MAX(precio_venta)
                                FROM producto
                            WHERE UPPER(gama) = 'FRUTALES');
                            
/*EJ16*/
SELECT p.codigo_pedido
    FROM pedido p, detalle_pedido d, producto pr
WHERE d.codigo_pedido = p.codigo_pedido
    AND d.codigo_producto = pr.codigo_producto
    AND pr.precio_venta = (SELECT MAX(precio_venta)
                                FROM producto);
                                
/*EJ17*/
SELECT pr.nombre
    FROM pedido p, detalle_pedido d, producto pr
WHERE d.codigo_pedido = p.codigo_pedido
    AND d.codigo_producto = pr.codigo_producto
    AND d.cantidad = (SELECT cantidad
                            FROM detalle_pedido
                      WHERE UPPER(codigo_producto) = 'FR-13');
                      
/*EJ18*/
SELECT pr.nombre
    FROM detalle_pedido d, producto pr
WHERE d.codigo_producto = pr.codigo_producto
    AND pr.cantidad_en_stock = (SELECT cantidad_en_stock
                                    FROM producto
                                WHERE UPPER(codigo_producto) = 'OR-134');
                    
/*EJ19*/
SELECT *
    FROM empleado
WHERE codigo_oficina <> (SELECT codigo_oficina
                            FROM empleado
                        WHERE codigo_empleado = 17);
                        
/*EJ20*/
SELECT DISTINCT c.nombre_cliente
    FROM cliente c, pedido p
WHERE c.codigo_cliente = p.codigo_cliente
    AND (SELECT COUNT(pe.codigo_pedido)
            FROM pedido pe
        WHERE p.codigo_cliente = pe.codigo_cliente) > (SELECT COUNT(codigo_pedido)
                                                            FROM pedido
                                                            WHERE codigo_cliente = 35);

/*EJ21*/
SELECT p.codigo_pedido
    FROM pedido p, producto pr, detalle_pedido d
WHERE d.codigo_pedido = p.codigo_pedido
    AND d.codigo_producto = pr.codigo_producto
    AND pr.gama= (SELECT gama
                      FROM producto
                  WHERE codigo_producto = '11679');
                  
/*EJ22*/                                                            
SELECT DISTINCT e.nombre
    FROM empleado e, cliente c
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
    AND (SELECT COUNT(cli.codigo_empleado_rep_ventas)
            FROM cliente cli
        WHERE c.codigo_empleado_rep_ventas = cli.codigo_empleado_rep_ventas) > (SELECT COUNT(codigo_empleado_rep_ventas)
                                                                                    FROM cliente
                                                                                WHERE codigo_empleado_rep_ventas = 22);
                                                                                
/*EJ23*/
SELECT nombre
    FROM producto
WHERE precio_venta > (SELECT precio_venta
                         FROM producto
                      WHERE codigo_producto = 'OR-134');
              
/*EJ24*/
SELECT DISTINCT codigo_pedido
    FROM detalle_pedido d
WHERE (SELECT COUNT(de.codigo_pedido)
            FROM detalle_pedido de
        WHERE d.codigo_pedido = de.codigo_pedido) > (SELECT COUNT(codigo_pedido)
                                                            FROM detalle_pedido
                                                            WHERE codigo_pedido = 1);
