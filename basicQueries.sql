-- Select all:
SELECT * FROM gen1Pokemon;

-- Select distinct types:
SELECT DISTINCT Type FROM gen1Pokemon;

-- Select 5 count:
SELECT * FROM gen1Pokemon
LIMIT 5;

-- Starting at 10, select 5 count:
SELECT * FROM gen1Pokemon
LIMIT 10, 5;

-- Cut off at 3 when reaching end of table:
SELECT * FROM gen1Pokemon
LIMIT 15, 5