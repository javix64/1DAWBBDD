drop database if exists FriendsAnimals;
create database FriendsAnimals;

use FriendsAnimals;
create table product(
	id_code int primary key,
	status varchar(20), -- si esta disponible, no disponible o temporalmente no disponible
	name varchar(20),
	origin varchar(20),
	price int,
	color varchar(20),
	size varchar(20)
);

create table user(
	Nie int primary key,
	Email varchar(40),
	name varchar(10),
	surname varchar(20),
	address varchar(20),
	phone int,
	password varchar(20)
);
create table animal(
	chip_number int primary key,
	adoptionOrBooking varchar(20),
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20),
	price int,
	Availability boolean,
	dates date
);
create table orders(
	id_order int primary key,
    Store_Delivery varchar(50),
    Delivery varchar(20),
    customer_info varchar(15),
    order_date date,
    totalCost int,
    id_code int,
    foreign key(id_code) references product(id_code)
);
create table customer(
	id_user int primary key,
	credit_card int,
	id_order int ,
	foreign key(id_order) references orders(id_order),
	foreign key (id_user) references user(Nie)
);
create table booking(
	id_booking int primary key,
	chip_number int,
	id_customer int,
	foreign key(id_customer) references customer(id_user),
	foreign key(chip_number) references animal(chip_number)
);
create table adoptions(
	id_adoptions int primary key,
	chip_number int,
	foreign key(chip_number) references animal(chip_number)
);



create table partner(
	id_user int primary key,
	id_partner int,
	foreign key (id_user) references user(Nie)
);

create table adopter(
	id_user int primary key,
	id_adoptions int,
	foreign key (id_adoptions) references adoptions(id_adoptions),
	foreign key (id_user) references user(Nie)

);

create table collaborator(
	id_user int primary key,
	moneyAmount int,
	monthly_yearly varchar(8),
	
	
	foreign key (id_user) references user(Nie)
);
create table volunteer(
	id_user int primary key,

	foreign key (id_user) references user(Nie)
);
create table host(
	id_host int primary key,
	id_volunteer int,
	foreign key (id_volunteer) references volunteer(id_user)
	
);
create table cleaner(
	id_cleaner int primary key,
	id_volunteer int,
	foreign key (id_volunteer) references volunteer(id_user)
	
);







-- corregir available, temporaly not availiable, out of stock
-- y ponerlo dentro de un campo, con numeros o string

-- una sola tabla que sea animal
-- que tenga los mismos campos de reservation y adoptions
-- poner price
-- 

/*
create table reservation(
	chip_number int primary key,
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20)
);
create table adoption(
	chip_number int primary key,
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20)
);
 */

/*
 * meter tablas
create table(
);
me falta por poner:
customer
volunteer
collaborator
adopter
partner
 * */
