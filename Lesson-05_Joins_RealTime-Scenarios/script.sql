-- Find employees with department details (INNER JOIN)
SELECT e.EmpName, e.Salary, d.DeptName FROM Employee e
JOIN Department d ON e.DeptID = d.DeptID;

-- Find employees and their last orders (LEFT JOIN with latest order per employee)
SELECT e.EmpName, o.OrderID, o.TotalAmount
FROM Employee e
LEFT JOIN Orders o ON e.EmpID = o.CustomerID
ORDER BY o.OrderDate DESC;
