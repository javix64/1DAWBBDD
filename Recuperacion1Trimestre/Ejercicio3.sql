drop database if exists ejercicio3;
create database ejercicio3;
use ejercicio3;

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

create table visitar(
	id_visita int primary key,
    alta_concedida date,
    baja_concedida date,
    f_siguiente date,
    fecha date,
    tratamiento varchar (50),
    sintomas varchar (50),
    diagnostico varchar (50),
	id_codigo_medico int,
    id_codigo_paciente int,
    foreign key (id_codigo_medico) references medico(id_codigo),
    foreign key (id_codigo_paciente) references paciente(id_codigo)
);