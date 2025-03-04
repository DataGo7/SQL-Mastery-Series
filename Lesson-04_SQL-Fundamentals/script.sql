-- Lesson-04: SQL Fundamentals (Real-Time Queries for HR and Finance Teams)
-- Retrieve all employees in a given department
SELECT EmpName, Salary FROM Employee WHERE DeptID = (SELECT DeptID FROM Department WHERE DeptName = 'IT');

-- Give a 10% bonus to all employees who joined before 2023
UPDATE Employee SET Salary = Salary * 1.1 WHERE JoiningDate < '2023-01-01';
