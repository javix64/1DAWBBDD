CREATE TABLE warehouses
(Code INTEGER NOT NULL,
Location VARCHAR2(255)NOT NULL,
Capacity INTEGER NOT NULL,
PRIMARY KEY(Code));

CREATE TABLE Boxes(
Code VARCHAR2(255) NOT NULL,
Contents VARCHAR2(255)NOT NULL,
Value REAL NOT NULL,
Warehouse INTEGER NOT NULL,
PRIMARY KEY(Code),
FOREIGN KEY(Warehouse)
REFERENCES Warehouses(Code));

INSERT INTO Warehouses (Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity)VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity)VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity)VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity)VALUES(5,'San Francisco',8);

INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES ('0MN7','Rocks',180,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('4H8P','Rocks',250,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('4RT3','Scissors',190,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('7G3H','Rocks',200,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('8Y6U','Papers',50,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('9J6F','Papers',175,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('LL08','Rocks',140,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('P0H6','Scissors',125,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('P2T6','Scissors',150,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse)VALUES('TU55','Papers',90,5);

--1.-Select all warehouses.
select * from warehouses;

--2.-Select all boxes with a value larger than $150.
select distinct contents,code 
from boxes 
where Value>=150;

--3.-Select all distinct contents in all the boxes.
select distinct contents 
from boxes;

--4.-Select the average value of all the boxes.
select avg(value) 
from boxes;

--5.-Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse,avg(value) 
from boxes 
group by warehouse;

--6.-Same as previous exercise, but select only those warehouses where the average value of the boxes 
--is greater than 150.
select warehouse,avg(value) 
from boxes 
group by warehouse 
having avg(value)>=150;

--7.-Select the code of each box, along with the name of the city the box is located in.
SELECT Boxes.Code, Location
FROM Warehouses
INNER JOIN Boxes 
ON Warehouses.Code = Boxes.Warehouse;

--8.-Select the warehouse codes, along with the number of boxes in each warehouse. 
--Optionally, take into account that some warehouses are empty 
--(i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
select warehouse, count(*)
from boxes
group by warehouse;
            --otra manera
select warehouses.code, count(boxes.code)
from warehouses left join boxes
on warehouses.code= boxes.warehouse
group by warehouses.code;

--9.-Select the codes of all warehouses that are saturated 
--(a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select code, capacity from warehouses,
(select warehouse, count(*) as cantidad
from boxes group by warehouse) b
where warehouses.code=b.warehouse 
and cantidad>=capacity
group by code, capacity;

select code, capacity from warehouses
where capacity<=
(select count(*) from boxes
where warehouse=warehouses.code);
--10.-Select the codes of all the boxes located in Chicago.



--11.-Create a new warehouse in New York with a capacity for 3 boxes.
insert into warehouses values(7,'New York',3);

--12.-Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into boxes values('H5RT','PAPERS',200,2)

--13.-Reduce the value of all boxes by 15%.


--14.-Apply a 20% value reduction to boxes with a value larger than the average value of all the boxes.


--15.-Remove all boxes with a value lower than $100.


--16.-Remove all boxes from saturated warehouses.

