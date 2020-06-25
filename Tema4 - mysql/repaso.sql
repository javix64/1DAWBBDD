drop database repaso;
create database repaso;
use repaso;

create table alumno(
dni varchar(8),
nombre varchar(15),
apellidos varchar(15),
primary key(dni));


-- o se puede poner esto: primary key(dni, apellidos)

# modificamos la tabla con alter table


describe alumno; -- te dice los atributos que tiene

# FOREIGN KEY -->
create table asignatura(
codigo int primary key,
nombre varchar(20));

create table esta_matriculado(
dni varchar(8),
codigo int,
primary key(dni, codigo),
foreign key(codigo) references asignatura(codigo));
-- reference es poner en que foreign key esta referenciado
alter table esta_matriculado add foreign key(dni) references alumno(dni);
alter table esta_matriculado add foreign key(codigo) references asignatura(codigo);
insert into alumno values 
	('1111A','ANa','Rodriguez')
	,('2222B','Pepe','Gomez')
	;
insert into asignatura values
	(1,'Matematicas')
	,(2,'Lengua')
	,(3,'Ingles')
	;
insert into esta_matriculado values
	('1111A',1)
	,('2222B',2)
	,('2222B',1)
	;
/*
select loqQueNosInteresa
from laTablaOlasTablas
where Condiciones
;
*/

# EL nombre de los alumnos que estan matriculado

# el nombre de alumnos que estan matriculados en orden alfabetico inverso

select nombre from alumno order by nombre asc; -- o desc
#nombre de los alumnos que empiezan por la letra A
select nombre from alumno 
where nombre like 'A%'; -- para que acabe en a '%A'
#el nombre de alumnos que terminan por la 'E%'
# que contenga la letra E: '%E%'
#EL NOMBRE DE LOS ALUMNOS Y EL NOMBRE DE LAS asignaturas que estan matriculados
/*
select distinct alumno.nombre,asignatura.onmbre,asignatura.codigo
from alumno, esta_matriculado,asignatura
where alumno.dni=esta_matriculado.dni 
and esta_matriculado.codigo=asignatura.codigo
;
*/

#nombre de los alumnos que estan matriculados de asignaturas que empiezan por la letra L
/*
select distinct  alumno.nombre,asignatura.onmbre,asignatura.codigo 
from alumno, esta_matriculado,asignatura
where alumno.dni=esta_matriculado.dni 
and esta_matriculado.codigo=asignatura.codigo
and asignatura.nombre like 'L%'
;
*/
-- Funciones de agregacion
-- min,max,avg,count,sum

# si
select count(*) from alumno;

# necesitamos saber el numero de alumnos que se apellidan rodriguez

select count(*) from alumno where apellidos like 'Rodriguez';
/*
select count(alumno.nombre)
from alumno,esta_matriculado,asignaturas
where alumno.dni=esta_matriculado.dni
and esta_matriculado.codigo=asignatura.codigo
and asignatura.nombre like 'Matematicas';
*/
# add a la tabla alumno: edad (de tipo numerico)

# alter table edad add column edad int;

# insert into alumno(edad) values(14) where DNI='1111A';
alter table alumno add column edad int;
update alumno set edad=14 where dni='1111A';
update alumno set edad=14 where dni='2222B';
update alumno set edad=15 where dni='3333C';
# nombre del alumno mas joven
/*
select nombre,min(edad) from alumno
where edad=(select min(edad) from alumno);
*/
# listado de las edades y numero de alumnos por cada edad
select edad,count(dni) from alumno group by edad;

# listado de las edades y numero de alumnos por cada edad

select edad, count(dni) from alumno group by edad;
# nombre de los alumnos cuya edad es unica y no se repite.

select alumno, from alumno group by edad where edad in
(select edad from alumno