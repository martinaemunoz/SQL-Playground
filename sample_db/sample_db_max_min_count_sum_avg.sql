-- Ejercicios Función MAX() 
-- Encuentra el salario máximo de todos los empleados.

SELECT nombre, salario AS "Salario más alto"
FROM empleados
WHERE salario = (SELECT MAX(salario) FROM empleados);

-- Encuentra la cantidad máxima de productos vendidos en una sola venta.

SELECT id, cantidad AS "Cantidad máxima de productos vendidos en una venta"
FROM ventas
WHERE cantidad = (SELECT MAX(cantidad) FROM ventas);

-- Encuentra la edad máxima de los empleados.

SELECT nombre, edad AS "Edad máxima"
FROM empleados
WHERE edad = (SELECT MAX(edad) FROM empleados);

-- Ejercicios Función MIN()
-- Encuentra el salario mínimo de todos los empleados.

SELECT nombre, salario AS "Salario más bajo"
FROM empleados
WHERE salario = (SELECT MIN(salario) FROM empleados);

-- Encuentra la cantidad mínima de productos vendidos en una sola venta.

SELECT id, cantidad AS "Cantidad mínima de productos vendidos en una venta"
FROM ventas
WHERE cantidad = (SELECT MIN(cantidad) FROM ventas);

-- Encuentra la edad mínima de los empleados.

SELECT nombre, edad AS "Edad mínima"
FROM empleados
WHERE edad = (SELECT MIN(edad) FROM empleados);

-- Ejercicios de la Función COUNT()
-- Cuenta cuántos empleados hay en total.

SELECT COUNT(DISTINCT id) AS "Número total de empleados"
FROM empleados;

-- Cuenta cuántas ventas se han realizado.

SELECT COUNT(DISTINCT id) AS "Número total de ventas"
FROM ventas;

-- Cuenta cuántos productos tienen un precio superior a $500.

SELECT COUNT(*) AS "Productos con precio superior a $500"
FROM productos
WHERE precio > 500;

-- Ejercicios de la Función SUM()
-- Calcula la suma total de salarios de todos los empleados.

SELECT SUM(salario) AS 'Suma total de salarios'
FROM empleados;

-- Calcula la suma total de montos vendidos en todas las ventas.

SELECT SUM(monto_total) AS 'Suma total de montos vendidos'
FROM ventas;

-- Calcula la suma de precios de productos con ID par.

SELECT SUM(precio) AS 'Suma de precios con productos con ID par'
FROM productos
-- WHERE id IN(2, 4, 6);
WHERE MOD(id, 2) = 0;

-- Ejercicios Función AVG()
-- Calcula el salario promedio de todos los empleados.

SELECT AVG(salario) AS 'Salario promedio empleados'
FROM empleados;

-- Calcula el precio unitario promedio de todos los productos.

SELECT AVG(precio) AS 'Precio unitario promedio'
FROM productos;

-- Calcula la edad promedio de los empleados.

SELECT AVG(edad) AS 'Edad promedio empleados'
FROM empleados;