create database GMCode;
USE GMCode;

create table Customers(
customer_id INT primary key,
customer_name VARCHAR(40),
customer_address VARCHAR(70),
);


create table Products(
product_id INT primary key,
product_name VARCHAR(40),
product_price DECIMAL(4,2) CHECK (product_price>0),
);

create table Orders(
order_id INT PRIMARY KEY,
customer_id INT FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
product_id INT FOREIGN KEY (product_id) REFERENCES products(product_id),
quantity INT,
order_date DATE,


DROP TABLE Orders;
order_date DATE,
);

--CHECK POINT SQL DML QUERIES - INSERT
use GMCode;
insert into Products values (1, 'Cookies', 10.00);
insert into Products values (2, 'Candy', 5.20);

insert into Customers values (1,'Ahmed', 'Tunisia');
insert into Customers values (2, 'Coulibaly', 'Senegal');
insert into Customers values (3, 'Hasan', 'Egypt');

insert into Orders values (1, 1, 2, 3, '2023-01-22');
insert into Orders values (2, 2, 1, 10, '2023-04-14');

--UDATE QUERRY

update Orders set quantity = 6  where order_id = 2;

-- DELETE QUERRY

delete from Customers where customer_id = 3;

delete from Orders;

drop table Orders;
