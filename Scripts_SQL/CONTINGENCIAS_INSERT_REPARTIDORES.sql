SET SERVEROUTPUT ON;
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
DBMS_OUTPUT.PUT_LINE('Se han eliminado 14 registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;