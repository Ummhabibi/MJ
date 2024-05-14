-- Create Database
CREATE DATABASE Library;

-- Access the new Library Database

USE Library;

create table Books( 
book_id INT primary key,
book_title VARCHAR(30),
book_author VARCHAR(30),
publication_year INT,
ISBN VARCHAR(50),
author_id INT);

create table Authors(
author_id INT primary key,
author_name VARCHAR(30),
birth_year INT);


create table Publishers(
publisher_id INT primary key,
publisher_name VARCHAR(40),
country VARCHAR(50),
);





-- CHECK POINT PROJECT

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

-- Error Order Table
create table Orders(
order_id INT PRIMARY KEY,
customer_id INT CONSTRAINT const_cus FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
product_id INT CONSTRAINT const_prod FOREIGN KEY (product_id) REFERENCES product(product_id),
quantity INT,
order_date DATE,
);

DROP TABLE Orders

create table Orders(
order_id INT PRIMARY KEY,
customer_id INT FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
product_id INT FOREIGN KEY (product_id) REFERENCES product(product_id),
quantity INT,
order_date DATE,
);

--

CREATE DATABASE CHECK_POINT;

USE CHECK_POINT;

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
customer_id INT FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
product_id INT FOREIGN KEY (product_id) REFERENCES product(product_id),
quantity INT,
order_date DATE,
);
DROP TABLE Orders;