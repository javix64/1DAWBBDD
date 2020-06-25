drop database if exists ejercicio8;
create database ejercicio8;
use ejercicio8;

create table cancion(
	id_cancion int primary key,
	genero varchar(30),
    bitrate varchar(30),
    duracion int,
    fecha date,
    titulo varchar(30),
    autor varchar(30)
);
create table lista_de_reproduccion(
	id_nombre_lista int primary key,
	id_lista int,
    id_cancion int,
	foreign key(id_cancion) references cancion(id_cancion)
);
create table usuario(
	nick varchar(30) primary key,
	id_cancion int,
    id_lista int,
    nombre varchar(30),
    Apellido varchar(30),
    Email varchar(30),
    Password varchar(30),
    foreign key(id_cancion) references cancion(id_cancion),
    foreign key(id_lista) references lista_de_reproduccion(id_nombre_lista)
);