drop database if exists FriendsAnimalsALLV3;
create database FriendsAnimalsALLV3;

use FriendsAnimalsALLV3;

/*
/////////////////////////////////////////////////////////////////////////
------------------------CREATE TABLES------------------------------------
/////////////////////////////////////////////////////////////////////////
*/


create table product(
	id_code int primary key,
	status varchar(20),
	name varchar(20),
	origin varchar(20),
	price double,
	color varchar(20),
	size varchar(20)
);

create table user(
	Nie int primary key,
	Rol varchar(15),
	Email varchar(40),
	name varchar(10),
	surname varchar(20),
	address varchar(60),
	phone int,
	password varchar(20),
	credit_card bigint,
	money_Amount int,
	monthly_yearly varchar(20),
	house_type varchar(20),
	pets_In_House boolean
);

create table animal(
	chip_number bigint primary key,
	name varchar(20),
	sex varchar(10),
	size varchar(20),
	raze varchar(20),
	birthday date,
	illness varchar(20),
	behaviour varchar(20),
	price int
);

create table adoption_animals(
	id_adoption int primary key,
	id_nie int,
	id_chip bigint,
	foreign key(id_nie) references user(nie) on delete cascade,
	foreign key(id_chip) references animal(chip_number) on delete cascade
);

create table booking_animals(
	id_date int primary key,
	id_nie int,
	id_chip bigint,
	Availability boolean,
	entry_dates date,
	departure_dates date,
	foreign key(id_nie) references user(nie) on delete cascade,
	foreign key(id_chip) references animal(chip_number) on delete cascade
);

create table orders(
	id_order int primary key,
    Store_Delivery varchar(50),
    Delivery varchar(20),
    customer_info varchar(15),
    order_date date,
    totalCost double,
    nie_order int,
    foreign key(nie_order) references user(nie) on delete cascade
);

create table orders_customer(
	id_all int primary key,
	id_order int,
	id_product int,
	foreign key(id_order) references orders(id_order) on delete cascade,
	foreign key(id_product) references product(id_code) on delete cascade
);


/*
/////////////////////////////////////////////////////////////////////////
----------------------------INSERTS--------------------------------------
/////////////////////////////////////////////////////////////////////////
*/

insert into user values (11223344, 'Partner', 'Julio@gmail.com', 'Julio', 'Garcia', 'Avenida Cervantes 13, 3B', 666223344, 'helloworld22', 1122334455667788, null, null, null, false),
(22334411, 'Host', 'Manolo@gmail.com', 'Manolo', 'Garcia', 'Pedro Antonio de Alarcon, 12 2A', 699112233, 'mynameismanolo', 2122113388559922, null, null, 'Piso', false),
(87065641, 'Host', 'Juanjo@gmail.com', 'Juanjo', 'Izquierda', 'C/ Hoya de la Mora 22, 1C', 677228192, 'imprettygood', 2299851206215232, null, null, 'Chalet', true),
(69286196, 'Adopter', 'Pepe@gmail.com', 'Pepe', 'Gomez', 'C/ Lavadero de la Reina, 3B', 666223344, 'badtothebone', 4269825171237186, null, null, null, null),
(90125283, 'Collaborator', 'Jackson@gmail.com', 'Jackson', 'White', 'Gran Via 1, 3B', 666223344, '3dprinterishard', 3468244627146687, 10, 'Monthly', null, null),
(76248511, 'Collaborator', 'Javi@gmail.com', 'Javi', 'Cruz', 'C/ Sancho Panza 2, 7D', 682601223, 'imnotalawyer', 2475809726234700, 3000, 'Yearly', null, null),
(86192601, 'Customer', 'Lucio@gmail.com', 'Lucio', 'Garrido', 'C/ Don Juan, 1A', 681269012, 'lucioisthebest', 2058613082167689, null, null, null, null),
(16394202, 'Customer', 'Loreto@yahoo.com', 'Loreto', 'Santiago', 'Avenida Andalucia 50, 3A', 611922049, 'scannerisnotbad', 3569832094734113, null, null, null, null),
(32627512, 'Cleaner', 'Ataulfo@yahoo.com', 'Ataulfo', 'Colvin', 'Avenida Madrid 16, 2B', 698081226, 'iloveyoumelissa', 2496780593293777, null, null, null, null),
(14785930, 'Partner', 'David@yahoo.com', 'David', 'Medina', 'Camino de Ronda 13, 3B', 698082370, 'strangerthings', 7860835820971342, null, null, null, null);

