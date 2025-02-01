/* RETRIEVING DATA PRACTICE ******
 * Retrieving single/multiple columns
 * Retrieving all columns
 * Retrieving distinct rows
 * Retrieving with limited access
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

/* SORTING DATA PRACTICE:;
 * Sort by single column
 * Sort by multiple columns
 * Sort by column position
 * Specify sort direction
 */

 -- Order by column value:
 SELECT Name
 FROM gen1Pokemon
 ORDER BY Name;

-- Order by several column values:
SELECT Name,Type
FROM gen1Pokemon
ORDER BY Type,Name; -- orders by type last (highest level)

SELECT Name,Type,Height,Weight
FROM gen1Pokemon
ORDER BY 4,3,2,1; -- overall sorted by weight (name etc. within)

SELECT Name,Type,Height,Weight
FROM gen1Pokemon
ORDER BY 4 DESC,3,2,1; -- order by reverse weight

/* FILTERING DATA PRACTICE: --
 * Checking for matches
 * Checking for nonmatches
 * Checking for a range of values
 * Checking for no value
 * Using the AND operator
 * Using the OR operator
 * Using AND and OR operator
 * Using the IN operator
 * Using the NOT operator
 * Using the LIKE operator
 * The WHERE clause operator
 */

-- Filter by only grass-type Pokémon
SELECT Name, Number, Type
FROM gen1Pokemon
WHERE Type = 'Grass'
ORDER BY 2,1;

-- Filter by cards not matching Fire
SELECT Name, Number, Type
FROM gen1Pokemon
WHERE TYPE <> 'Fire'
ORDER BY Type;

-- check for a range...
SELECT Name, Number
FROM gen1Pokemon
WHERE Number BETWEEN 1 AND 10;

-- check outside a range...
SELECT Name, Number
FROM gen1Pokemon
WHERE Number < 5 OR Number >= 15;

-- Check for null/missing values:
--  > Requires a nullable column in table :|
SELECT *
FROM gen1Pokemon
WHERE Id IS NULL;

-- check for non-null values (two-types only)
SELECT Id, Name, Type, Type2
FROM gen1Pokemon
WHERE Id IS NOT NULL
AND Type2 != 'None';

--create temp Pokémon with alternate poison/grass typing
INSERT INTO gen1Pokemon (Name, Type, Type2, Number)
SELECT 'Kakuna2', 'Poison', 'Grass', 1014;

SELECT Name,Type,Type2,Number
FROM gen1Pokemon;
--------------------Then,

-- Find poison/grass types:
SELECT Id, Name, Type, Type2
FROM gen1Pokemon
WHERE Type IN ('Grass','Poison') AND
      Type2 IN ('Grass','Poison');

------------------------------------------------------------------------------------------
/* > copy and drop table if necessary   */
CREATE TABLE gen1Pokemon2
(
  Id          INTEGER                      DEFAULT NULL,
  Name        TEXT(20) UNIQUE     NOT NULL DEFAULT '',
  Type        TEXT(20)                     DEFAULT 'None',
  Type2       TEXT(20)                     DEFAULT 'None',
  Height      INTEGER                      DEFAULT 0, -- Height in feet and inches.
  Weight      DECIMAL(3, 2)                DEFAULT 0, -- Weight in lbs.
  Number      INTEGER PRIMARY KEY NOT NULL,           -- Pokedex #
  Description TEXT(70)                     DEFAULT 'Uninit'
);

SELECT * FROM gen1Pokemon2;

INSERT INTO gen1Pokemon2
SELECT row_number() over (ORDER BY Number) as Id,
  Name, Type, Type2, Height, Weight, Number, Description
FROM gen1Pokemon;

SELECT * FROM gen1Pokemon2;

DROP TABLE gen1Pokemon;

ALTER TABLE gen1Pokemon2
RENAME TO gen1Pokemon;

-- DROP TABLE gen1Pokemon2
------------------------------------------------------------------------------------------