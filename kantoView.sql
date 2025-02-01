--------------------------------------------------------------------------------
/*  1. If not already created, create the table for Generation 1 Pokémon.   */
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS gen1Pokemon
(
  Name TEXT(20) UNIQUE NOT NULL DEFAULT '',
  Type TEXT(20) DEFAULT 'None',
  Type2 TEXT(20) DEFAULT 'None',
  Height INTEGER DEFAULT 0, -- Height in feet and inches.
  Weight DECIMAL(3,2) DEFAULT 0, -- Weight in lbs.
  Number INTEGER PRIMARY KEY NOT NULL, -- Pokedex #
  Description TEXT(70) DEFAULT 'Uninit'
);

-- To restart:
DROP TABLE gen1Pokemon;

-- Add some Pokémon to the table:
INSERT INTO gen1Pokemon (Name, Type, Type2, Height, Weight, Number, Description)
VALUES ('Bulbasaur',  'Grass','Poison', 25/* =2'3*/, 15.2,  001, 'Seed Pokemon'),
       ('Ivysaur',    'Grass','Poison', 39, 28.7,           002, 'Seed Pokemon'),
       ('Venusaur',   'Grass','Poison', 78, 220.5,          003, 'Seed Pokemon'),
       ('Charmander', 'Fire', 'None', 23, 18.7,             004, 'Lizard Pokemon'),
       ('Charmeleon', 'Fire', 'None', 43, 41.9,             005, 'Flame Pokemon'),
       ('Charizard',  'Fire', 'None', 66, 199.5,            006, 'Flame Pokemon'),
       ('Squirtle',   'Water', 'None', 19, 19.8,            007, 'Tiny Turtle Pokemon'),
       ('Wartortle',  'Water', 'None', 39, 49.6,            008, 'Turtle Pokemon'),
       ('Blastoise',  'Water', 'None', 62, 188.5,           009, 'Shellfish Pokemon'),
       ('Caterpie',   'Grass', 'None', 11, 6.4,             010, 'Worm Pokemon'),
       ('Metapod',    'Grass', 'None', 25, 21.8,            011, 'Cocoon Pokemon'),
       ('Butterfree', 'Grass', 'None', 43, 70.5,            012, 'Butterfly Pokemon'),
       ('Weedle',     'Grass', 'Poison', 11, 7.1,           013, 'Hairy Bug Pokemon'),
       ('Kakuna',     'Grass', 'Poison', 23, 22.0,          014, 'Cocoon Pokemon'),
       ('Beedrill',   'Grass', 'Poison', 39, 65,            015, 'Poison Bee Pokemon'),
       ('Pidgey',     'Normal', 'Flying', 11, 4.0,          016, 'Tiny Bird Pokemon'),
       ('Pidgeotto',  'Normal', 'Flying', 43, 66.1,         017, 'Bird Pokemon'),
       ('Pidgeot',    'Normal', 'Flying', 59, 87.1,         018, 'Bird Pokemon'),
       ('Rattata',    'Normal', 'None', 11, 7.7,            019, 'Mouse Pokemon'),
       ('Raticate',   'Normal', 'None', 25, 40.8,           020, 'Mouse Pokemon'),
       ('Spearow',    'Normal', 'Flying', 11, 4.4,          021, 'Tiny Bird Pokemon');
