drop database if exists examen2; 
create database examen2;
use examen2;
CREATE TABLE empleado (
	emp varchar(100) primary key,
	dni INT,
	nombre varchar(100),
	numhijos INT,
	ciudad varchar(100)
);
CREATE TABLE departamento(
	dpto varchar(100) primary key,
	nombre varchar(100),
	asignacion float
);
CREATE TABLE articulos(
	art varchar(100) primary key,
	nombre varchar(100),
	color varchar(100),
	ctd INT,
	iva INT
);
CREATE TABLE pertenece(
	emp varchar(100),
	dpto varchar(100),
	primary key(emp,dpto),
	FOREIGN KEY (dpto) REFERENCES examen2.departamento(dpto),
	FOREIGN KEY (emp) REFERENCES examen2.empleado(emp)
);
CREATE TABLE es_jefe(
	emp varchar(100),
	dpto varchar(100),
	primary key(emp,dpto),
	foreign key (dpto) references departamento(dpto),
	foreign key (emp) references empleado(emp)
);
CREATE TABLE usa(
	dpto varchar(100),
	art varchar(100),
	primary key(dpto,art),
	foreign key (dpto) references departamento(dpto),
	foreign key (art) references articulos(art)
);

insert into empleado values('E1',801,'Uno',1,'Albacete');
insert into empleado values('E2',802,'Dos',2,'Cuenca');
insert into empleado values('E3',803,'Tres',3,'Albacete');
insert into empleado values('E4',804,'Cuatro',4,'Lisboa');
insert into empleado values('E5',805,'Cinco',3,'Murcia');
insert into empleado values('E6',806,'Seis',4,'Cuenca');
insert into empleado values('E7',807,'Siete',6,'Milan');
insert into empleado values('E8',808,'Ocho',1,'Albacete');

insert into articulos values ('A1','Impresoras','Verde',150,12);
insert into articulos values ('A2','Tinta','Azul',350,6);
insert into articulos values ('A3','Papel','Azul',550,6);
insert into articulos values ('A4','Boligrafos','Blanco',1000,12);
insert into articulos values ('A5','Lapiz','Negro',500,12);
insert into articulos values ('A6','Proyector','Negro',550,12);
insert into articulos values ('A7','Portatil','Amarillo',350,6);
insert into articulos values ('A8','Pantalla','Rojo',3050,12);

insert into departamento values
('D1','Marketing',105000),
('D2','Facturación',50000),
('D3','Ventas',50000);

insert into usa values('D1','A1');
insert into usa values('D1','A2');
insert into usa values('D2','A2');
insert into usa values('D3','A2');
insert into usa values('D3','A3');
insert into usa values('D3','A4');
insert into usa values('D3','A1');
insert into usa values('D2','A3');
insert into usa values('D1','A5');
insert into usa values('D1','A6');
insert into usa values('D2','A7');
insert into usa values('D3','A8');
insert into usa values('D3','A7');

insert into pertenece values ('E1','D1');
insert into pertenece values ('E2','D1');
insert into pertenece values ('E3','D1');
insert into pertenece values ('E4','D2');
insert into pertenece values ('E5','D2');
insert into pertenece values ('E6','D3');
insert into pertenece values ('E7','D3');
insert into pertenece values ('E8','D3');

insert into es_jefe values('E1','D1');
insert into es_jefe values('E4','D2');
insert into es_jefe values('E6','D3');

-- 1
SELECT empleado.nombre,empleado.ciudad
FROM empleado,departamento,pertenece
WHERE empleado.emp=pertenece.emp 
AND departamento.dpto=pertenece.dpto
AND empleado.numhijos>(SELECT AVG(empleado.numhijos) FROM empleado);

-- 2

SELECT departamento.nombre
FROM empleado,departamento,es_jefe,usa,articulos
WHERE empleado.emp=es_jefe.emp 
AND departamento.dpto=es_jefe.dpto
AND articulos.art=usa.art
AND departamento.dpto=usa.dpto
AND empleado.ciudad='Lisboa'
AND articulos.color='Azul';

-- 3
SELECT empleado.nombre,departamento.nombre
FROM empleado,departamento,es_jefe
WHERE empleado.emp=es_jefe.emp
AND departamento.dpto=es_jefe.dpto
AND departamento.asignacion>(SELECT AVG(departamento.asignacion) FROM departamento);
SELECT AVG(departamento.asignacion) FROM departamento;
-- 4
SELECT departamento.nombre, COUNT(articulos.nombre) AS 'Num_articulos' 
FROM articulos,usa,departamento
WHERE articulos.art=usa.art
AND departamento.dpto=usa.dpto
GROUP BY departamento.nombre desc;

-- 5
/*
SELECT departamento.nombre
FROM articulos,usa,departamento
WHERE articulos.art=usa.art
AND departamento.dpto=usa.dpto
group by departamento.nombre;
*/
SELECT departamento.nombre
FROM articulos,usa,departamento
WHERE articulos.art=usa.art
AND departamento.dpto=usa.dpto
GROUP BY departamento.dpto;

-- 6
SELECT articulos.*
FROM usa inner join articulos
ON articulos.art=usa.art is not null;

-- 7
SELECT departamento.nombre, SUM(empleado.numhijos) AS 'Total de hijos'
FROM empleado,departamento,pertenece
WHERE empleado.emp=pertenece.emp
AND departamento.dpto=pertenece.dpto
group BY departamento.nombre
order by SUM(empleado.numhijos) asc;

-- 8
create view empleado_usa_articulo AS
SELECT empleado.nombre as 'Empleado nombre', articulos.*
FROM empleado, pertenece,departamento,usa,articulos
WHERE empleado.emp=pertenece.emp
AND pertenece.dpto=departamento.dpto
AND departamento.dpto=usa.dpto
AND usa.art=articulos.art;
select * from empleado_usa_articulo;

