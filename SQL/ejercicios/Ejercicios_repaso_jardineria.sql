/*Ej1*/
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, cantidad_en_stock, precio_venta, precio_proveedor)
    SELECT 'FR-200','Limonero','Frutales','14/16', MAX(cantidad_en_stock), ROUND(AVG(precio_venta),0), ROUND(AVG(precio_proveedor),0)
        FROM producto
    GROUP BY 'FR-200', 'Limonero', 'Frutales', '14/16', gama
    HAVING gama = 'Frutales';

/*Ej2*/
INSERT INTO cliente
    SELECT 39, 'AquaBakes', 'Marcos', 'Berrocal', 7894512368, 7894512369, 'C/Paris 35', 'Fuenlabrada', 'Madrid', 'Madrid', 'Spain', 28942, codigo_empleado_rep_ventas, 150000
        FROM cliente
    WHERE nombre_cliente = 'Agrojardin';
    
/*Ej3*/
INSERT INTO pedido VALUES
((SELECT MAX(codigo_pedido)+1 
    FROM pedido), SYSDATE,  SYSDATE+5, SYSDATE+5, 'En proceso', 'Un comentario random', (SELECT MAX(p.codigo_cliente)
                                                                                                                      FROM pedido p, cliente c
                                                                                                                   WHERE p.codigo_cliente = c.codigo_cliente
                                                                                                                      AND c.nombre_cliente = 'GoldFish Garden'));

/*Ej4*/
UPDATE cliente 
    SET limite_credito = (SELECT ROUND(AVG(limite_credito),0) 
                            FROM cliente)
WHERE nombre_cliente = 'GoldFish Garden';
    
/*Ej5*/
UPDATE pedido 
    SET estado = 'Finalizado'
WHERE codigo_cliente = (SELECT codigo_cliente 
                            FROM cliente 
                        WHERE nombre_cliente = 'GoldFish Garden')
    AND fecha_entrega > fecha_pedido;
    
/*Ej6*/
UPDATE producto 
    SET precio_venta = (precio_venta*1.1)
WHERE gama = 'Frutales'
    and cantidad_en_stock > (SELECT AVG(cantidad_en_stock)
                                FROM producto);
