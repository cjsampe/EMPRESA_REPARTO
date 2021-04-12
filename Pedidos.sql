
-- TABLAS

CREATE TABLE vehiculos (
vehiculo_id NUMBER(2) NOT NULL CONSTRAINT PK_vehiculo_id PRIMARY KEY,
tipo VARCHAR2(20),
marca VARCHAR2(20),
modelo VARCHAR2(20),
matricula VARCHAR2(7)
);

CREATE TABLE repartidores (
repartidor_id NUMBER(2)NOT NULL CONSTRAINT PK_repartidor_id PRIMARY KEY,
nombre VARCHAR2(30),
dni VARCHAR2(9),
telefono VARCHAR2(9),
salario NUMBER(6,2)
);

CREATE TABLE clientes (
cliente_id NUMBER(4)NOT NULL CONSTRAINT PK_cliente_id PRIMARY KEY,
nombre VARCHAR2(30),
dni VARCHAR2(9),
telefono VARCHAR2(9),
email VARCHAR2(50)
);

CREATE TABLE pedidos (
pedido_id NUMBER(6)NOT NULL CONSTRAINT PK_pedido_id PRIMARY KEY,
vehiculo_id NUMBER(2),
repartidor_id NUMBER(2),
cliente_id NUMBER(4),
fecha_envio DATE,
direccion VARCHAR2(100),
peso NUMBER(4,2),
precio NUMBER(4,2),
fragil NUMBER(1),
urgente NUMBER(1),
CONSTRAINT FK_vehiculo_id FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(vehiculo_id),
CONSTRAINT FK_repartidor_id FOREIGN KEY (repartidor_id) REFERENCES repartidores(repartidor_id),
CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);


-- SECUENCIAS

CREATE SEQUENCE vehiculo_id_seq
START WITH 1
INCREMENT BY 1
CACHE 10;

CREATE SEQUENCE repartidor_id_seq
START WITH 1
INCREMENT BY 1
CACHE 10;

CREATE SEQUENCE cliente_id_seq
START WITH 1
INCREMENT BY 1
CACHE 10;

CREATE SEQUENCE pedido_id_seq
START WITH 1
INCREMENT BY 1
CACHE 10;


-- DISPARADORES

CREATE OR REPLACE TRIGGER vehiculo_id_trigger
BEFORE INSERT
ON vehiculos
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
  if(:new.vehiculo_id is null) then
  SELECT vehiculo_id_seq.nextval
  INTO :new.vehiculo_id
  FROM dual;
  end if;
END;

ALTER TRIGGER "vehiculo_id_trigger" ENABLE;


CREATE OR REPLACE TRIGGER repartidor_id_trigger
BEFORE INSERT
ON repartidores
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
  if(:new.repartidor_id is null) then
  SELECT repartidor_id_seq.nextval
  INTO :new.repartidor_id
  FROM dual;
  end if;
END;

ALTER TRIGGER "repartidor_id_trigger" ENABLE;


CREATE OR REPLACE TRIGGER cliente_id_trigger
BEFORE INSERT
ON clientes
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
  if(:new.cliente_id is null) then
  SELECT cliente_id_seq.nextval
  INTO :new.cliente_id
  FROM dual;
  end if;
END;

ALTER TRIGGER "cliente_id_trigger" ENABLE;


CREATE OR REPLACE TRIGGER pedido_id_trigger
BEFORE INSERT
ON pedidos
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
  if(:new.pedido_id is null) then
  SELECT pedido_id_seq.nextval
  INTO :new.pedido_id
  FROM dual;
  end if;
END;

ALTER TRIGGER "pedido_id_trigger" ENABLE;
