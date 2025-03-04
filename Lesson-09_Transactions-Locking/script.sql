-- Lesson-09: Transactions & Locking (Secure and Safe Order Processing)
BEGIN;
UPDATE Product SET Price = Price - 50 WHERE ProductID = 1;
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount) VALUES (1, 1, 2, 4400);
COMMIT; -- ROLLBACK IF ERROR OCCURS
