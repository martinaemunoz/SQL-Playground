-- Ejercicios cláusula IN
-- Encuentra los empleados cuyos IDs son 1, 3 o 5.

SELECT * FROM empleados
WHERE id IN(1, 3, 5);

-- Busca los productos con IDs 2, 4 o 6 en la tabla de productos.

SELECT * FROM productos
WHERE id IN(2, 4, 6)

-- Encuentra las ventas que tienen los clientes con IDs 1, 3 o 5.

SELECT * FROM ventas
WHERE ventas.cliente_id IN(1, 3, 5)

-- Ejercicios cláusula LIKE
-- Encuentra los empleados cuyos nombres comienzan con "L".

SELECT * FROM empleados
WHERE LOWER(nombre) LIKE 'l%';

-- Busca los productos cuyos nombres contengan la palabra "Teléfono".

SELECT * FROM productos
WHERE LOWER(nombre) LIKE '%teléfono%';

-- Encuentra los clientes cuyas direcciones contienen la palabra "Calle".

SELECT * FROM clientes
WHERE LOWER(clientes.direccion) LIKE '%calle%';

-- Ejercicios cláusula ORDER BY:
-- Ordena los empleados por salario de manera ascendente.

SELECT * FROM empleados
ORDER BY salario ASC;

-- Ordena los productos por nombre de manera descendente.

SELECT * FROM productos
ORDER BY nombre DESC;

-- Ordena las ventas por cantidad de manera ascendente y luego por precio_unitario de manera descendente.

SELECT * FROM ventas
ORDER BY cantidad ASC;

SELECT * FROM ventas
ORDER BY precio_unitario DESC;

-- Ejercicios LIMIT
-- Muestra los 2 productos más caros de la tabla "productos"

SELECT * FROM productos
ORDER BY precio DESC
LIMIT 2;

-- Muestra los 5 primeros empleados en orden alfabético por apellido.

SELECT * FROM empleados
ORDER BY apellido ASC
LIMIT 5;

-- Muestra las 3 ventas con el monto total más alto.

SELECT * FROM ventas
ORDER BY monto_total DESC
LIMIT 3;

-- Ejercicios AS
-- Crea una consulta que muestre el salario de los empleados 
-- junto con el salario aumentado en un 10% nombrando a la columna como “Aumento del 10%”.

SELECT empleados.salario, empleados.salario * 1.1 AS 'Aumento del 10%'
FROM empleados;

-- Crea una consulta que calcule el monto total de las compras 
-- realizadas por cliente y que la columna se llame “Monto total gastado”.

SELECT ventas.cliente_id, SUM(ventas.monto_total) AS 'Monto total gastado'
FROM ventas
GROUP BY ventas.cliente_id;

-- Muestra los nombres completos de los empleados concatenando los campos 
-- "nombre" y "apellido" y que la columna se llame “Nombre y apellido”.

SELECT CONCAT(empleados.nombre, ' ', empleados.apellido) AS 'Nombre y apellido'
FROM empleados;