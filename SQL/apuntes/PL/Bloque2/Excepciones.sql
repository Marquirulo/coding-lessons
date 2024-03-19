/**** EXCEPCIONES PROPIAS ****/
  -- Forma 1
   RAISE_APPLICATION_ERROR(-20010, 'El salario del empleado indicado es nulo'); -- Esto crea y leventa una excepcion asociada al ORA y lanza el mensaje indicados
  -- Forma 2
  DECLARE
    out_of_stock   EXCEPTION; -- Creas un nombre de excepcion
    number_on_hand NUMBER := 0;
  BEGIN
    IF number_on_hand < 1 THEN
      RAISE out_of_stock; -- Levantas la excepción que hemos creado
    END IF;
  EXCEPTION
    WHEN out_of_stock THEN
      DBMS_OUTPUT.PUT_LINE('Encountered out-of-stock error.'); -- Declaramos que pasa al levnatarse la excepcion
  END;
  /
