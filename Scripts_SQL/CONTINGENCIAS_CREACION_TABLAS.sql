--SCRIPT DE CONTINGENCIA POR SI LA CREACI�N DE TABLAS FALLA

DROP TABLE PEDIDOS;
DROP TABLE REPARTIDORES;
DROP TABLE VEHICULOS;
DROP TABLE CLIENTES;

DROP SEQUENCE vehiculo_id_seq;
DROP SEQUENCE repartidor_id_seq;
DROP SEQUENCE cliente_id_seq;
DROP SEQUENCE pedido_id_seq;

