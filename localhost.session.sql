CREATE DATABASE clase;
USE clase;

CREATE TABLE IF NOT EXISTS profesores (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT, -- clave primaria autoincremental para garantizar unicidad
    nombre VARCHAR(50), -- columna de texto de hasta 50 caracteres para almacenar nombres
    salario DECIMAL(10,2) DEFAULT 0.00, -- columna de tipo decimal con valor predeterminado de 0.00
    fecha_contratacion timestamp DEFAULT NOW() -- columna que registra la fecha y hora de creación por defecto
);

CREATE TABLE IF NOT EXISTS alumnos (
    id_alumno INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- clave primaria autoincremental no negativa
    nombre VARCHAR(50) NOT NULL, -- columna obligatoria (NOT NULL) para nombres
    apellido VARCHAR(50) NOT NULL, -- -- Columna obligatoria (NOT NULL) para apellidos
    edad INT,
    numerodni VARCHAR(10) UNIQUE NOT NULL, -- -- columna única y obligatoria para números de DNI
    email VARCHAR(50) DEFAULT NULL, -- columna opcional para emails con valor nulo por defecto
    id_profesor_mentor INT, -- relación con la tabla `profesores`
    FOREIGN KEY (id_profesor_mentor) REFERENCES profesores(id_profesor) -- la tabla q declara llave foránea hace referencia a la llave primaria a la q está relacionada   
    );

SHOW TABLES;

SELECT * FROM alumnos;

-- ALTER TABLE table_name -- permiten modificar la estructura de una tabla existente en una base de datos
-- DROP COLUMN column_name -- elimina una columna existente en una tabla

-- ALTER TABLE table_name RENAME COLUMN old_name to new_name; -- renonmbrar columna sin afectar datos almacenados
-- ALTER TABLE table_name MODIFY COLUMN column_name datatype; -- se puede cambiar el tipo de dato, agregar restricciones como NOT NULL, o modificar la longitud de los datos permitidos

-- USE sakila;
-- DROP TABLE alumnos;
-- DROP TABLE profesores;


-- USE world;
-- DROP TABLE alumnos;
-- DROP TABLE profesores;


ALTER TABLE profesores
ADD apellido VARCHAR(50) NOT NULL;

ALTER TABLE profesores
MODIFY fecha_contratacion DATE;