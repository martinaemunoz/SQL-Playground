-- EJERCICIOS CON CLÁUSULA IN

-- Busca los empleados que trabajan en los departamentos 2 o 3.

SELECT * FROM empleados
WHERE departamento_id IN(2,3);

-- Trae a los clientes que no tengan los IDs 2, 4 o 6

SELECT * FROM empleados
WHERE id NOT IN(2,4,6);

-- Busca los productos cuyos precios son 350.00, 480.00 o 800.00.

SELECT * FROM productos
WHERE precio IN(350, 480, 800);


-- EJERCICIOS CON CLÁUSULA LIKE

-- Busca los empleados cuyos correos electrónicos terminan en "mail.com".

SELECT * FROM empleados
WHERE LOWER(correo_electronico) LIKE '%mail.com';

-- Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.

SELECT * FROM productos
WHERE LOWER(nombre) LIKE '______';

-- Busca los clientes cuyos nombres tengan una "a" en la tercera posición

SELECT * FROM clientes
WHERE LOWER(nombre) LIKE '__a%';


-- EJERCICIOS CON CLÁUSULA ORDER BY

-- Ordena los clientes por nombre de manera ascendente y luego por dirección de manera descendente.

SELECT * FROM clientes
ORDER BY nombre ASC;

SELECT * FROM clientes
ORDER BY direccion DESC;

-- Ordena los empleados por fecha_contratación de manera descendente.

SELECT * FROM empleados
ORDER BY fecha_contratacion DESC;

-- Ordena los productos por precio de manera ascendente.

SELECT * FROM productos
ORDER BY precio ASC;


-- EJERCICIOS CON FUNCIÓN MAX()

-- Encuentra el precio máximo de un producto.

SELECT nombre, precio AS 'Precio más alto'
FROM productos
WHERE precio = (SELECT MAX(precio) FROM productos);

-- Encuentra el monto total máximo de una venta.

SELECT id, monto_total AS 'Monto total más alto'
FROM ventas
WHERE monto_total = (SELECT MAX(monto_total) FROM ventas);

-- Encuentra el ID de cliente con el valor máximo.

SELECT nombre, id AS 'Cliente con ID más alto'
FROM clientes
WHERE id = (SELECT MAX(id) FROM clientes);


-- EJERCICIOS CON FUNCIÓN MIN()

-- Encuentra el precio mínimo de un producto.

SELECT nombre, precio AS 'Precio más bajo'
FROM productos
WHERE precio = (SELECT MIN(precio) FROM productos);

-- Encuentra el monto total mínimo de una venta.

SELECT id, monto_total AS 'Monto total mínimo'
FROM ventas
WHERE monto_total = (SELECT MIN(monto_total) FROM ventas);

-- Encuentra el ID de cliente con el valor mínimo.

SELECT nombre, id AS 'Cliente con menor ID'
FROM clientes
WHERE id = (SELECT MIN(id) FROM clientes); 


-- EJERCICIOS CON FUNCIÓN COUNT()

-- Cuenta cuántos clientes tienen la palabra "López" en su nombre.

SELECT COUNT(*) AS 'Clientes con la palabra López en su nombre'
FROM clientes
WHERE LOWER(nombre) LIKE '%lópez%';

-- Cuenta cuántas ventas fueron realizadas por el empleado con el id 9.

SELECT COUNT(*) AS 'Ventas realizadas por el empleado con id 9'
FROM ventas
WHERE empleado_id = 9;

-- Cuenta cuántos productos tienen un nombre que contiene la palabra "Digital".

SELECT COUNT(*) AS 'Productos que contienen la palabra Digital'
FROM productos
WHERE LOWER(nombre) LIKE '%digital%';


-- EJERCICIOS CON FUNCIÓN SUM()

-- Calcula la suma de cantidades de productos vendidos por empleado.

SELECT empleado_id, SUM(cantidad) AS 'Suma de cantidades de productos vendidos por empleado'
FROM ventas
GROUP BY empleado_id;

-- Calcula la suma de salarios de empleados en el Departamento 1.

SELECT 
    departamento_id AS 'Departamento',
    SUM(salario) AS 'Suma de salarios en el departamento 1'
FROM empleados
WHERE departamento_id = 1
GROUP BY departamento_id;

-- Calcula la suma de precios de productos vendidos al cliente con id 2.

SELECT 
    cliente_id AS 'ID Cliente',
    SUM(monto_total) AS 'Suma de precios de productos vendidos al cliente con id 2'
FROM ventas
WHERE cliente_id = 2
GROUP BY cliente_id;


