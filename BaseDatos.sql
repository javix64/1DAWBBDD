use database 
create table cliente(
dni varchar2(9) primary key,
nombre varchar2(50)
);

create table pelicula(cod number(5) primary key,
titulo varchar2(20),
año varchar2(20),
duracion_minutos number(5)
);

create table alquiler(dni varchar2(9),
cod_pelicula number(5),
constraint alquiler_pk primary key(dni,cod_pelicula),
constraint dni_fk foreign key(dni) references cliente(dni),
constraint pelicula_fk foreign key(cod_pelicula)
references pelicula(cod)
);
insert into pelicula values(5,'ET','1982',120);
insert into cliente values('123456','Maria');
insert into alquiler values('123456',5);
insert into pelicula values (1,'The Goonies','1983',115);
insert into pelicula values (2,'Volver a empezar','1984',130);
insert into cliente values('1234567','Pepe');
insert into alquiler values('123456',2);
insert into cliente values ('123456778','Manolo');
insert into alquiler values('123456778',5);
insert into alquiler values('1234567',5);
-- probar que joins funcionan en oracle: left join, right join, inner join...
-- mostrar los clientes que hayan alquilado alguna pelicula
select distinct cliente.nombre 
from cliente,alquiler 
where alquiler.dni=cliente.dni ;
-- mostrar los clientes que hayan alquilado mas de una pelicula
select cliente.nombre from cliente, alquiler
where cliente.dni=alquiler.dni
group by cliente.nombre
having count(alquiler.dni)>1;
-- mostrar las peliculas que no han sido alquiladas
select distinct titulo from pelicula,alquiler
where titulo not in
(select titulo from pelicula, alquiler where cod_pelicula=cod);

select pelicula.titulo from pelicula
left join alquiler on pelicula.cod=alquiler.cod_pelicula
where alquiler.cod_pelicula is null;
-- mostrar las peliculas que empiezan por v
select titulo 
from pelicula 
where titulo like 'V%';
-- mostrar los clientes que empiezan por m
select nombre 
from cliente 
where nombre like 'M%';
-- mostrar los clientes que todavian no han alquilado ninguna pelicula
select cliente.nombre, alquiler.dni 
from cliente 
left join alquiler on cliente.dni=alquiler.dni 
where alquiler.dni is null;

select cliente.nombre,alquiler.cod_pelicula
from cliente left join alquiler
on cliente.dni=alquiler.dni
where alquiler.cod_pelicula is null;
-- mostrar las peliculas que duran mas que la media de las peliculas
select titulo,duracion_minutos
from pelicula 
where duracion_minutos>=(select avg(duracion_minutos)
from pelicula);
-- mostrar la pelicula que ha sido mas alquilada
-- 1 numero de veces - calcula el maximo
-- 2 el maximo - cod pelicula
-- 3 sacamos cod pelicula y luego el nombre
select titulo from pelicula where cod= -- se puede cambiar por cod in para ver las pelis
(select cod_pelicula from alquiler,pelicula
where alquiler.cod_pelicula=pelicula.cod
group by cod_pelicula 
having count(cod_pelicula)=(Select max (numerodeveces) 
from (select cod_pelicula,count(cod_pelicula) as numerodeveces
from alquiler group by cod_pelicula)));

    