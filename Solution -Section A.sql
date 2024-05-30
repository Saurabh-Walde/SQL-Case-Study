-- Section A --> Know your data 
-- 1. Read the data from all tables.
SELECT * FROM customer;
SELECT * FROM orderitem;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM supplier;

 -- 2. Find the country wise count of customers.

SELECT country, COUNT(*) AS customer_count 
FROM customer
GROUP BY country;
 
-- 3. Display the products which are not discontinued.

SELECT * FROM product
WHERE Isdiscontinued = 0;

-- 4. Display the list of companies along with the product name that they are supplying.
SELECT s.CompanyName, p.ProductName 
FROM supplier as s
INNER JOIN product as p
ON s.Id =p.Id;


--  5. Display customer's information who stays in 'Mexico'

SELECT * FROM customer 
WHERE Country = 'Mexico';

-- 6. Display the costliest item that is ordered by the customer.

SELECT p.ProductName, MAX(p.UnitPrice) AS max_price
FROM product as p
JOIN orderitem oi 
ON p.Id = oi.ProductId
GROUP BY p.ProductName
ORDER BY max_price DESC
LIMIT 1;

-- 7. Display supplier id who owns highest number of products.
SELECT count(*) AS count, SupplierId FROM product
GROUP BY SupplierId
ORDER BY count DESC;


-- 8. Display month wise and year wise count of the orders placed.
SELECT MONTH(OrderDate) AS months, YEAR(OrderDate) AS years, COUNT(*) AS order_count
FROM orders
GROUP BY MONTH(OrderDate), YEAR(OrderDate)
ORDER BY years, months;

-- 9. Which country has maximum suppliers.

SELECT Country, COUNT(*) AS supplier_count
FROM supplier
GROUP BY Country
ORDER BY supplier_count DESC
LIMIT 1;


-- 10. Which customers did not place any order

SELECT c.Id, c.FirstName
FROM customer c
LEFT JOIN orders o 
ON c.Id = o.CustomerId
WHERE o.Id IS NULL;