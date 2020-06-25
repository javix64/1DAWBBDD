drop database if exists curso_sql;
create database curso_sql;
use curso_sql;

create table cajeros(
Codigo int primary key,
NomApels varchar(255));

create table productos(
Codigo int primary key,
Nombre varchar(100),
Precio int);

create table Maquinas_registradoras(
Codigo int primary key,
Piso int);

create table Venta(
Cajero int,
Producto int,
Maquina int,
primary key(Cajero,Maquina,Producto), 
foreign key (Cajero) references cajeros(Codigo),
foreign key (Maquina) references Maquinas_registradoras(Codigo),
foreign key (Producto) references productos(Codigo));

insert into cajeros values
(4382, 'Juan'),
(8493, 'Nestor'),
(3963, 'Francisco'),
(3414, 'Angel'),
(6298, 'Manuel'),
(5243, 'José');

insert into productos values
(3741, 'PS4', 400),
(7629, 'xBox One', 450),
(3925, 'Nintendo DS', 180),
(4602, 'PSVita', 220),
(6420, 'Wii-U', 300),
(6421, 'NIntendo Switch', 349);
select * from productos;
insert into Maquinas_registradoras values
(2951, 1),
(4325, 1),
(6382, 2),
(4629, 3),
(2843, 4);

insert into Venta values
(3963, 6420, 4629),
(3414, 3741, 2843),
(4382, 3925, 2951),
(6298, 4602, 4325),
(5243, 7629, 2843),
(3963, 3741, 2843),
(4382, 7629, 6382);


#Obtener el número de ventas de cada producto, ordenado de más a menos ventas.
-- 
select productos.nombre, count(Venta.Producto)
from Venta, productos
where productos.Codigo=Venta.Producto
group by Venta.Producto
order by count(Venta.Producto) desc;

#Obtener un informe completo de ventas, indicando el nombre del cajero que realizó la venta,
#nombre y precios de los productos vendidos, y piso en el que se encuentra la máquina
#registradora donde se realizó la venta.

SELECT cajeros.NomApels as 'Cajero', productos.Nombre, productos.Precio, Maquinas_registradoras.Piso 
from cajeros, productos, Maquinas_registradoras, Venta
WHERE cajeros.Codigo=Venta.Cajero AND productos.Codigo=Venta.Producto
and Maquinas_registradoras.Codigo=Venta.Maquina;

#Obtener las ventas realizadas en cada piso.
SELECT Maquinas_registradoras.Piso,count(Venta.Producto) as 'Total de ventas'
from Venta, Maquinas_registradoras
WHERE Maquinas_registradoras.Codigo=Venta.Maquina
group by Maquinas_registradoras.Piso;

#Obtener el código y nombre de cada empleado, junto con el importe total de sus ventas.
select cajeros.NomApels,cajeros.Codigo,SUM(productos.Precio)
FROM cajeros,productos,Venta
where cajeros.Codigo=Venta.Cajero and productos.Codigo=Venta.Producto
group by cajeros.Codigo;

#Obtener el código y nombre de aquellos cajeros que hayan realizado ventas en pisos cuyas
#ventas totales sean inferiores a los 500€
SELECT DISTINCT cajeros.Codigo,cajeros.NomApels, Maquinas_registradoras.Piso,SUM(productos.Precio) 
FROM cajeros,Maquinas_registradoras,Venta,productos
WHERE cajeros.Codigo=Venta.Cajero and Maquinas_registradoras.Codigo=Venta.Maquina
and productos.Codigo=Venta.Producto
group by Maquinas_registradoras.Piso
HAVING SUM(productos.Precio)<500;

# 6.- Aquellos prodcutos que no han sido vendidos.
SELECT productos.nombre, Venta.Producto
from productos left join Venta on Venta.Producto=productos.Codigo
where Venta.Producto is null;

# 7 Cajero que haya realizado más ventas en número de productos
SELECT cajeros.NomApels, Venta.Cajero, count(productos.Codigo) as 'Numero de ventas'
from cajeros,Venta,productos
where cajeros.Codigo=Venta.Cajero and productos.Codigo=Venta.Producto
group by cajeros.NomApels;