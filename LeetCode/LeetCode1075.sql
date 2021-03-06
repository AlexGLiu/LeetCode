-----------------------------------------------------------------------
-- 	LeetCode 1075. Project Employees I
-- 	Easy
--
-- 	SQL Schema
--
-- 	Table: Project
--	
-- 	+-------------+---------+
--  | Column Name | Type    |
--  +-------------+---------+
--  | project_id  | int     |
--  | employee_id | int     |
--  +-------------+---------+
--  (project_id, employee_id) is the primary key of this table.
--  employee_id is a foreign key to Employee table.
--
--  Table: Employee
--
--  +------------------+---------+
--  | Column Name      | Type    |
--  +------------------+---------+
--  | employee_id      | int     |
--  | name             | varchar |
--  | experience_years | int     |
--  +------------------+---------+
--  employee_id is the primary key of this table.
-- 
--  Write an SQL query that reports the average experience years of all 
--  the employees for each project, rounded to 2 digits.
--
--  The query result format is in the following example:
--
--  Project table:
--  +-------------+-------------+
--  | project_id  | employee_id |
--  +-------------+-------------+
--  | 1           | 1           |
--  | 1           | 2           |
--  | 1           | 3           |
--  | 2           | 1           |
--  | 2           | 4           |
--  +-------------+-------------+
--  
--  Employee table:
--  +-------------+--------+------------------+
--  | employee_id | name   | experience_years |
--  +-------------+--------+------------------+
--  | 1           | Khaled | 3                |
--  | 2           | Ali    | 2                |
--  | 3           | John   | 1                |
--  | 4           | Doe    | 2                |
--  +-------------+--------+------------------+
--
--  Result table:
--  +-------------+---------------+
--  | project_id  | average_years |
--  +-------------+---------------+
--  | 1           | 2.00          |
--  | 2           | 2.50          |
--  +-------------+---------------+
--  The average experience years for the first project is (3 + 2 + 1) / 3 
--  = 2.00 and for the second project is (3 + 2) / 2 = 2.50
--------------------------------------------------------------------
SELECT
    project_id, CONVERT(NUMERIC(18,2), average_years) AS average_years
FROM
(
    SELECT A.project_id, AVG(CONVERT(NUMERIC(18,2), B.experience_years)) AS average_years
    FROM Project AS A
    INNER JOIN Employee AS B
    ON A.employee_id = B.employee_id
    GROUP BY project_id
) AS T
ORDER BY project_id
;