insert into animal values (112233335566778, 'Bruto', 'Male', '80 cm', 'Half Blood', '2013-9-25', null, 'Quiet', null),
(965829374819634, 'Charlie', 'Male', '20 cm', 'Golden Retriever', '2013-9-25', 'Rabia', 'Quiet', 60),
(429671906438217, 'Max', 'Male', '50 cm', 'Rottweiler', '2013-9-25', 'Leishmaniosis', 'Quiet', null),
(358792507430912, 'Buddy', 'Male', '60 cm', 'Akita Inu', '2013-9-25', null, 'aggressive', 110),
(857290723621146, 'Milo', 'Male', '50 cm', 'Bull Dog', '2013-9-25', null, 'aggressive', null),
(790248593107192, 'Bella', 'Female', '20 cm', 'Beagle', '2013-9-25', 'Moquillo', 'aggressive', null),
(357823070936136, 'Lucy', 'Female', '90 cm', 'Pit Bull', '2013-9-25', 'Mastitis', 'restless', 80),
(782490578361671, 'Lola', 'Female', '70 cm', 'Shiba inu', '2013-9-25', 'Conjuntivitis', 'restless', 100),
(578752049584912, 'Rosie', 'Female', '60 cm', 'Doberman', '2013-9-25', null, 'shy', 150),
(996479574982117, 'Ruby', 'Female', '20 cm', 'Yorkshire Terrier', '2013-9-25', null, 'shy', null),
(996479574982116, 'Deisy', 'Female', '30 cm', 'Yorkshire Terrier', '2012-9-25', null, 'shy', 123),
(996479574982115, 'Rubia', 'Female', '24 cm', 'Yorkshire Terrier', '2011-9-25', null, 'scary', 89),
(996479574982114, 'Espe', 'Female', '21 cm', 'Yorkshire Terrier', '2016-9-25', null, 'scary', null),
(996479574982124, 'Mesti', 'Female', '21 cm', 'Yorkshire Terrier', '2016-9-25', null, 'scary', null),
(996479574982122, 'Mira', 'Female', '21 cm', 'Yorkshire Terrier', '2016-9-25', null, 'restless', null);

insert into adoption_animals values (1, 11223344, 965829374819634),
(2, 22334411, 358792507430912),
(3, 87065641, 357823070936136),
(4, 69286196, 782490578361671),
(5, 69286196, 996479574982115),
(6, 90125283, 578752049584912),
(7, 90125283, 996479574982116);


insert into booking_animals values (1, 76248511, 112233335566778,true,'2020-1-01','2020-1-12'),
(2, 86192601, 429671906438217,true,'2020-1-22','2020-1-25'),
(3, 16394202, 857290723621146,true,'2020-2-10','2020-2-20'),
(4, 32627512, 790248593107192,true,'2020-3-1','2020-3-30'),
(5, 14785930, 996479574982117,true,'2020-4-5','2020-4-13'),
(6, 14785930, 996479574982114,true,'2020-4-5','2020-4-13'),
(7, 32627512, 996479574982124,true,'2020-4-5','2020-4-13'),
(8, 14785930, 996479574982122,true,'2020-4-5','2020-4-13'),
(9, 16394202, 857290723621146,true,'2020-2-10','2020-2-20');

