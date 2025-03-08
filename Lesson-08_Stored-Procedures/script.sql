
-- Automate employee salary updates based on department
CREATE PROCEDURE UpdateSalaries(IN dept_name VARCHAR, IN percent DECIMAL)
LANGUAGE SQL AS $$
    UPDATE Employee SET Salary = Salary * (1 + percent / 100)
    WHERE DeptID = (SELECT DeptID FROM Department WHERE DeptName = dept_name);
$$;
