drop database if exists FriendsAnimalsALLV2;
create database FriendsAnimalsALLV2;
/*
 * usarios voluntarios, colaboradores
usuarios adopciones
animal booking
animal adoptions
 */
use FriendsAnimalsALLV2;
create table product(
	id_code int primary key,
	status varchar(20), -- si esta disponible, no disponible o temporalmente no disponible
	name varchar(20),
	origin varchar(20),
	price int,
	color varchar(20),
	size varchar(20)
);

/*
tipos de usuario:
	partner
	adopter
	host
	cleaner
	customer
	collaborator
 */
create table user_customer(
	Nie_customer int primary key,
	Email varchar(40),
	name varchar(10),
	surname varchar(20),
	address varchar(20),
	phone int,
	password varchar(20),
	credit_card int
);

create table user_other(
	Nie_other int primary key,
	Rol varchar(15),
	Email varchar(40),
	name varchar(10),
	surname varchar(20),
	address varchar(20),
	phone int,
	password varchar(20),
	money_Amount int,
	monthly_yearly int,
	house_type varchar(20),
	pets_In_House boolean
);



/*
availability
dates
en animal para hacer la tabla intermedia
 */

create table animal_adoption(
	chip_number int primary key,
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20),
	price int,
	Availability boolean,
	dates date,-- chip number y fechas alojado entrada y fin
	foreign key(chip_number) references user_other(nie_other)
);
create table animal_booking(
	chip_number int primary key,
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20),
	price int,
	Availability boolean,
	dates date,-- chip number y fechas alojado entrada y fin
	foreign key(chip_number) references user_customer(nie_customer)
);
create table orders(
	id_order int primary key,
    Store_Delivery varchar(50),
    Delivery varchar(20),
    customer_info varchar(15),
    order_date date,
    totalCost int,
    foreign key(id_order) references user_customer(nie_customer)
);
create table orders_customer(
	id_all int primary key,
	id_order int,
	id_product int,
	foreign key(id_order) references orders(id_order),
	foreign key(id_product) references product(id_code)
);



-- corregir available, temporaly not availiable, out of stock
-- y ponerlo dentro de un campo, con numeros o string

-- una sola tabla que sea animal
-- que tenga los mismos campos de reservation y adoptions
-- poner price
-- 