create database mascotas;

show databases;

use mascotas;
create table mascotas(
nombre varchar(20),dueno varchar(20), especie varchar(20),sexo char(1),
fechaNac date, fechaFac date, primary key(nombre,dueno)
);
select * from mascotas;
insert into mascotas values
('Fluffy','Arnoldo','Gato','f','1999-02-04',null);
insert into mascotas values
('Mau','Juan','Gato','m','1998-03-17',null),
('Buffy','Arnoldo','perro','f','1999-05-13',null),
('FanFan','Benito','perro','m','2000-08-27',null),
('Kaiser','Diana','perro','m','1998-08-31','1999-08-31'),
('Chispa','Omar','ave','f','1998-09-11',null),
('Wicho','Tomás','ave',null,'2000-02-09',null),
('Skim','Benito','Serpiente','m','2001-04-29',null);
insert into mascotas values
('Sara','Javi','perro','m','2001-01-01',null);
insert into mascotas values
('Bruto','Benito','perro','m','1997-02-01',null);
/*
cambia la fecha de nacimiento de kaiser a 1998-08-31
*/
UPDATE `mascotas`.`mascotas` SET `fechaNac` = '1998-08-30' WHERE (`nombre` = 'Kaiser') and (`dueno` = 'Diana');
/*
2.- D eseamos verificar el cambio que hicimos a la fecha de nacimiento de Kaiser
*/
SELECT * FROM mascotas WHERE nombre='Kaiser';
/*
3.- Deseamos conocer qué mascotas nacieron después del 2000.
*/
SELECT nombre from mascotas where fechaNac>'2000-01-01';
/*
4.- Deseamos conocer los nombres y los propietarios de las perras.
*/
SELECT nombre,dueno from mascotas where especie='perro' and sexo='f';
/*
5.- Deseamos conocer los nombres y los propietarios de las perras y las gatas.
*/
SELECT nombre,dueno from mascotas where (especie='perro' or especie='Gato') and sexo='f';
/*
6.- Deseamos conocer la fecha de nacimiento de nuestras mascotas.
*/
SELECT nombre,fechaNac from mascotas;
/*
7.- Conocer quién tiene alguna mascota.
*/
SELECT dueno,nombre from mascotas where fechaFac is null;
/*
8.- O btener la fecha de nacimiento de los perros y los gatos.
*/
select fechaNac,nombre from mascotas;
/*
9.- Nombre de las mascotas ordenadas por fecha de nacimiento
*/
select nombre from mascotas order by fechaNac;

/*
10.- Nombre de las mascotas ordenadas por fecha de nacimiento en orden inverso
*/
select nombre from mascotas order by fechaNac desc;
/*
11.- Nombre de las mascotas ordenadas por especie y fecha de nacimiento
en orden inverso.
*/
select nombre from mascotas order by especie and fechaNac desc;

/*
12.- Nombre de las mascotas cuyo cumpleaños es el próximo mes.
*/
select nombre from mascotas where month(fechaNac)=month(date_add(current_date(),interval 1 month));

/*
13.- Nombre de las mascotas que empiezan por B.
*/

select nombre from mascotas where nombre like 'b%';

/*
14.- Nombre de las mascotas que terminan por fy.
*/
select nombre from mascotas where nombre like'%fy';

/*
15.- Deseamos conocer cuántas mascotas tiene cada uno de los propietarios.
select dueno from mascotas group by dueno;
*/
select dueno, count(*) from mascotas group by dueno;
/*
16.- El número de animales por especie.
*/
select especie, count(*) from mascotas group by especie;
/*
17.- El número de animales por sexo.
*/
select sexo, count(*) from mascotas group by sexo;
/*
18.- El número de animalitos por combinación de especie y sexo.
*/
select especie, sexo, count(*) from mascotas group by sexo, especie;

/*
19.- Modifica la consulta anterior, para ver únicamente los datos de perros y gatos.
*/
select especie, sexo, count(*) from mascotas where especie= 'gato' or especie='Perro' group by sexo, especie;
/*
20.- Lista de las mascotas que han fallecido.
*/
select nombre from mascotas where fechaFac is not null;
-- 21 seleccionar aquel propietario que tiene mas mascotas
select dueno,count(*) from mascotas group by dueno order by count(*) desc limit 1;
-- 22 la edad de las mascotas que han fallecido
select nombre,fechaFac-fechaNac from mascotas where fechaFac is not null;
select nombre,TIMESTAMPDIFF(month, fechaNac,fechaFac) as anos_transcurridos from mascotas where fechaFac is not null;
-- arriba se puede poner month, day, year....
update mascotas set fechaFac='2000-05-13' where nombre='Kaiser';






