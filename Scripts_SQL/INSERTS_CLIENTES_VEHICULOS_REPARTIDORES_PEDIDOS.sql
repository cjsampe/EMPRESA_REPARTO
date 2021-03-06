SET SERVEROUTPUT ON;
BEGIN

INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Aar?n Gonz?lez', '29000000P', '976600300', 'aaron@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Laura Rodr?guez', '29000010P', '976600320', 'laura@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Abelarda Fern?ndez', '29000020P', '976600340', 'abe@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Abraham L?pez', '29000030P', '976600360', 'abraham@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Carlota Mart?nez', '29000040P', '976600380', 'carlota@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Adam S?nchez', '29000050P', '976600400', 'adam@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Ad?n P?rez', '29000600P', '976600420', 'aarda@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Adriana Gom?z', '29000070P', '976600440', 'adri@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Adolfo Martin', '29000800P', '976600460', 'adolf@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Adri? Jim?nez', '29001000P', '976600480', 'aadr@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Vanesa Ruiz', '29000900P', '976600500', 'vane@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Agust?n Hern?ndez', '29001100P', '976600520', 'agustin@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Aimar Diaz', '29001200P', '976600540', 'aimar@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Bego?a Moreno', '29001300P', '976600560', 'bego?a@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Alano Mu?oz', '29014000P', '976600580', 'alano@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Constantino ?lvarez', '29015000P', '976600600', 'const@cliente.com');
INSERT INTO CLIENTES (NOMBRE, DNI, TELEFONO, EMAIL) VALUES ('Pilar Romero', '29001600P', '976600620', 'pilar@cliente.com');

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han insertado 17 nuevos registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Citro?n', 'Berlingo', '4562ARF');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Dacia', 'Dokker Van', '4897BGT');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Fiat', 'Doblo Cargo', '7895CFT');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Citro?n', 'Berlingo', '6205GHT');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Fiat', 'Doblo Cargo', '9001AAA');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Dacia', 'Dokker Van', '6524DFG');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Ford', 'Transit Connect', '8452RTY');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Fiat', 'Doblo Cargo', '7825DRV');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Opel', 'Combo Cargo', '3259CVA');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Ford', 'Transit Connect', '7841LKU');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('CAMION', 'Man', 'L-2000', '6521EFT');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Ford', 'Transit Connect', '9963DDD');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('CAMION', 'Renault', 'Mascot', '6321FGB');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Dacia', 'Dokker Van', '4562EDC');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('CAMION', 'Man', 'L-2000', '1235NHJ');
INSERT INTO VEHICULOS (TIPO, MARCA, MODELO, MATRICULA) VALUES ('FURGONETA', 'Dacia', 'Dokker Van', '1458TFV');

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han insertado 16 nuevos registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Daniel Guti?rrez', '29001800P', '976560800', 18000);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Dar?o Navarro', '29019000P', '976560820', 17526);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('David Torres', '29000200P', '976560840', 17052);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Monica Dom?nguez', '29002100P', '976560860', 16578);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Diego V?zquez', '29022000P', '976560880', 16104);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Mar?a Ramos', '29002500P', '976560900', 15630);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Juana Gil', '29320000P', '976560920', 15156);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Guillermo Ram?rez', '29000840P', '976560940', 14682);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Edgar Serrano', '29073000P', '976560960', 14208);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Raquel Jos? Blanco', '29002600P', '976560980', 13734);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Eduardo Molina', '29008400P', '976561000', 13260);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Julio Morales', '29009500P', '976561020', 12786);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('M?nica Suarez', '29007800P', '976561040', 12312);
INSERT INTO REPARTIDORES (NOMBRE, DNI, TELEFONO, SALARIO) VALUES ('Justo Ortega', '29063000P', '976561060', 11838);

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han insertado 14 nuevos registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;

BEGIN

INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (3, 7, 2, '11/04/2021', 'Avenida de Monta?ana 114, Zaragoza', 0.3, 6.5, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (3, 7, 3, '13/04/2021', 'Avenida de Monta?ana 12, Zaragoza', 0.3, 12.5, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (5, 9, 8, '16/04/2021', 'Calle El Coso, 56, Zaragoza', 0.6, 5.6, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (5, 9, 8, '12/04/2021', 'Calle El Coso, 68, Zaragoza', 0.6, 3.5, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (3, 7, 6, '12/04/2021', 'Calle Emilia Pardo Baz?n 14, Zaragoza', 1, 3.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (3, 7, 7, '13/04/2021', 'Calle Emilia Pardo Baz?n 2, Zaragoza', 1, 12.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (5, 9, 9, '13/04/2021', 'Calle Escritor M?jica La?nez 29, Zaragoza', 2, 12, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (5, 9, 9, '12/04/2021', 'Calle Escritor M?jica La?nez 48, Zaragoza', 2, 6.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (6, 8, 17, '11/04/2021', 'Calle Isla La Graciosa 15, Zaragoza', 0.8, 5.6, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (6, 8, 15, '09/04/2021', 'Calle Isla La Graciosa 6, Zaragoza', 0.8, 3.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (6, 8, 13, '15/04/2021', 'Calle La Prima Ang?lica 2, Zaragoza', 0.56, 12.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (6, 8, 14, '12/04/2021', 'Calle La Prima Ang?lica 26, Zaragoza', 0.56, 6.5, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (7, 1, 12, '09/04/2021', 'Calle Padre El?as Limonar 17, Zaragoza', 0.35, 3.5, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (7, 1, 11, '15/04/2021', 'Calle Padre El?as Limonar 8B, Zaragoza', 0.35, 12.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (9, 2, 12, '11/04/2021', 'Calle Pedro Porter 24, Zaragoza', 0.5, 5.6, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (9, 2, 11, '13/04/2021', 'Calle Pedro Porter 56, Zaragoza', 0.5, 14, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (9, 3, 10, '12/04/2021', 'Calle Santuario de Rodanas 3, Zaragoza', 5, 12, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (9, 3, 1, '11/04/2021', 'Calle Santuario de Rodanas 5, Zaragoza', 5, 6.5, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (1, 6, 1, '13/04/2021', 'Calle Valdealgorfa 2, Zaragoza', 1.2, 14, 0, 0);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (1, 6, 4, '12/04/2021', 'Calle Valdealgorfa 63, Zaragoza', 1.2, 12, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (1, 6, 9, '13/04/2021', 'Paseo de la Ribera 46, Zaragoza', 4, 12, 1, 1);
INSERT INTO PEDIDOS (VEHICULO_ID, REPARTIDOR_ID, CLIENTE_ID, FECHA_ENVIO, DIRECCION, PESO, PRECIO, FRAGIL,URGENTE) VALUES (1, 6, 5, '11/04/2021', 'Paseo de la Ribera 55, Zaragoza', 4, 14, 1, 1);

COMMIT;
DBMS_OUTPUT.PUT_LINE('Se han insertado 22 nuevos registros.');

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR EN LA TRANSACCION: '|| SQLERRM);
DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
ROLLBACK;

END;
