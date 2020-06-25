drop database if exists ejercicio4;
create database ejercicio4;
use ejercicio4;

create table revista(
	id_codigo int primary key,
    titulo varchar (50),
    periodicidad varchar (50),
    editorial varchar (50)
);

create table numero(
	id_codigo int primary key,
    numero int,
    id_revista int,
    foreign key(id_revista) references revista(id_codigo)
);
create table articulo(
	id_codigo int primary key,
    titulo varchar(50),
    pdf boolean,
    pag_inicio int,
    pag_fin int,
    id_numero int,
    foreign key(id_numero) references numero(id_codigo)
);
create table pagina_digitalizada(
	id_codigo int primary key,
    texto_completo varchar(50),
    imagen boolean,
    id_articulo int,
    foreign key(id_articulo) references articulo(id_codigo)
);
create table autor(
	id_codigo int primary key,
    nombre varchar(50)
);
create table descriptor(
	texto int primary key
);
create table articulo_escrito_autor(
	id_articulo_escrito_autor int primary key,
    id_autor int,
    id_articulo int,
	foreign key(id_autor) references autor(id_codigo),
    foreign key(id_articulo) references articulo(id_codigo)
);
create table articulo_compuesto_descriptor(
	id_articulo_compuesto_descriptor int primary key,
    id_articulo int,
    id_descriptor int,
	foreign key(id_descriptor) references descriptor(texto),
    foreign key(id_articulo) references articulo(id_codigo)
);
create table seudonimo(
	id_codigo int primary key,
    nombre varchar(50),
    id_autor int,
    foreign key(id_autor) references autor(id_codigo)
);