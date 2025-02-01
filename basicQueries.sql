/* RETRIEVING DATA PRACTICE ******
   Retrieving single/multiple columns
   Retrieving all columns
   Retrieving distinct rows
   Retrieving with limited access
   */
-- Select all:
SELECT * FROM gen1Pokemon;

-- Select all distinct types:
SELECT DISTINCT Type FROM gen1Pokemon;

-- Select at most 5 rows:
SELECT * FROM gen1Pokemon
LIMIT 5;

-- Starting at 10, select at most 5 rows:
SELECT * FROM gen1Pokemon
LIMIT 10, 5;

-- Select is cut off at end of table
SELECT * FROM gen1Pokemon
LIMIT 15, 5;

-- Alternate syntax for limiting:
SELECT 5 FROM gen1Pokemon;

-- Syntax where limiting not supported:
WITH ordered AS
(
 SELECT *, row_number() OVER (ORDER BY Number) as row_num
 FROM gen1Pokemon
)
SELECT * FROM ordered WHERE row_num >= 15;