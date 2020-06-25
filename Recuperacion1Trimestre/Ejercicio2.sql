drop database if exists ejercicio2;
create database ejercicio2;
use ejercicio2;

create table medico(
	id_codigo int primary key,
    nombre varchar (50),
    apellidos varchar (50),
    horario varchar (50),
    sala varchar (50)
);

create table paciente(
	id_codigo int primary key,
    nombre varchar (50),
    apellidos varchar (50),
    NSS int,
    fecha_nacimiento date,
    id_codigo_medico int,
    foreign key (id_codigo_medico) references medico(id_codigo)
);

create table consulta(
	id_codigo int primary key,
    fecha date,
    sintomas varchar(50),
    diagnostico varchar(50),
    tratamiento varchar(50),
    f_siguiente varchar(50),
    baja_concedida varchar(50),
    alta_concedida varchar(50),
    id_paciente int,
    id_medico int,
    foreign key(id_paciente) references paciente(id_codigo),
    foreign key(id_medico) references medico(id_codigo)
);