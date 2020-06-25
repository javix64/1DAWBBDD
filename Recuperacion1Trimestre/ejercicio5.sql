drop database if exists ejercicio5;
CREATE database ejercicio5;
use ejercicio5;

create table relacion_de_sucesos(
	codigo int primary key,
	año date,
	lugar varchar (30),
	titulo varchar (30),
	autor varchar (50),
	tipo varchar (20),
	modalidad varchar (20)
);

create table edicion(
	codigo int primary key,
	año date,
	lugar varchar (30),
	tamaño int,
	impresor varchar (50),
	num_hojas int,
	id_sucesos int,
	foreign key(id_sucesos) references relacion_de_sucesos(codigo)
);



create table biblioteca(
	codigo int primary key,
	nombre varchar (30),
	direccion varchar (30),
	pais varchar(20),
	telefono int
);

create table investigador(
	dni int primary key,
	nombre varchar (30)
);

create table ejemplar(
	codigo int primary key,
	signatura varchar (30),
	estado varchar (30),
	pag_inicio int,
	pag_fin int,
	id_edicion int,
	id_biblioteca int,
	id_investigador int,
	foreign key(id_edicion) references edicion(codigo),
	foreign key(id_biblioteca) references biblioteca(codigo),
	foreign key(id_investigador) references investigador(dni)
);

create table pag_digitalizada(
	codigo int primary key,
	texto_completo varchar (30),
	imagen varchar (30),
	id_ejemplar int,
	foreign key(id_ejemplar) references ejemplar(codigo)
);