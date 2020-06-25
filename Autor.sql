create database Libros;

SHOW DATABASES;

use libros;

show tables;

create table libros(
	ISBN varchar(10) primary key,
    titulo varchar(50),
    autor varchar(20),
    editorial varchar(15),
    precio float,
    cantidad integer
);

describe libros;

select* from libros;

insert into libros (ISBN,titulo,autor,editorial,precio,cantidad)
	values (1,'El aleph','Borges','Emece',45.50,100);
insert into libros (ISBN,titulo,autor,editorial,precio,cantidad)
	values (2,'Alicia en le país de las maravillas','Lewis Carroll','Planeta',25,200);
insert into libros (ISBN,titulo,autor,editorial,precio,cantidad)
	values (3,'Matematica estas ahi','Paenza','Planeta',15.8,200);
    

create table autor(
codigo int primary key auto_increment,
nombre varchar(20) default 'Anonimo',
nacionalidad varchar(20)
);

insert into autor(nombre,nacionalidad)
	values('Artur','Español');
insert into autor(nombre,nacionalidad)
	values(default,'Español');
    
select* from autor;

describe autor;

create table escribe(
	ISBN varchar(10),
    codigo int,
    primary key(ISBN,codigo),
    nombre varchar(10),
    titulo varchar(50),
    editorial varchar(20)
);

alter table escribe
    add foreign key(codigo) references autor(codigo),
	add foreign key(ISBN) references libros(ISBN);

insert into escribe(ISBN,nombre,titulo,editorial)
	values(1,'Borges','El aleph','Emece');
insert into escribe(ISBN,nombre,titulo,editorial)
	values(2,'Paenza','Matematica estas ahi','Planeta');
    
select* from escribe;

describe escribe;
    