--CCONTINGENCIAS INSERT PEDIDOS

SET SERVEROUTPUT ON;
BEGIN

DELETE FROM PEDIDOS WHERE CLIENTE_ID = (2);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (3);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (8);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (8);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (6);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (7);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (9);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (9);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (17);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (15);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (13);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (14);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (12);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (11);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (12);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (11);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (10);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (1);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (1);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (4);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (9);
DELETE FROM PEDIDOS WHERE CLIENTE_ID = (5);

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han eliminado 22 registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;