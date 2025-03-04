-- Lesson-06: CTEs (Advanced Analytics)
-- Identify employees earning above their department’s average salary
WITH DeptAvg AS (
    SELECT DeptID, AVG(Salary) AS AvgSalary FROM Employee GROUP BY DeptID
)
SELECT e.EmpName, e.Salary, d.AvgSalary
FROM Employee e
JOIN DeptAvg d ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSalary;
