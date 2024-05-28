
--DQL CHECKPOINT
--1. Implement the provided relation model using SQL ( DDL part )
USE CHECK_POINT;


create table Customer(
customer_id INT primary key,
customer_name VARCHAR(40),
customer_tel VARCHAR(70),
);


create table Product(
product_id INT primary key,
product_name VARCHAR(40),
category varchar (30),
price DECIMAL(12,2) CHECK (price>0),
);


create table Orders(
order_id INT PRIMARY KEY,
customer_id INT FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
product_id INT FOREIGN KEY (product_id) REFERENCES Product(product_id),
OrderDate DATE,
quantity INT,
total_amount DECIMAL (12,2)
);

--2.Insert data into your tables ( DML part )

INSERT INTO Customer (customer_id, customer_name, customer_tel) VALUES
(1, 'John Smith', '555-1234'),
(2, 'Jane Doe', '555-5678'),
(3, 'Bob Johnson', '555-8765'),
(4, 'Alice Brown', '555-4321'),
(5, 'Charlie Green', '555-9876'),
(6, 'Jack Sith', '555-1734'),
(7, 'Faye Doyle', '555-2678'),
(8, 'Rob Donald', '555-4765'),
(9, 'Pheobe Grey', '555-7321'),
(10, 'Chad Coppola', '555-3876');



INSERT INTO Product VALUES
(101, 'Smartphone', 'Gadget', 699.99),
(102, 'Laptop', 'Gadget', 999.99),
(103, 'Smartwatch', 'Gadget', 199.99),
(104, 'Bluetooth Speaker', 'Widget', 49.99),
(105, 'Wireless Charger', 'Widget', 29.99),
(106, 'Desk Lamp', 'Office', 39.99),
(107, 'Office Chair', 'Office', 129.99),
(108, 'Coffee Machine', 'Kitchen', 89.99),
(109, 'Blender', 'Kitchen', 59.99),
(110, 'Toaster', 'Kitchen', 19.99),
(301, 'Multifunctional Keychain Tool', 'Doohickey', 12.99),
(302, 'Pocket-Sized Screwdriver Set', 'Doohickey', 9.49),
(303, 'Mini Flashlight', 'Doohickey', 7.99);

INSERT INTO Orders VALUES
(1, 1, 101, '2024-01-15', 1, 699.99),
(2, 2, 105, '2024-02-20', 2, 59.98),
(3, 3, 108, '2024-03-05', 1, 89.99),
(4, 4, 104, '2024-04-10', 3, 149.97),
(5, 5, 102, '2024-05-23', 1, 999.99),
(6, 6, 301, '2024-01-15', 1, 12.99),
(7, 7, 302, '2024-02-20', 2, 18.96),
(8, 8, 108, '2024-03-05', 1, 89.99),
(9, 9, 303, '2024-04-10', 3, 23.97),
(10,10, 102, '2024-05-23', 1, 999.99);

--3.Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product.

	WITH Widget_Orders AS (
    SELECT DISTINCT o.customer_id
    FROM Orders o
    JOIN Product p ON o.product_id = p.product_id
    WHERE p.category = 'Widget'
),
Gadget_Orders AS (
    SELECT DISTINCT o.customer_id
    FROM Orders o
    JOIN Product p ON o.product_id = p.product_id
    WHERE p.category = 'Gadget'
),
Customers_With_Both AS (
    SELECT wo.customer_id
    FROM Widget_Orders wo
    JOIN Gadget_Orders go ON wo.customer_id = go.customer_id
)
SELECT
    c.customer_name,
    SUM(CASE WHEN p.category = 'Widget' THEN o.quantity * p.price ELSE 0 END) AS Total_Widget_Cost,
    SUM(CASE WHEN p.category = 'Gadget' THEN o.quantity * p.price ELSE 0 END) AS Total_Gadget_Cost,
    SUM(CASE WHEN p.category IN ('Widget', 'Gadget') THEN o.quantity * p.price ELSE 0 END) AS Total_Cost
FROM
    Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
    JOIN Customers_With_Both cb ON c.customer_id = cb.customer_id
GROUP BY
    c.customer_name
HAVING
    SUM(CASE WHEN p.category = 'Widget' THEN o.quantity * p.price ELSE 0 END) > 0
    AND SUM(CASE WHEN p.category = 'Gadget' THEN o.quantity * p.price ELSE 0 END) > 0;

--4.Write a query to retrieve the names of the customers who have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer.

SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS TotalWidgetCost
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
WHERE
    p.category = 'Widget'
GROUP BY
    c.customer_name
HAVING
    SUM(o.quantity * p.price) > 0;


--5.Write a query to retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.

SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS TotalGadgetCost
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
WHERE
    p.category = 'Gadget'
GROUP BY
    c.customer_name
HAVING
    SUM(o.quantity * p.price) > 0;

--6.Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.

SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS Total_Doohickey_Cost
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
WHERE
    p.category = 'Doohickey'
GROUP BY
    c.customer_name
HAVING
    SUM(o.quantity * p.price) > 0;


--7.Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.

SELECT
    c.customer_name,
    SUM(CASE WHEN p.category = 'Widget' THEN o.quantity ELSE 0 END) AS Total_Widgets,
    SUM(CASE WHEN p.category = 'Gadget' THEN o.quantity ELSE 0 END) AS Total_Gadgets,
    SUM(CASE WHEN p.category IN ('Widget', 'Gadget') THEN o.quantity * p.price ELSE 0 END) AS TotalCost
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
GROUP BY
    c.customer_name
HAVING
    SUM(CASE WHEN p.category IN ('Widget', 'Gadget') THEN o.quantity ELSE 0 END) > 0;

--8.Write a query to retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.

SELECT
    p.product_name,
    SUM(o.quantity) AS Total_Quantity_Ordered
FROM
    Product p
    JOIN Orders o ON p.product_id = o.product_id
GROUP BY
    p.product_name
HAVING
    SUM(o.quantity) > 0;

--9.Write a query to retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.

SELECT TOP 1
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name
ORDER BY
    Total_Orders DESC;

--10.Write a query to retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.

SELECT
    p.product_name,
    SUM(o.quantity) AS Total_Quantity_Ordered
FROM
    Product p
    JOIN Orders o ON p.product_id = o.product_id
GROUP BY
    p.product_name
ORDER BY
    Total_Quantity_Ordered DESC;

--11.Write a query to retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.

SELECT
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders
FROM
    Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name
HAVING
    COUNT(DISTINCT DATEPART(weekday, o.OrderDate)) = 7;
	
