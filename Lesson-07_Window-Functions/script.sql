-- Lesson-07: Window Functions (Modern HR Use Case)
-- Rank employees by salary within each department
SELECT EmpName, DeptID, Salary, RANK() OVER (PARTITION BY DeptID ORDER BY Salary DESC) AS Rank
FROM Employee;
