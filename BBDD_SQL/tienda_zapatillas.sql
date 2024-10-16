CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

CREATE TABLE zapatillas(
	id_zapatilla INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
    );

CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente)
    );
    
CREATE TABLE empleados(
	id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleado)
    );
    
CREATE TABLE facturas(
	id_factura INT NOT NULL AUTO_INCREMENT,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT fk_id_zapatilla
		FOREIGN KEY (id_zapatilla)
        REFERENCES zapatillas(id_zapatilla),
	CONSTRAINT fk_id_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente),
	CONSTRAINT fk_id_empleado
		FOREIGN KEY (id_empleado)
		REFERENCES empleados(id_empleado)
        );
    
USE ejercicios_2;
CREATE TABLE t1 (
	a INTEGER, 
	b CHAR(10)
	);

RENAME TABLE t1 TO t2;

ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

ALTER TABLE t2
CHANGE b c CHAR(20);

ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

ALTER TABLE t2
DROP COLUMN c;

CREATE TABLE t3 LIKE t2;

DROP TABLE t2;

RENAME TABLE t3 TO t1;

USE tienda;
CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

