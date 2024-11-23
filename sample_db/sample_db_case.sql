-- Ejercicios CASE
-- Crea una consulta que muestre el nombre de los productos y los categorice como "Caro" 
-- si el precio es mayor o igual a $500, "Medio" si es mayor o igual a $200 y menor que $500, 
-- y "Barato" en otros casos.

SELECT nombre,
CASE
    WHEN precio >= 500 THEN 'Caro'
    WHEN precio >= 200 AND precio < 500 THEN 'Medio'
    ELSE 'Barato'
END AS 'Valor'
FROM productos;

-- Crea una consulta que muestre el nombre de los empleados 
-- y los categorice como "Joven" si tienen menos de 30 años, 
-- "Adulto" si tienen entre 30 y 40 años, y "Mayor" si tienen más de 40 años.

SELECT nombre,
CASE
    WHEN edad < 30 THEN 'Joven'
    WHEN edad >= 30 AND edad <= 40 THEN 'Adulto'
    ELSE 'Mayor'
END AS 'Rango etáreo'
FROM empleados;

-- Crea una consulta que muestre el ID de la venta y 
-- los categorice como "Poca cantidad" si la cantidad es menor que 3, 
-- "Cantidad moderada" si es igual o mayor que 3 y menor que 6, 
-- y "Mucha cantidad" en otros casos.

SELECT id, cantidad,
CASE
    WHEN cantidad < 3 THEN 'Poca cantidad'
    WHEN cantidad >= 3 AND cantidad < 6 THEN 'Cantidad moderada'
    ELSE 'Mucha cantidad'
END AS 'Rango de cantidad'
FROM ventas;

-- Crea una consulta que muestre el nombre de los clientes 
-- y los categorice como "Comienza con A" si su nombre comienza con la letra 'A',
-- "Comienza con M" si comienza con 'M' y "Otros" en otros casos.

SELECT nombre,
CASE
    WHEN LOWER(nombre) LIKE 'a%' THEN 'Comienza con A'
    WHEN LOWER(nombre) LIKE 'm%' THEN 'Comienza con M'
    ELSE 'Otros'
END AS 'Letra inicial del nombre'
FROM clientes;

-- Crea una consulta que muestre el nombre de los empleados 
-- y los categorice como "Salario alto" si el salario es mayor 
-- o igual a $3500, "Salario medio" si es mayor o igual a $3000 
-- y menor que $3500, y "Salario bajo" en otros casos.

SELECT nombre, salario,
CASE
    WHEN salario >= 3500 THEN 'Salario alto'
    WHEN salario >= 3000 AND salario < 3500 THEN 'Salario medio'
    ELSE 'Salario bajo'
END AS 'Rango salario'
FROM empleados;