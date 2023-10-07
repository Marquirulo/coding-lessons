-- JUNTAR TABLAS MEDIANTE PK/FK --
SELECT *
FROM orders
JOIN subscriptions                  -- Indico la tabla que quiero unir a la seleccionada con FROM
  ON orders.subscription_id         --Selecciono por donde la voy a unir (Indico la FK unida a la PK)
  = subscriptions.subscription_id;