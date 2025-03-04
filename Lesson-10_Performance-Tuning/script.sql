-- Lesson-10: Performance Tuning (Indexing and Optimization for Large Data Sets)
-- Creating indexes to speed up queries
CREATE INDEX idx_employee_salary ON Employee(Salary);
CREATE INDEX idx_order_date ON Orders(OrderDate);