insert into product values(5789,"available","dog's coat","china",19.99,"red","L");
insert into product values(5790,"available","cat's cage","germany",35.99,"grew",null);
insert into product values(5791,"unnavailable","dog's harnesses","china",9.99,"black","S");
insert into product values(5792,"available","dog's leads","china",12.49,"black/red",null);
insert into product values(5793,"available","cat's bed","germany",19.99,"red","M");
insert into product values(5794,"available","puppys's food 12Kg","Spain",29.99,null,null);
insert into product values(5795,"unnavailable","pet's gates","china",19.99,"white",null);
insert into product values(5796,"available","dog's bowls","china",6.49,"red",null);

insert into orders values(48459,"Your Best Friend","delivered",null,'20-04-05',26.48,69286196);
insert into orders values(79977,"Daily Pets","delivered",null,'20-02-02',19.99,69286196);
insert into orders values(57745,"Whiskas","detpached","Is a volunteer",'20-03-15',62.47,22334411);
insert into orders values(49777,"Whiskas","delivered",null,'20-01-20',35.99,90125283);
insert into orders values(25896,"Animal World","ready for delivery",null,'20-05-05',70.20,32627512);
insert into orders values(98665,"Your Pet","delivered","Is a volunteer",'20-03-30',12.49,14785930);
insert into orders values(74541,"Daily Pets","detpached",null,'20-02-10',69.98,87065641);

insert into orders_customer values(78965,79977,5789);
insert into orders_customer values(78887,48459,5795);
insert into orders_customer values(78886,48459,5796);
insert into orders_customer values(74489,57745,5792);
insert into orders_customer values(74490,57745,5793);
insert into orders_customer values(74491,57745,5794);
insert into orders_customer values(45465,49777,5790);
insert into orders_customer values(47896,25896,5796);
insert into orders_customer values(74477,98665,5792);
insert into orders_customer values(71119,74541,5790);
insert into orders_customer values(71120,74541,5790);

/*
/////////////////////////////////////////////////////////////////////////
-------------------------UPDATES & DELETE--------------------------------
/////////////////////////////////////////////////////////////////////////
*/
update user set surname="Lobezno" where nie=90125283;
update user set Email="Juanjo@yahoo.com" where nie=87065641;
update user set phone=677228192 where nie=87065641;

update animal set raze="Doberman" where chip_number=996479574982116;
update animal set price=300 where chip_number=965829374819634;
update animal set name="Thor" where chip_number=996479574982124;

update adoption_animals set id_nie="90125283" where id_adoption=2;
update adoption_animals set id_nie="69286196" where id_adoption=3;

update booking_animals set availability=false where id_date=4;
update booking_animals set departure_dates='2020-6-20' where id_date=5;

update orders set delivery="delivered" where id_order=74541 ;
update orders set customer_info="Is a volunteer" where nie_order=87065641 ;
update orders set store_delivery="Whiskas" where id_order=74541 ;

update product set price=6.99 where name ="dog's bowls";
update product set color="blue" where name ="dog's bowls";
update product set size="M" where name = "dog's coat";

delete from adoption_animals where id_adoption=2;
delete from animal where chip_number=358792507430912;

delete from booking_animals where id_date=2;
delete from booking_animals where id_date=3;

delete from adoption_animals where id_adoption=1;
delete from user where nie=11223344;

delete from orders_customer where id_all=78887;
delete from product where name ="pet's gates";

delete from orders_customer where id_all=78965; 
delete from product where name ="dog's coat";


/*
/////////////////////////////////////////////////////////////////////////
----------------------------SELECTS--------------------------------------
/////////////////////////////////////////////////////////////////////////
*/

-- select the names of the people who have left their dog for booking
select us.name,an.name from 
user as us, animal as an,booking_animals as boa where 
boa.id_nie=us.nie and boa.id_chip=an.chip_number;

-- select the names of people who have adopted a dog
select us.name,an.name from 
user as us, animal as an,adoption_animals as boa where 
boa.id_nie=us.nie and boa.id_chip=an.chip_number
order by us.name asc;

