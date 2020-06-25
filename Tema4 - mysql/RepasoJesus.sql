DROP DATABASE IF EXISTS repaso;
CREATE DATABASE repaso;
USE repaso;

CREATE TABLE alumno(
	DNI varchar(8),
	nombre varchar(10),
	apellidos varchar(30));
	
DESCRIBE alumno;

-- Para añadir la PK podemos borrar la tabla y crearla de nuevo con la PK
/*DROP TABLE alumno;
CREATE TABLE alumno(
	DNI varchar(8) PRIMARY KEY,
	nombre varchar(10),
	apellidos varchar(30));
	
DESCRIBE alumno;*/
-- También podemos utilizar
/*ALTER TABLE alumno ADD PRIMARY KEY (DNI);*/

-- Para que la pk sea la unión de nombre y apellidos
DROP TABLE alumno;
CREATE TABLE alumno(
	DNI varchar(8),
	nombre varchar(10),
	apellidos varchar(30),
	PRIMARY KEY (nombre,apellidos));
-- Para que sea DNI y nombre
ALTER TABLE alumno DROP PRIMARY KEY;
ALTER TABLE alumno ADD PRIMARY KEY (DNI,nombre);
ALTER TABLE alumno modify COLUMN apellidos varchar(30) NULL;
DESCRIBE alumno;


# FOREIGN KEY
CREATE TABLE asignatura(
	codigo int PRIMARY KEY,
	nombre varchar(20));

CREATE TABLE esta_matriculado(
	DNI varchar(8),
	codigo int,
	PRIMARY KEY (DNI,codigo));
ALTER TABLE esta_matriculado ADD FOREIGN KEY (DNI) REFERENCES alumno(dni);
ALTER TABLE esta_matriculado ADD FOREIGN KEY (codigo) REFERENCES asignatura(codigo);

INSERT INTO alumno VALUES ("11111A","Ana","Gomez");
INSERT INTO alumno VALUES ("22222B","Pepe","Rodriguez");
INSERT INTO alumno VALUES ("33333C","Eduardo","Rodriguez");
INSERT INTO alumno VALUES ("44444D","Eduardo",null);

INSERT INTO asignatura VALUES (1,"Matemáticas"),(2,"Lengua"),(3,"Inglés");
INSERT INTO esta_matriculado VALUES ("11111A",1);
INSERT INTO esta_matriculado VALUES ("22222B",2);
INSERT INTO esta_matriculado VALUES ("22222B",1);

select * from alumno;
select * from asignatura;
select * from esta_matriculado;

-- Añadir un campo llamado edad de tipo numérico
ALTER TABLE alumno ADD COLUMN edad int;
SELECT * FROM alumno;
UPDATE alumno SET edad=14 WHERE dni="11111A";
UPDATE alumno SET edad=15 WHERE dni="22222B";
UPDATE alumno SET edad=13 WHERE dni="33333C";
UPDATE alumno SET edad=14 WHERE dni="44444D";
describe esta_matriculado;
alter table esta_matriculado add column estado boolean;
-- Nombre de los alumnos que están matriculados
SELECT nombre FROM alumno;
-- El nombre de los alumnos que están matriculados en orden alfabético descendente
SELECT nombre FROM alumno t ORDER BY nombre DESC;
-- Nombre de los alumnos que empiezan por la letra A
SELECT nombre FROM alumno WHERE nombre LIKE "A%";
-- Nombre de los alumnos que terminen con la letra E
SELECT nombre FROM alumno WHERE nombre LIKE "%E";
-- Nombre de los alumnos y el nombre de las asignaturas en las que están matriculados
SELECT alumno.nombre,asignatura.nombre FROM alumno
	LEFT JOIN esta_matriculado ON alumno.DNI=esta_matriculado.DNI 
	LEFT JOIN asignatura ON esta_matriculado.codigo=asignatura.codigo
;
-- Nombre de los alumnos que están matriculados de asignaturas que empiezan por L
SELECT alumno.nombre,asignatura.nombre FROM alumno
	LEFT JOIN esta_matriculado ON alumno.DNI=esta_matriculado.DNI 
	LEFT JOIN asignatura ON esta_matriculado.codigo=asignatura.codigo
WHERE asignatura.nombre LIKE "L%"
;

-- Funciones de agregación
-- Min, Max, Avg, Count, Sum
-- Número de alumnos
SELECT COUNT(*) FROM alumno;
-- Número de alumnos que se apellidan Rodriguez
SELECT COUNT(apellidos) FROM alumno WHERE apellidos="Rodriguez";
-- Número de alumnos que están matriculados en matemáticas
SELECT count(DNI) FROM esta_matriculado
	LEFT JOIN asignatura ON esta_matriculado.codigo=asignatura.codigo 
WHERE asignatura.nombre="Matemáticas"
;

-- Edad máxima de los alumnos
SELECT max(edad) FROM alumno;
-- Edad mínima de los alumnos
SELECT min(edad) FROM alumno;
-- Edad media de los alumnos
SELECT avg(edad) FROM alumno;
-- Nombre del alumno más jóven
SELECT nombre FROM alumno 
WHERE edad = (SELECT min(edad) FROM alumno);
-- Listado de las edades y número de alumnos por cada edad
SELECT count(*),edad FROM alumno
GROUP BY edad;

-- Nombre de los alumnos cuya edad solo la tienen ellos
SELECT nombre 
FROM alumno
WHERE edad 
IN (
	SELECT edad 
	FROM alumno
	GROUP BY edad
	HAVING count(*)=1
);
	





