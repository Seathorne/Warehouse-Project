-- Create tables for a basic warehouse management system
CREATE TABLE Warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    location VARCHAR(100),
    capacity INT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    weight_kg DECIMAL(5,2)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    warehouse_id INT,
    product_id INT,
    quantity INT,
    last_updated DATETIME,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample data
INSERT INTO Warehouses VALUES
(1, 'Main Storage', 'Indianapolis', 10000),
(2, 'North Hub', 'Chicago', 8000),
(3, 'South Distribution', 'Louisville', 6000);

INSERT INTO Products VALUES
(101, 'Industrial Robot Arm', 'Robotics', 15000.00, 125.50),
(102, 'Conveyor Belt 10m', 'Conveyance', 5000.00, 85.20),
(103, 'Automated Guided Vehicle', 'Transport', 25000.00, 250.00),
(104, 'Packing Robot', 'Robotics', 18000.00, 180.75),
(105, 'Storage Rack System', 'Storage', 3000.00, 450.00);

INSERT INTO Inventory VALUES
(1, 1, 101, 5, '2024-01-15 10:00:00'),
(2, 1, 102, 10, '2024-01-20 14:30:00'),
(3, 2, 103, 3, '2024-01-22 09:15:00'),
(4, 3, 104, 7, '2024-01-25 16:45:00'),
(5, 2, 105, 15, '2024-01-28 11:20:00');

-- Example Queries

-- 1. Basic SELECT with JOIN
-- Show all products and their quantities in each warehouse
SELECT 
    w.warehouse_name,
    p.product_name,
    i.quantity,
    p.unit_price,
    (i.quantity * p.unit_price) AS total_value
FROM Inventory AS i
JOIN Warehouses AS w ON i.warehouse_id = w.warehouse_id
JOIN Products AS p ON i.product_id = p.product_id
ORDER BY w.warehouse_name, p.product_name;

-- 2. Aggregation with GROUP BY
-- Total value of inventory by warehouse
SELECT 
    w.warehouse_name,
    SUM(i.quantity * p.unit_price) AS total_inventory_value,
    COUNT(DISTINCT p.product_id) AS unique_products
FROM Inventory AS i
JOIN Warehouses AS w ON i.warehouse_id = w.warehouse_id
JOIN Products AS p ON i.product_id = p.product_id
GROUP BY w.warehouse_name;

-- 3. Complex Query with Subqueries
-- Find warehouses with robotics products below average quantity
SELECT 
    w.warehouse_name,
    p.product_name,
    i.quantity,
    (SELECT AVG(quantity) FROM Inventory) AS overall_avg_quantity
FROM Inventory AS i
JOIN Warehouses AS w ON i.warehouse_id = w.warehouse_id
JOIN Products AS p ON i.product_id = p.product_id
WHERE p.category = 'Robotics'
AND i.quantity < (SELECT AVG(quantity) FROM Inventory);

-- Debug Queries
-- Check robotics products
SELECT * FROM Products WHERE category = 'Robotics';

-- Check average quantity
SELECT AVG(quantity) FROM Inventory;

-- Check quantities for robotics products
SELECT i.quantity, p.category
FROM Inventory AS i
JOIN Products AS p ON i.product_id = p.product_id
WHERE p.category = 'Robotics';