-- select the names of people who have left for booking more than two or more dogs
select us.name,an.name,count(*) as 'Booking animals' from
user as us, animal as an,booking_animals as boa where 
boa.id_nie=us.nie and boa.id_chip=an.chip_number
group by boa.id_nie having count(*)>=2;

-- do a count to see how many people have left more dogs in order
select us.name,an.name,count(*) as 'Booking_animals' from
user as us, animal as an,booking_animals as boa where 
boa.id_nie=us.nie and boa.id_chip=an.chip_number
group by boa.id_nie;

-- Knowing which user makes payments and how much
select name,money_amount from user where money_amount is not null order by money_amount desc;

-- how to know which user has a chalet
select name,house_type from user where house_type="chalet";

-- how to know users that their name begins with L
select name from user where name LIKE 'L%';

-- select the email that are from yahoo
select email from user where email like '%@yahoo.com';

-- how to know what role the users have and what animals have left
select name,rol from user;

-- how to know that dogs were born in 2013
select name,birthday from animal where birthday between "2013-01-01" and "2013-12-31";

-- how to know the dogs that have names beginning with M
select name from animal where name LIKE 'M%';

-- how to know the biggest dog and sort it out
select name,size from animal order by size desc;

-- how to know that dogs have a disease
select name,illness from animal where illness is not null;

-- how to know what behaviour dogs have
select name,behaviour from animal;

-- how to know what dogs were left behind in 2020
select us.name,an.name,boa.entry_dates from 
user as us, animal as an, booking_animals as boa where 
boa.entry_dates>="2020-1-1" and 
boa.entry_dates<="2020-12-30";

-- select which dog and its owner has been in reserve the longest
select us.name,an.name,datediff(boa.departure_dates,boa.entry_dates) as 'Duration' from 
user as us, animal as an, booking_animals as boa where
boa.id_chip=an.chip_number and 
boa.id_nie=us.nie 
order by duration desc;

-- select the customer who made the most expensive order
select user.name from orders,user  where user.nie=orders.nie_order and orders.order_date between '20-02-10' and '20-04-10' ;

-- Select the user who made the most expensive order
select user.name,max(totalCost) from orders,user  where user.nie=orders.nie_order  ;

-- Select all the shops where customers made an order
select distinct Store_Delivery from orders;

-- Select the total amount of the all orders
select sum(totalCost) from orders;

-- Select all the products wich have been delivered
select product.name from product,orders,orders_customer where 
product.id_code=orders_customer.id_product
and orders_customer.id_order=orders.id_order and Delivery="delivered";

 -- Select all customers who bought something in Whiskas 
 select distinct user.name from orders,user  where user.nie=orders.nie_order
 and Store_delivery="Whiskas" ;
 
 -- Select all customers who bought something in China 
 select user.name from user,product,orders,orders_customer where 
 user.nie=orders.nie_order and product.id_code=orders_customer.id_product
 and orders_customer.id_order=orders.id_order and product.origin="germany";
 
 -- Select all product wich came from China
 select distinct product.name from product,orders,orders_customer  where product.id_code=orders_customer.id_product
 and orders_customer.id_order=orders.id_order and product.origin="china";
 
 -- select the cheapest product
 select product.name,min(price) from product;
 
 -- select all products wich are not available
 select product.name from product where status="unnavailable";
 
 -- select the size of the dog's coat
 select size from product where product.name ="dog's coat";
 
 -- select the color of the cat's cage
 select color from product where product.name ="cat's cage";

-- select the date where the puppys's food 12Kg was ordered
select order_date from product,orders,orders_customer  where product.id_code=orders_customer.id_product
and orders_customer.id_order=orders.id_order and product.name="puppys's food 12Kg";
 
 -- select the number of orders who made all customers 
select user.name,count(orders_customer.id_order) from user,product,orders,orders_customer where 
user.nie=orders.nie_order and 
product.id_code=orders_customer.id_product
and orders_customer.id_order=orders.id_order group by user.name;