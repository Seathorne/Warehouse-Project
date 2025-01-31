---------------------------------------------------
/*  1. Basic selection. Show all Pokémon.   */
---------------------------------------------------
SELECT * FROM Pokemon;

-------------------------------------------------------------------------
/* 2. Modify column type; add default value & non-null constraint.  */
-------------------------------------------------------------------------
-- **** (MODIFY COLUMN is only supported in MySQL & MariaDB.
-- ****  Or use ALTER COLUMN with PostgreSQL, SQL Server, Oracle, etc.
-- **** This command requires table recreation in SQLite.)

/* (This command is only supported in MySQL & MariaDB.)
ALTER TABLE Pokémon
MODIFY COLUMN type VARCHAR(10) NOT NULL DEFAULT '';
 */

--  Create duplicate table with fixed type column.
CREATE TABLE Pokemon_new (
    poke_id INTEGER NOT NULL PRIMARY KEY,
    poke_name VARCHAR(20) NOT NULL UNIQUE,
    poke_desc VARCHAR(30),
    height INTEGER DEFAULT 0,
    weight DECIMAL(3,2) DEFAULT 0,
    style_text TINYTEXT DEFAULT 'Uninitialized text.',
    poke_type VARCHAR(20) NOT NULL DEFAULT ''
);

--  Copy over existing table.
INSERT INTO Pokemon_new
SELECT * FROM Pokemon;

--  Drop table. Careful!
DROP TABLE Pokemon;

--  Rename new table after the old one is dropped.
ALTER TABLE Pokemon_new
RENAME TO Pokemon;

-------------------------------------------------------------------
/*  3. Update table to convert null values to empty string.  */
-------------------------------------------------------------------
UPDATE Pokemon
SET poke_type = ''
WHERE poke_type IS NULL;

-----------------------------------------------------
/*  4. Query Pokémon based on Pokédex # range.  */
-----------------------------------------------------
SELECT *
    FROM Pokemon
WHERE poke_id = 103 OR poke_name = 'Scizor'
   OR (poke_id BETWEEN 160 AND 200)
   OR (poke_id BETWEEN 420 AND 480)
   OR (poke_id BETWEEN 600 AND 700)
   OR poke_id > 800;

-----------------------------------------------------
/*  5. Update any Gen 1 Pokémon.        */
-----------------------------------------------------
--   view Exeggutor in table
SELECT *
FROM Pokemon
WHERE poke_name = 'Exeggutor';

--   make sure Exeggutor exists in table
INSERT INTO Pokemon (poke_id, poke_name, poke_type, poke_desc)
SELECT 103, 'Exeggutor', 'Grass', 'It is said that on rare occasions, one of its heads will drop off and continue on as an Exeggcute.'
WHERE NOT EXISTS (
    SELECT poke_id FROM Pokemon
                   WHERE poke_name = 'Exeggutor'
);

--   update Exeggutor's type if empty
UPDATE Pokemon
SET poke_type = 'Grass'
WHERE poke_name = 'Exeggutor'
AND poke_type IS NULL OR poke_type = '';

-----------------------------------------------------
/*   6. Add some post-Gen 1 Pokémon.    */
-----------------------------------------------------
--  Select all Pokémon from Gen 2–4:
SELECT *
FROM Pokemon
WHERE poke_id BETWEEN 152 AND 493;

--  Insert into table with aliased values and existence CTE check:
WITH gen_4_updated AS (
    SELECT 1 FROM Pokemon
             WHERE poke_id BETWEEN 152 AND 493 -- check if any from Gen 2–4
)
INSERT INTO Pokemon (poke_id, poke_name, poke_desc, weight, poke_type)
SELECT * FROM (
   VALUES
       (160, 'Feraligatr', 'Big Jaw Pokémon', 195.8, 'Water'),
       (212, 'Scizor', 'Pincer Pokémon', 260.1, 'Bug/Steel'),
       (462, 'Magnezone', 'Magnet Area Pokémon', 396.8, 'Electric/Steel'),
       (422, 'Gastrodon', 'Sea Slug Pokémon', 65.9, 'Water/Ground')
) AS new_values
WHERE NOT EXISTS (SELECT 1 FROM gen_4_updated);

--  Update Pokémon to include height and flavor (style) text.
UPDATE Pokemon
SET height = CASE poke_id
    WHEN 160 THEN 91
    WHEN 212 THEN 71
    WHEN 462 THEN 47
    WHEN 422 THEN 35
    END,
    style_text = CASE poke_id
    WHEN 160 THEN 'When it bites with its massive and powerful jaws, it shakes its head and savagely tears its victim up.'
    WHEN 212 THEN 'This Pokémon''s pincers, which contain steel, can crush any hard object it gets a hold of into bits.'
    WHEN 462 THEN 'Exposure to a special magnetic field changed Magneton''s molecular structure, turning it into Magnezone.'
    WHEN 422 THEN 'It apparently had a huge shell for protection in ancient times. It lives in shallow tidal pools.'
    END
WHERE poke_id IN (160, 212, 462, 422);

--  Update a misspelled Pokédex number (422 --> 423).
UPDATE Pokemon
SET poke_id = 423
WHERE poke_id = 422;

-----------------------------------------------------
/*  7. Add Pokémon up through Scarlet & Violet  */
-----------------------------------------------------
--  Select all Pokémon from Gen 5 onwards:
SELECT *
FROM Pokemon
WHERE poke_id >= 494;

--  Delete all Pokémon from Gen 5 onwards:
DELETE FROM Pokemon
WHERE poke_id >= 494;

--  Insert new Pokémon if Gen 5+ has not already been updated:
WITH gen_5_plus AS (
    SELECT 1 FROM Pokemon
             WHERE poke_id >= 494 -- check if any from after Gen 4
)
INSERT INTO Pokemon (poke_id, poke_name, poke_type, poke_desc, height, weight, style_text)
SELECT * FROM (
   VALUES
       (606, 'Beheeyem', 'Psychic', 'Cerebral Pokémon', 39, 76.1, 'It uses psychic power to control an opponent''s brain and tamper with its memories.'),
       (634, 'Zweilous', 'Dark/Dragon', 'Hostile Pokémon', 55, 110.2, 'The two heads do not get along. Whichever head eats more than the other gets to be the leader.'),
       (886, 'Drakloak', 'Dragon/Ghost', 'Caretaker Pokémon', 16, 8.8, 'This Pokémon flies around at over 120 miles per hour. If a Drakloak is defeated in a battle, its Dreepy will wander off without a second thought.')
) AS new_values
WHERE NOT EXISTS (SELECT 1 FROM gen_5_plus);

-----------------------------------------------------
/*  X. Add new Scarlet & Violet cards to deck.  */
-----------------------------------------------------
-- INSERT INTO Cards
-- VALUES ();