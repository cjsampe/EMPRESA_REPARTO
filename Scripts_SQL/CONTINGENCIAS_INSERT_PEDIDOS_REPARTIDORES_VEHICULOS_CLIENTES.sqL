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
DBMS_OUTPUT.PUT_LINE('Se han eliminado 22 PEDIDOS.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

DELETE FROM REPARTIDORES WHERE DNI = ('29001800P');
DELETE FROM REPARTIDORES WHERE DNI = ('29019000P');
DELETE FROM REPARTIDORES WHERE DNI = ('29000200P');
DELETE FROM REPARTIDORES WHERE DNI = ('29002100P');
DELETE FROM REPARTIDORES WHERE DNI = ('29022000P');
DELETE FROM REPARTIDORES WHERE DNI = ('29002500P');
DELETE FROM REPARTIDORES WHERE DNI = ('29320000P');
DELETE FROM REPARTIDORES WHERE DNI = ('29000840P');
DELETE FROM REPARTIDORES WHERE DNI = ('29073000P');
DELETE FROM REPARTIDORES WHERE DNI = ('29002600P');
DELETE FROM REPARTIDORES WHERE DNI = ('29008400P');
DELETE FROM REPARTIDORES WHERE DNI = ('29009500P');
DELETE FROM REPARTIDORES WHERE DNI = ('29007800P');
DELETE FROM REPARTIDORES WHERE DNI = ('29063000P');

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han eliminado 14 REPARTIDORES.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

DELETE FROM VEHICULOS WHERE MATRICULA = ('4562ARF');
DELETE FROM VEHICULOS WHERE MATRICULA = ('4897BGT');
DELETE FROM VEHICULOS WHERE MATRICULA = ('7895CFT');
DELETE FROM VEHICULOS WHERE MATRICULA = ('6205GHT');
DELETE FROM VEHICULOS WHERE MATRICULA = ('9001AAA');
DELETE FROM VEHICULOS WHERE MATRICULA = ('6524DFG');
DELETE FROM VEHICULOS WHERE MATRICULA = ('8452RTY');
DELETE FROM VEHICULOS WHERE MATRICULA = ('7825DRV');
DELETE FROM VEHICULOS WHERE MATRICULA = ('3259CVA');
DELETE FROM VEHICULOS WHERE MATRICULA = ('7841LKU');
DELETE FROM VEHICULOS WHERE MATRICULA = ('6521EFT');
DELETE FROM VEHICULOS WHERE MATRICULA = ('9963DDD');
DELETE FROM VEHICULOS WHERE MATRICULA = ('6321FGB');
DELETE FROM VEHICULOS WHERE MATRICULA = ('4562EDC');
DELETE FROM VEHICULOS WHERE MATRICULA = ('1235NHJ');
DELETE FROM VEHICULOS WHERE MATRICULA = ('1458TFV');

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han eliminado 16 VEHCULOS.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

DELETE FROM CLIENTES WHERE DNI = ('29000000P');
DELETE FROM CLIENTES WHERE DNI = ('29000010P');
DELETE FROM CLIENTES WHERE DNI = ('29000020P');
DELETE FROM CLIENTES WHERE DNI = ('29000030P');
DELETE FROM CLIENTES WHERE DNI = ('29000040P');
DELETE FROM CLIENTES WHERE DNI = ('29000050P');
DELETE FROM CLIENTES WHERE DNI = ('29000600P');
DELETE FROM CLIENTES WHERE DNI = ('29000070P');
DELETE FROM CLIENTES WHERE DNI = ('29000800P');
DELETE FROM CLIENTES WHERE DNI = ('29001000P');
DELETE FROM CLIENTES WHERE DNI = ('29000900P');
DELETE FROM CLIENTES WHERE DNI = ('29001100P');
DELETE FROM CLIENTES WHERE DNI = ('29001200P');
DELETE FROM CLIENTES WHERE DNI = ('29001300P');
DELETE FROM CLIENTES WHERE DNI = ('29014000P');
DELETE FROM CLIENTES WHERE DNI = ('29015000P');
DELETE FROM CLIENTES WHERE DNI = ('29001600P');


COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han eliminado 17 CLIENTES.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;