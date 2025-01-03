-- Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado.

SELECT CONCAT(e.nombre, ' ', e.apellido) AS nombre_apellido, SUM(v.cantidad) AS cantidad_total
FROM empleados e
INNER JOIN ventas v ON e.id = v.empleado_id
GROUP BY nombre_apellido;

-- Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total.

SELECT 
    c.nombre AS nombre_cliente, 
    c.direccion AS direccion_cliente, 
    SUM(v.monto_total) AS monto_total 
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre, c.direccion;

-- Encuentra los productos vendidos por cada empleado en el departamento de "Ventas" y muestra el nombre del empleado junto con el nombre de los productos que han vendido.

SELECT e.nombre AS nombre_empleado, p.nombre AS nombre_producto, SUM(v.cantidad) AS cant_total
FROM empleados e
JOIN ventas v ON v.empleado_id = e.id
JOIN productos p ON v.producto_id = p.id
JOIN departamentos d ON e.departamento_id = d.id
WHERE d.nombre = 'Ventas'
GROUP BY e.nombre, p.nombre;

-- Encuentra el nombre del cliente, el nombre del producto y la cantidad comprada de productos con un precio superior a $500.

SELECT 
    c.nombre AS nombre_cliente, 
    p.nombre AS nombre_producto, 
    SUM(v.cantidad) AS cantidad_total, 
    p.precio AS precio_mayor_500
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
JOIN productos p ON v.producto_id = p.id
WHERE p.precio > 500
GROUP BY c.nombre, p.nombre, p.precio;

-- Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas.

SELECT d.nombre AS nombre_departamento, SUM(v.cantidad) AS cant_total
FROM departamentos d
LEFT JOIN empleados e ON d.id = e.departamento_id
LEFT JOIN ventas v ON e.id = v.empleado_id
GROUP BY d.nombre;

-- Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos distintos y muestra la cantidad de productos comprados.

SELECT
    c.nombre AS nombre_cliente, 
    c.direccion as direccion_cliente, 
    COUNT(DISTINCT p.id) AS productos_distintos, 
    SUM(v.cantidad) AS cantidad_total
FROM clientes c
JOIN ventas v ON v.cliente_id = c.id
JOIN productos p ON v.producto_id = p.id
GROUP BY c.nombre, c.direccion
HAVING COUNT(DISTINCT p.id) > 3;

-- Calcula el monto total de ventas realizadas por cada departamento y muestra el nombre del departamento junto con el monto total de ventas.


SELECT d.nombre AS nombre_departamento, SUM(v.monto_total) AS monto_total
FROM departamentos d
JOIN empleados e ON d.id = e.departamento_id
JOIN ventas v ON e.id = v.empleado_id
GROUP BY d.nombre;
