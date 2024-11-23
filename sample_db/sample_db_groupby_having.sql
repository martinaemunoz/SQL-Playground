-- SELECT column_name(s) {function}
-- FROM table_name
-- {WHERE condition}
-- GROUP BY column_name(s)
-- {ORDER BY column_name(s);}

-- SELECT columna1, function_agreg(columna2)
-- FROM nombre_tabla
-- [WHERE condition]
-- GROUP BY columna1
-- HAVING condition_agreg;

-- Ejercicios GROUP BY()
-- Agrupa las ventas por empleado y muestra la cantidad 
-- total de ventas realizadas por cada empleado.

SELECT empleado_id, SUM(cantidad) AS 'Ventas totales por empleado'
FROM ventas
GROUP BY empleado_id;

-- Agrupa los productos por precio 
-- y muestra la cantidad de productos con el mismo precio.

SELECT 
    precio AS 'Precio',
    COUNT(*) AS 'N de productos con el mismo precio'
FROM productos
GROUP BY precio;

-- Agrupa los empleados por departamento y muestra 
-- la cantidad de empleados en cada departamento.

SELECT 
    departamento_id AS 'Departamento',
    COUNT(*) AS 'Empleados por departamento'
FROM empleados
GROUP BY departamento_id;

-- Ejercicios HAVING 
-- Encuentra los departamentos con un salario promedio 
-- de sus empleados superior a $3,000.

SELECT 
    departamento_id AS 'Departamento',
    AVG(salario) AS 'Salario promedio'
FROM empleados
GROUP BY departamento_id
HAVING AVG(salario) > 3000;

-- Encuentra los productos que se han vendido al menos 5 veces.

SELECT 
    producto_id AS 'ID producto',
    SUM(cantidad) AS 'Productos vendidos'
FROM ventas
GROUP BY producto_id
HAVING SUM(cantidad) >= 5;

-- Selecciona los empleados que tengan una “o” en su nombre 
-- o apellido y agrúpalos por departamento y muestra 
-- los que tengan el salario máximo.

SELECT 
    departamento_id AS 'Departamento',
    MAX(salario) AS 'Salario máximo',
    GROUP_CONCAT(CONCAT(nombre, ' ', apellido)) AS 'Empleados con salario máximo'
FROM empleados
WHERE LOWER(nombre) LIKE '%o%' OR LOWER(apellido) LIKE '%o%'
GROUP BY departamento_id
HAVING MAX(salario) = MAX(salario);