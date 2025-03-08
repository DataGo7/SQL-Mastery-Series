
BEGIN;
UPDATE Product SET Price = Price - 50 WHERE ProductID = 1;
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount) VALUES (1, 1, 2, 4400);
COMMIT; -- ROLLBACK IF ERROR OCCURS
