CREATE DATABASE Kontakt
USE Kontakt

Create table Cart
Id int primary key identity,
ProductId int foreign key references Product(Id);

Create table Product(
Id int primary key identity,
Name varchar(255),
Cost int,
SalePrice int,
CategoryId int)

Select * from Product

Alter table Product
drop column CategoryId

Alter table Product
add CategoryId int foreign key references Category(Id)

Create table Category(
Id int primary key identity,
Name varchar(255));

select * from Cart

select * from Product

select * from Category

Insert into Category
Values( 'Smartfon'),
('Tablet');
select* From Category

Insert into Product
Values(  'Samsung' , 550, 950, 2),
( 'Samsung' , 890, 1100, 1),
('Nokia' , 120, 250, 1),
('Nokia' , 457, 700, 1),
('Samsung' , 990, 1567, 2),
('Apple' , 1500, 1900, 2),
('Apple' , 2000, 2900, 1),
('Lg' , 400, 550, 1),
('Sonny' , 250, 450, 2),
( 'Xiomi' , 789, 1400, 1);

select*from Product

Insert into Cart
values (1)

select* from Cart

Insert into Cart
values (3)

Insert into Cart
values (9)

Insert into Cart
values (5)

Insert into Cart
values (8)

select * from Cart

select * from Product

select * from Category

select * from Cart
Join Product on Cart.ProductId =.Product.Id