--  (If you try to run this twice,     ^^
--    you violate a PRIMARY KEY Constraint, )
--    considering they already exist.      )
-- To avoid, rephrase the INSERT clause to include WHERE;
--  (This requires changing VALUES into multi-SELECT w/ UNION.)
WITH inserts (Name, Type, Type2, Height, Weight, Number, Description) AS (
  SELECT 'Bulbasaur',  'Grass','Poison', 25/* =2'3*/, 15.2,  001, 'Seed Pokemon'          UNION ALL
  SELECT 'Ivysaur',    'Grass','Poison', 39, 28.7,           002, 'Seed Pokemon'          UNION ALL
  SELECT 'Venusaur',   'Grass','Poison', 78, 220.5,          003, 'Seed Pokemon'          UNION ALL
  SELECT 'Charmander', 'Fire', 'None', 23, 18.7,             004, 'Lizard Pokemon'        UNION ALL
  SELECT 'Charmeleon', 'Fire', 'None', 43, 41.9,             005, 'Flame Pokemon'         UNION ALL
  SELECT 'Charizard',  'Fire', 'None', 66, 199.5,            006, 'Flame Pokemon'         UNION ALL
  SELECT 'Squirtle',   'Water', 'None', 19, 19.8,            007, 'Tiny Turtle Pokemon'   UNION ALL
  SELECT 'Wartortle',  'Water', 'None', 39, 49.6,            008, 'Turtle Pokemon'        UNION ALL
  SELECT 'Blastoise',  'Water', 'None', 62, 188.5,           009, 'Shellfish Pokemon'     UNION ALL
  SELECT 'Caterpie',   'Grass', 'None', 11, 6.4,             010, 'Worm Pokemon'          UNION ALL
  SELECT 'Metapod',    'Grass', 'None', 25, 21.8,            011, 'Cocoon Pokemon'        UNION ALL
  SELECT 'Butterfree', 'Grass', 'None', 43, 70.5,            012, 'Butterfly Pokemon'     UNION ALL
  SELECT 'Weedle',     'Grass', 'Poison', 11, 7.1,           013, 'Hairy Bug Pokemon'     UNION ALL
  SELECT 'Kakuna',     'Grass', 'Poison', 23, 22.0,          014, 'Cocoon Pokemon'        UNION ALL
  SELECT 'Beedrill',   'Grass', 'Poison', 39, 65,            015, 'Poison Bee Pokemon'    UNION ALL
  SELECT 'Pidgey',     'Normal', 'Flying', 11, 4.0,          016, 'Tiny Bird Pokemon'     UNION ALL
  SELECT 'Pidgeotto',  'Normal', 'Flying', 43, 66.1,         017, 'Bird Pokemon'          UNION ALL
  SELECT 'Pidgeot',    'Normal', 'Flying', 59, 87.1,         018, 'Bird Pokemon'          UNION ALL
  SELECT 'Rattata',    'Normal', 'None', 11, 7.7,            019, 'Mouse Pokemon'         UNION ALL
  SELECT 'Raticate',   'Normal', 'None', 25, 40.8,           020, 'Mouse Pokemon'         UNION ALL
  SELECT 'Spearow',    'Normal', 'Flying', 11, 4.4,          021, 'Tiny Bird Pokemon'
)
INSERT INTO gen1Pokemon (Name, Type, Type2, Height, Weight, Number, Description)
SELECT * FROM inserts
WHERE NOT EXISTS (
  SELECT 1 FROM gen1Pokemon WHERE inserts.Number = gen1Pokemon.Number
);
-- Now you should be able to rerun the query with no problem.👍

-------------------------------------------------------------
/* 2. Create a simple 1-to-1 view of the Pokémon table.  */
-------------------------------------------------------------
CREATE VIEW IF NOT EXISTS gen1Pokedex AS
SELECT
  Name, Type, Height, Weight, Number, Description
FROM gen1Pokemon;

SELECT * FROM gen1Pokedex;

DROP VIEW gen1Pokedex;

----------------------------------

-------------------------------------------------------------------
/* X. (Hint: if you need to start over, follow these steps.)   */
-------------------------------------------------------------------
-- 1a. Create new table from old table columns:
CREATE TABLE IF NOT EXISTS gen1Pokemon2 AS
SELECT Name, Type, Height, Weight, Number, Description
FROM gen1Pokemon;

-- 1b. Alternately, if you need to modify a column:
CREATE TABLE IF NOT EXISTS gen1Pokemon2
(
  Name TEXT(20) UNIQUE NOT NULL DEFAULT '',
  Type TEXT(20) DEFAULT 'None',
  Type2 TEXT(20) DEFAULT 'None',
  Height INTEGER DEFAULT 0, -- Height in feet and inches.
  Weight DECIMAL(3,2) DEFAULT 0, -- Weight in lbs.
  Number INTEGER PRIMARY KEY NOT NULL, -- Pokedex #
  Description TEXT(70) DEFAULT 'Uninit'
);

-- 2. Drop old table:
DROP TABLE gen1Pokemon;

-- 3. Rename new table
ALTER TABLE gen1Pokemon2
RENAME TO gen1Pokemon;

-- 4. To add another column to new table:
ALTER TABLE gen1Pokemon
ADD COLUMN Type2 TEXT(20) DEFAULT 'None';

-- 5x. To modify a column in any other SQL-DBMS 🙄
/* ALTER TABLE gen1Pokemon
/* MODIFY COLUMN Height TO TEXT(10);
-------------------------------------------------------------------
-------------------------------------------------------------------
