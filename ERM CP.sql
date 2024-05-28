use CHECK_POINT;

--1. Convert the given entity-relationship diagram into a relational model.

wine(NumW, Category, Year, Degree)
Primary Key: NumW
producer(NumP, FirstName, LastName, Region)
Primary Key: NumP
harvest(#NumW, #NumP, Quantity)

--2. Implement the relational model using SQL.

CREATE TABLE wine (
    NumW INT PRIMARY KEY,
    Category VARCHAR(255),
    Year INT,
    Degree DECIMAL(4, 2)
);

CREATE TABLE producer (
    NumP INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Region VARCHAR(255)
);

CREATE TABLE harvest (
    NumW INT,
    NumP INT,
    Quantity DECIMAL(10, 2),
    PRIMARY KEY (NumW, NumP),
    FOREIGN KEY (NumW) REFERENCES wine(NumW),
    FOREIGN KEY (NumP) REFERENCES producer(NumP)
);

--3. Insert data into the database tables.

INSERT INTO wine (NumW, Category, Year, Degree) VALUES
(1, 'Red', 2020, 13.5),
(2, 'White', 2021, 12.0),
(3, 'Rose', 2019, 11.5);

INSERT INTO producer (NumP, FirstName, LastName, Region) VALUES
(10, 'John', 'Doe', 'Sousse'),
(11, 'Jane', 'Smith', 'Sousse'),
(12, 'Mark', 'Brown', 'Tunis');

INSERT INTO harvest (NumW, NumP, Quantity) VALUES
(1, 10, 400.00),
(2, 11, 300.00),
(3, 12, 200.00),
(1, 12, 150.00);

--4. Give the list the producers.

SELECT * FROM producer;

--5. Give the list of producers sorted by name.

SELECT * FROM producer ORDER BY LastName,FirstName;

--6. Give the list the producers of Sousse.

SELECT * FROM producer WHERE Region = 'Sousse';

--7. Calculate the total quantity of wine produced having the number 12.

SELECT SUM(Quantity) AS TotalQuantity
FROM harvest
WHERE NumW = 12;

--8. Calculate the quantity of wine produced by category.

SELECT w.Category, SUM(h.Quantity) AS TotalQuantity
FROM wine w
JOIN harvest h ON w.NumW = h.NumW
GROUP BY w.Category;

--9. Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order.

SELECT p.FirstName, p.LastName
FROM producer p
JOIN harvest h ON p.NumP = h.NumP
WHERE p.Region = 'Sousse' AND h.Quantity > 300
ORDER BY p.LastName, p.FirstName;

--10. List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.

SELECT w.NumW
FROM wine w
JOIN harvest h ON w.NumW = h.NumW
WHERE w.Degree > 12 AND h.NumP = 24;