-- EJERCICIOS CON FUNCIÓN AVG()

-- Calcula el precio promedio de productos con un precio superior a $200.

SELECT AVG(precio) AS 'Precio unitario promedio de productos con valor > $200'
FROM productos
WHERE precio > 200;

-- Calcula el salario promedio de los empleados en el Departamento 1.

SELECT AVG(salario) AS 'Salario promedio empleados Departamento 1'
FROM empleados
WHERE departamento_id = 1;

-- Calcula la cantidad promedio de productos vendidos por empleado.

SELECT empleado_id, AVG(cantidad) AS 'Cantidad promedio de productos vendidos por empleado'
FROM ventas
GROUP BY empleado_id;


-- EJERCICIOS CON FUNCIÓN  GROUP BY()

-- Agrupa las ventas por cliente y muestra el monto total gastado por cada cliente.

SELECT 
    cliente_id AS 'ID Cliente',
    SUM(monto_total) AS 'Monto total gastado por cliente'
FROM ventas
GROUP BY cliente_id;

-- Encuentra el salario máximo por departamento.

SELECT 
    departamento_id AS 'Departamento',
    MAX(salario) AS 'Salario máximo por Departamento'
FROM empleados
GROUP BY departamento_id;

-- Encuentra el salario mínimo por departamento.

SELECT 
    departamento_id AS 'Departamento',
    MIN(salario) AS 'Salario mínimo por departamento'
FROM empleados
GROUP BY departamento_id;

-- Obtén la suma total de salarios por departamento.

SELECT 
    departamento_id AS 'Departamento',
    SUM(salario) AS 'Suma de salarios por departamento'
FROM empleados
GROUP BY departamento_id;

-- Encuentra la cantidad total de productos vendidos por empleado.

SELECT 
    empleado_id,
    SUM(cantidad) AS 'Cantidad total de productos vendidos por empleado'
FROM ventas
GROUP BY empleado_id;


-- EJERCICIOS CON FUNCIÓN HAVING()

-- Encuentra los departamentos con al menos 2 empleados con una edad menor de 30 años.

SELECT 
    departamento_id AS 'ID departamento',
    COUNT(CASE WHEN edad < 30 THEN 1 END) AS 'Empleados con edad menor a 30 años'
FROM empleados
GROUP BY departamento_id
HAVING COUNT(CASE WHEN edad < 30 THEN 1 END) >= 2;

-- Muestra los clientes que han gastado más de $2,000 en total en compras.

SELECT 
    cliente_id AS 'ID cliente',
    SUM(monto_total) AS 'Clientes que han gastado más de $2000 en compras'
FROM ventas
GROUP BY cliente_id
HAVING SUM(monto_total) > 2000;


-- EJERCICIOS CON FUNCIÓN AS()

-- Crea una consulta que muestre la edad de los empleados junto con la edad 
-- aumentada en 5 años y que esta nueva columna se llame “Edad en 5 años”.

SELECT 
    CONCAT(nombre, ' ', apellido) AS 'Nombre',
    edad AS 'Edad actual',
    edad+5 AS 'Edad en 5 años'
FROM empleados;

-- Muestra el monto total de ventas junto con el monto total aumentado en un 21%  
-- y que esta nueva columna se llame “Precio + IVA”.

SELECT 
    SUM(monto_total) AS 'Monto total ventas',
    SUM(monto_total)*1.21 AS 'Precio + IVA'
FROM ventas;

-- Crea una consulta que muestre el nombre del producto y 
-- su precio unitario precedido con el signo “$ ” y que esta 
-- nueva columna se llame “precio con formato”.

SELECT 
    nombre AS 'Nombre producto',
    CONCAT('$', precio) AS 'Precio con formato'
FROM productos;


-- EJERCICIOS CON FUNCIÓN LIMIT()

-- Muestra los 5 clientes con los IDs más bajos.

SELECT cliente_id FROM ventas
GROUP BY cliente_id
ORDER BY cliente_id ASC
LIMIT 5;

-- Muestra los 3 productos más vendidos.

SELECT producto_id, SUM(cantidad) AS 'Productos más vendidos'
FROM ventas
GROUP BY producto_id
ORDER BY SUM(cantidad) DESC
LIMIT 3;

-- Muestra los 5 empleados más jóvenes.

SELECT 
    CONCAT(nombre, ' ', apellido) AS 'Nombre y apellido', 
    edad AS 'Empleados más jóvenes'
FROM empleados
ORDER BY edad ASC
LIMIT 5;
