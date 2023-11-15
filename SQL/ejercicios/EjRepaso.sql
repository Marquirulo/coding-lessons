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
