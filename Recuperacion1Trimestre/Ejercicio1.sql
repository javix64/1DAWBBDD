drop database if exists ejercicio1;
CREATE database ejercicio1;
use ejercicio1;

create table autor(
	cod_autor int primary key,
	nombre varchar (50)
);
create table libro(
	cod_libro int primary key,
    cod_autor int,
	titulo varchar (50),
    año date,
	foreign key(cod_autor) references autor(cod_autor)
);
create table tema(
	cod_tema int primary key,
	cod_libro int,
    descripcion varchar (50),
    foreign key(cod_libro) references libro(cod_libro)
);
create table idioma(
	cod_idioma int primary key,
    cod_libro int,
	descripcion varchar (50),
	foreign key(cod_libro) references libro(cod_libro)
);
create table socio(
	dni int primary key,
	nombre varchar (50),
    tlfno int
);
create table ejemplar(
	cod_ejemplar int primary key,
    cod_libro int,
    foreign key(cod_libro) references libro(cod_libro)
);
create table presta_ejemplar_socio(
	cod_presta int primary key,
	cod_ejemplar int,
    dni int,
    fecha_pre date,
    fecha_dev date,
    foreign key(dni) references socio(dni),
    foreign key(cod_ejemplar) references ejemplar(cod_ejemplar)
);

