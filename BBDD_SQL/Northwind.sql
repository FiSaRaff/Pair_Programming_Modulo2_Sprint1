CREATE SCHEMA northwind;
USE northwind;
/* El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras.
 Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados 
 de la empresa Northwind. Esta consulta incluirá los campos id, last_name y first_name.*/
 
SELECT employee_id, last_name, first_name
	FROM employees;
/* Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad 
oscilen entre 0 y 5 dólares, es decir, los productos más asequibles.*/
SELECT product_name, unit_price
	FROM products
    WHERE unit_price < 5;
/*Para comprobar si los datos en la tabla products están correctos, 
nos interesa seleccionar aquellos productos que no tengan precio, 
porque lo hayan dejado vacio al introducir los datos (NULL). */
SELECT product_name, unit_price
	FROM products
    WHERE unit_price = NULL; -- no nos muestra nada porque no hay ningún producto que tenga el precio NULL
/* Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, 
pero sólo aquellos que tienen un ID menor que 20 (para tener una muestra significativa pero 
no tener que ver todos los productos existentes).*/
SELECT product_id, product_name, unit_price
	FROM products
    WHERE unit_price < 15 
		AND product_id < 20; 
/*Ahora vamos a hacer la misma consulta que en ejercicio anterior, 
pero haciendo invirtiendo el uso de los operadores y queremos saber aquellos que tengan un precio 
superior a 15 dólares y un ID superior a 20. */
SELECT product_id, product_name, unit_price
	FROM products
    WHERE unit_price > 15 
		AND product_id > 20; 
/* A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio 
en esas regiones y al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. 
Realiza una consulta para obtener ese dato*/
SELECT DISTINCT ship_country
	FROM orders;
/* Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios*/
SELECT product_id, product_name, unit_price
	FROM products
		LIMIT 10;
-- Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente
SELECT product_id, product_name, unit_price
	FROM products
		ORDER BY product_id DESC
			LIMIT 10;
-- Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).
SELECT DISTINCT order_id
	FROM order_details;
/* Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, 
desde la dirección nos piden conocer los 3 pedidos que han supuesto un mayor ingreso para la empresa. 
Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price y quantity para calcular el importe total.*/
ALTER TABLE order_details
	ADD COLUMN total_price FLOAT;
UPDATE order_details
	SET total_price = unit_price * quantity;
SELECT total_price AS ImporteTotal
	FROM order_details;
		