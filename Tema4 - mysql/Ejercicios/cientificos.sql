DROP database if exists cientificos;
CREATE DATABASE cientificos;
USE cientificos; 
 create table cientifico (  
	DNI int,
	Nombre varchar(30),
	Apellido varchar(30),
	Fecha_Nacimiento date,
	primary key(DNI) 
 );
 create table proyecto(
	CODIGO varchar(2),
    Nombre varchar(30),
    Horas int,
    primary key(CODIGO)
);
 create table asignado(
	DNI int,
    CODIGO varchar(2),
    FOREIGN KEY(DNI) REFERENCES cientifico(DNI),
	FOREIGN KEY(CODIGO) REFERENCES proyecto(CODIGO),
    PRIMARY KEY(DNI,CODIGO)
);
insert into cientifico (DNI,Nombre,Apellido,Fecha_Nacimiento)
values (1, 'María', 'Guzmán', '1974/02/12')
, (2, 'María', 'Jiménez', '1954/02/11')
, (3, 'Rafael', 'Girado', '1965/01/22')
, (4, 'Alonso', 'Gómez', '1990/12/12')
, (5, 'Clara', 'Antúnez', '1973/11/12');
insert into asignado (DNI,CODIGO) values
(1,'A')
,(1,'B')
,(1,'C')
,(2,'A')
,(3,'A')
,(2,'B')
,(4,'A')
,(4,'B')
,(4,'C')
,(4,'E')
,(4,'D');
insert into proyecto(CODIGO,Nombre,Horas) values
('A', 'Bioquimica',410)
,('B', 'Electronica',1200)
,('C', 'Geológica', 300)
,('D', 'Tectónica', 500)
,('E', 'Histograma', 70);


-- 1.- Relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del
-- científico, Identificador del proyecto y nombre del proyecto.

select cientifico.DNI,cientifico.nombre,proyecto.codigo,proyecto.nombre
from cientifico
	inner join asignado on cientifico.dni=asignado.dni
    inner join proyecto on proyecto.codigo=asignado.codigo
    ;

-- 2.- Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el
-- nombre).

select cientifico.dni,cientifico.nombre, count(asignado.codigo)
from cientifico
	left join asignado on cientifico.dni=asignado.dni group by cientifico.dni;

-- 3.- Obtener el número de científicos asignados a cada proyecto (mostrar el identificador del
-- proyecto y el nombre del proyecto).

select proyecto.nombre,proyecto.codigo, count(*)
from proyecto
	left join asignado on asignado.codigo=proyecto.codigo group by proyecto.codigo;

-- 4.- Obtener el número de dedicación de cada científico.

select cientifico.dni,cientifico.nombre,sum(proyecto.horas)
from cientifico
	left join asignado on cientifico.dni=asignado.dni 
    left join proyecto on asignado.codigo=proyecto.codigo
    group by cientifico.dni;

-- 5.- Obtener el DNI y el nombre de los científicos que se dedican a más de un proyecto y cuya
-- dedicación media a cada proyecto sea superior a las 80 horas.

select cientifico.dni,cientifico.nombre,count(*)
from cientifico
	left join asignado on cientifico.dni=asignado.dni 
	left join proyecto on proyecto.codigo=asignado.codigo
    group by cientifico.dni
    having count(*)>1
	and avg(proyecto.horas)>80
;

-- 6.- Nombre del científico que trabaja en todos los proyectos.

-- 7.- Nombre del científico que no trabaja en ningún proyecto. LEFT JOIN
	