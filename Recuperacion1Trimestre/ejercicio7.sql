drop database if exists ejercicio7;
create database ejercicio7;
use ejercicio7;

create table persona(
	dni int primary key,
	nombre varchar(30),
    Apellido1 varchar(30),
    Apellido2 varchar(30),
    Estado_civil varchar(30)
);

create table archivador(
	codigo int primary key,
	Fila varchar(30),
    Estante varchar(30),
    numero varchar(30),
    capacidad varchar(30)
);
create table Documento_notarial(
	numero int primary key,
	año varchar(30),
    fecha date,
    tipo varchar(30),
    id_archivador int,
	foreign key(id_archivador) references archivador(codigo)
);

create table pagina_digitalizada(
	numero int primary key,
	archivo varchar(30),
    texto_completo varchar(30),
    id_documento_notarial int,
	foreign key(id_documento_notarial) references documento_notarial(numero)
);


create table participa(
	id_participa int primary key,
    id_persona int,
    id_documento_notarial int,
	foreign key(id_persona) references persona(dni),
	foreign key(id_documento_notarial) references documento_notarial(numero)
);