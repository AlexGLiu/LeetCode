-----------------------------------------------------------------------
-- 	LeetCode 183. Customers Who Never Order
--
--  Easy
--
--  SQL Schema
--
--  Suppose that a website contains two tables, the Customers table and the 
--  Orders table. Write a SQL query to find all customers who never order 
--  anything.
--
--  Table: Customers.
--
--  +----+-------+
--  | Id | Name  |
--  +----+-------+
--  | 1  | Joe   |
--  | 2  | Henry |
--  | 3  | Sam   |
--  | 4  | Max   |
--  +----+-------+
--
--  Table: Orders.
--
--  +----+------------+
--  | Id | CustomerId |
--  +----+------------+
--  | 1  | 3          |
--  | 2  | 1          |
--  +----+------------+
--  Using the above tables as example, return the following:
-- 
--  +-----------+
--  | Customers |
--  +-----------+
--  | Henry     |
--  | Max       |
--  +-----------+
--------------------------------------------------------------------
SELECT
    A.Name AS Customers
FROM Customers AS A
LEFT OUTER JOIN 
(
    SELECT
	    DISTINCT
		CustomerId
	FROM 
	   Orders
)AS B
ON A.Id = B.CustomerId
WHERE B.CustomerId IS NULL
;