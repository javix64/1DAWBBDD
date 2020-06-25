drop database if exists ejercicio6;
create database ejercicio6;
use ejercicio6;

create table titulo_de_propiedad(
	codigo int primary key,
	tipo varchar(30)
);

create table parcela(
	numero int primary key,
	tipo varchar (30),
	superficie varchar (30),
    id_titulo_de_propiedad int,
	foreign key(id_titulo_de_propiedad) references titulo_de_propiedad(codigo)
);
create table pagina_digitalizada(
	codigo int primary key,
	imagen varchar (30),
	texto_completo varchar (30),
    id_titulo_de_propiedad int,
	foreign key(id_titulo_de_propiedad) references titulo_de_propiedad(codigo)
);

create table propietario(
	DNI int primary key,
	Nombre varchar (30),
	Apellido1 varchar (30),
	Apellido2 varchar (50),
	Estado_civil varchar (20)
);

create table propietario_posee(
	id_posee int primary key,
    dni_propietario int,
    codigo_titulo_de_propiedad int,
    foreign key(dni_propietario) references propietario(dni),
	foreign key(codigo_titulo_de_propiedad) references titulo_de_propiedad(codigo)
);