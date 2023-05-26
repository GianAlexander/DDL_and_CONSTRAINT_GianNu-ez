--CREATE TABLE 
CREATE TABLE empleado (
  id NUMBER,
  nombre VARCHAR2(50),
  apellido VARCHAR2(50),
  fecha_nacimiento DATE,
  direccion VARCHAR2(100),
  salario NUMBER(10, 2)
);
CREATE TABLE cliente (
  id NUMBER,
  nombre VARCHAR2(50),
  apellido VARCHAR2(50),
  direccion VARCHAR2(100),
  telefono VARCHAR2(20),
  correo VARCHAR2(100)
);
CREATE TABLE venta (
  id NUMBER,
  fecha_venta DATE,
  total NUMBER(10, 2),
  cliente_id NUMBER,
  empleado_id NUMBER
);
CREATE TABLE venta_detalle (
  id NUMBER,
  venta_id NUMBER,
  producto_id NUMBER,
  cantidad NUMBER,
  precio_unitario NUMBER(10, 2)
);

--ALTER TABLE

-- Agregar clave foránea en la tabla venta_detalle
ALTER TABLE venta_detalle
ADD CONSTRAINT fk_venta_detalle_venta
FOREIGN KEY (venta_id)
REFERENCES venta(id);


--DROP TABLE

DROP TABLE EMPLEADO;

--CREATE INDEX

CREATE INDEX idx_cliente_nombre ON cliente(nombre);

--CREATE VIEW

CREATE VIEW vista_cliente AS
SELECT id, nombre, apellido, direccion, telefono, correo, fecha_registro
FROM cliente;

--CREATE TRIGGER

CREATE OR REPLACE TRIGGER cliente_trigger
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  -- Acción a realizar antes de la inserción
  :NEW.fecha_registro := SYSDATE; -- Establece la fecha de registro como la fecha actual
END;

--CREATE PROCEDURE 

CREATE OR REPLACE PROCEDURE insertar_cliente (
  p_id NUMBER,
  p_nombre VARCHAR2,
  p_apellido VARCHAR2,
  p_direccion VARCHAR2,
  p_telefono VARCHAR2,
  p_correo VARCHAR2,
  p_fecha_registro DATE
) AS
BEGIN
  INSERT INTO cliente (id, nombre, apellido, direccion, telefono, correo, fecha_registro)
  VALUES (p_id, p_nombre, p_apellido, p_direccion, p_telefono, p_correo, p_fecha_registro);
  
  COMMIT; -- Confirmar la inserción de datos
END;

--CREATE FUNCTION
CREATE OR REPLACE FUNCTION calcular_total (
  p_precio_unitario NUMBER,
  p_cantidad NUMBER
) RETURN NUMBER AS
  v_total NUMBER;
BEGIN
  v_total := p_precio_unitario * p_cantidad;
  RETURN v_total;
END;














--CREATE TABLE
CREATE TABLE ejemplo (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(50),
  edad NUMBER
);

--UNIQUE (ÚNICO)

ALTER TABLE EJEMPLO 
ADD CAMPO_UNICO NUMBER UNIQUE ;

--FOREIGN KEY
CREATE TABLE tabla_padre (
  id_padre NUMBER PRIMARY KEY,
  nombre_padre VARCHAR2(50)
);

CREATE TABLE tabla_hija (
  id_hija NUMBER PRIMARY KEY,
  nombre_hija VARCHAR2(50),
  id_padre NUMBER,
  CONSTRAINT fk_tabla_hija_tabla_padre FOREIGN KEY (id_padre)
    REFERENCES tabla_padre(id_padre)
);


--CHECK

ALTER TABLE EJEMPLO 
ADD ESTADO_CIVIL VARCHAR2(20) CHECK (estado_civil IN ('Soltero', 'Casado', 'Divorciado', 'Viudo')) ;












