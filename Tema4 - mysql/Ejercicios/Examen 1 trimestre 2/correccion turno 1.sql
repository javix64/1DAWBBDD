DROP DATABASE if EXISTS Burri;
CREATE DATABASE Burri; USE Burri;
CREATE TABLE pieza (
pieza INT PRIMARY KEY,
nombre VARCHAR(20),
peso INT,
color VARCHAR(20),
ciudad VARCHAR(20)); DESCRIBE pieza;
CREATE TABLE proyecto (
proyecto INT PRIMARY KEY,
nombre VARCHAR(20),
ciudad VARCHAR(20)); DESCRIBE proyecto;
CREATE TABLE proveedor(
prov INT PRIMARY KEY,
nombre VARCHAR(20), STATUS INT,
ciudad VARCHAR(20));
DROP TABLE tabla_suministro;
CREATE TABLE suministro(
prov INT,
pieza INT,
proyecto INT,
cantidad INT, PRIMARY KEY(prov, pieza, proyecto), FOREIGN KEY (prov) REFERENCES proveedor(prov), FOREIGN KEY (pieza) REFERENCES pieza(pieza), FOREIGN KEY (proyecto) REFERENCES proyecto(proyecto)); DESCRIBE tabla_suministro;
INSERT INTO pieza VALUES (1,'tuerca',5,'rojo','Paris');
INSERT INTO pieza VALUES 
(2,'tornillo',15,'azul','Londres'),
(3,'martillo',100,'negro','Roma'),
(4,'punzón',25,'rojo','Madrid'),
(5,'clavo',10,'rojo','Londres');
INSERT INTO Proveedor VALUES(1,'López',20,'Londres'),
(2,'Jiménez',30,'París'),
(3,'Pérez',15,'Londres'),
(4,'Martínez',15,'Madrid'),
(5,'Torres',15,'Roma');
SELECT *
FROM proveedor;
INSERT INTO Proyecto VALUES
(1,'Construcción','Londres'),
(2,'Programación','Londres'),
(3,'Carpinteria','Roma'),
(4,'Techos','París'),
(5,'Construcción','Madrid'),
(6,'Programación','Madrid');
SELECT *
FROM proyecto;
INSERT INTO suministro VALUES
(1,1,1,350),
(2,5,5,225),
(3,2,2,1001),
(4,3,3,250),
(1,2,1,120),
(2,3,4,110),
(2,2,1,111),
(3,1,6,121),
(2,1,3,50),
(2,4,2,60);
SELECT *
FROM suministro;

-- 1
SELECT DISTINCT proveedor.prov, proveedor.nombre
FROM proveedor, suministro, proyecto
WHERE proveedor.prov=suministro.prov AND suministro.proyecto=proyecto.proyecto AND proyecto.Nombre='Construcción' ;

-- 2
SELECT pieza.nombre, proveedor.nombre, proyecto.nombre
FROM pieza, proveedor, proyecto, suministro
WHERE proveedor.prov=suministro.prov AND suministro.proyecto=proyecto.proyecto AND pieza.pieza=suministro.pieza AND suministro.cantidad BETWEEN 150 AND 350;

-- 3
SELECT proveedor.prov, proyecto.proyecto, pieza.pieza
FROM proveedor, pieza, proyecto, suministro
WHERE proveedor.prov=suministro.prov AND suministro.proyecto=proyecto.proyecto AND pieza.pieza=suministro.pieza AND pieza.ciudad=proyecto.ciudad AND proveedor.ciudad=pieza.ciudad;

-- 4
SELECT proyecto.proyecto, proyecto.nombre
FROM proyecto, suministro
WHERE proyecto.proyecto=suministro.proyecto AND
cantidad >1000;

-- 5
SELECT DISTINCT proveedor.nombre, proveedor.prov
FROM proveedor,suministro,proyecto
WHERE proveedor.prov=suministro.prov AND proyecto.proyecto=suministro.proyecto AND proyecto.nombre='Programación' AND proveedor.prov NOT in
(
SELECT proveedor.prov
FROM proveedor, suministro,proyecto
WHERE proveedor.prov=suministro.prov AND proyecto.proyecto=suministro.proyecto AND proyecto.nombre='Construcción');

-- 6
SELECT pieza.nombre
FROM pieza
WHERE peso <(
SELECT AVG(peso)
FROM pieza);

-- 7
SELECT proveedor.nombre, COUNT(suministro.proyecto)
FROM proveedor, suministro, proyecto
WHERE proveedor.prov=suministro.prov AND proyecto.proyecto=suministro.proyecto
GROUP BY suministro.prov
HAVING COUNT(suministro.proyecto)= (
SELECT COUNT(proyecto.proyecto)
FROM proyecto);
-- 8
SELECT proveedor.nombre, suministro.proyecto
FROM proveedor
LEFT JOIN suministro ON proveedor.prov=suministro.prov
WHERE suministro.proyecto IS NULL;





