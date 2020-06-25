drop database fabrica;
create database fabrica;
use fabrica;

create table Pieza(
pieza int
,nombre varchar(20)
,peso int
,color varchar(10)
,ciudad varchar(20)
,primary key(pieza)
);

create table Proyecto(
proyecto int
,nombre varchar(20)
,ciudad varchar(20)
,primary key(proyecto)
);

create table Proveedor(
prov int
,nombre varchar(20)
,status int
,ciudad varchar(20)
,primary key(prov)
);

create table Suministro(
prov int
,pieza int
,proyecto int
,cantidad int
,primary key(prov,pieza,proyecto)
,foreign key(prov) REFERENCES Proveedor(prov)
,foreign key(proyecto) REFERENCES Proyecto(proyecto)
,foreign key(pieza) REFERENCES Pieza(pieza)
);

insert into Pieza values(1,'tuerca',5,'rojo','París');
insert into Pieza values(2,'tornillo',15,'azul','Londres');
insert into Pieza values(3,'martillo',100,'negro','Roma');
insert into Pieza values(4,'punzón',25,'rojo','Madrid');
insert into Pieza values(5,'clavo',10,'rojo','Londres');
insert into Pieza values(6,'taladro',20,'amarillo','Marruecos');

insert into Proveedor values(1,'López',20,'Londres');
insert into Proveedor values(2,'Jiménez',30,'París');
insert into Proveedor values(3,'Pérez',15,'Londres');
insert into Proveedor values(4,'Martínez',15,'Madrid');
insert into Proveedor values(5,'Torres',15,'Roma');

insert into Suministro values(1,1,1,350);
insert into Suministro values(2,5,5,225);
insert into Suministro values(3,2,2,1001);
insert into Suministro values(4,3,3,250);
insert into Suministro values(1,2,1,120);
insert into Suministro values(2,3,4,110);
insert into Suministro values(2,2,1,111);
insert into Suministro values(3,1,6,121);

insert into Proyecto values(1,'Construcción','Londres');
insert into Proyecto values(2,'Programación','Londres');
insert into Proyecto values(3,'Carpinteria','Roma');
insert into Proyecto values(4,'Techos','Paris');
insert into Proyecto values(5,'Construcción','Madrid');
insert into Proyecto values(6,'Programación','Madrid');

-- Ejercicio 1

select * from Proveedor,Proyecto,Suministros where Proyecto.nombre='Construccion';

-- Ejercicio 2
select prov,pieza,proyecto from Suministro where cantidad between 150 and 350;

-- Ejercicio 3

