SET SERVEROUTPUT ON;
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
DBMS_OUTPUT.PUT_LINE('Se han eliminado 16 registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;