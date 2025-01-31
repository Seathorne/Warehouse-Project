---------------------------------------------------
/*  1. Select cards and join with Pokémon.      */
---------------------------------------------------
-- Select Pokemon that are also cards:
SELECT *
FROM Pokemon P
LEFT JOIN Cards C ON P.poke_id = C.poke_id
WHERE P.poke_id != 0
  AND P.poke_name IS NOT NULL
  AND P.poke_name != '';

---------------------------------------------------------------------
/*  2. Insert cards into the card table; query on joined tables */
---------------------------------------------------------------------
-- Insert Porygon if this card doesn't already exist:
INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 65, 'Porygon', 137, 1, 65, 'Tomoaki Imakuni', 'Black Star', 0
WHERE NOT EXISTS (
    SELECT 1 FROM CARDS
    WHERE set_id = 1 AND set_no = 65
);

-- Insert another Porygon with unique set numbers:
INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 74101, 'Porygon', 137, 74, 101, 'Scott Clarke', 'Diamond', 2
WHERE NOT EXISTS (
    SELECT 1 FROM CARDS
    WHERE set_id = 74 AND set_no = 101
);

-- Change name of newly added Porygon card:
UPDATE Cards
SET card_id = 7101,
    card_name = 'Porygon''s Dream'
WHERE set_id = 74 AND set_no = 101;

-- Select all Porygon cards (even if named other than "Porygon")
SELECT C.poke_id, P.poke_name, C.card_name, set_id, set_no, rarity_class
FROM Cards C
LEFT JOIN Pokemon P ON C.poke_id = P.poke_id
WHERE C.card_name = 'Porygon'
   OR C.poke_id = 137;

-- Delete custom card.
DELETE FROM Cards
WHERE card_id = 7101
  AND card_name = 'Porygon''s Dream';

-------------------------------------------------------
/*  3. Insert more unique cards of similar Pokemon. */
-------------------------------------------------------
INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 65, 'Porygon', 137, 1, 65, 'Tomoaki Imakuni', 'Black Star', 0
WHERE NOT EXISTS (
    SELECT 1 FROM Cards WHERE set_id = 1 AND set_no = 65
);

INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 74101, 'Porygon', 137, 3, 28, 'Ken Sugimori', 'Common', 3
WHERE NOT EXISTS (
    SELECT 1 FROM Cards WHERE set_id = 3 AND set_no = 28
);

INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 82050, 'Porygon', 137, 7, 39, 'Kagemaru Himeno', 'Common', 3
WHERE NOT EXISTS (
    SELECT 1 FROM Cards WHERE set_id = 7 AND set_no = 39
);

INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count)
SELECT 95033, 'Porygon', 137, 11, 48, 'Hironobu Yoshida', 'Common', 3
WHERE NOT EXISTS (
    SELECT 1 FROM Cards WHERE set_id = 11 AND set_no = 48
);

-----------------------------------------------
/*  4. Attempt bulk insert operation.   */
-----------------------------------------------
WITH New_Cards(card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count) AS (
    SELECT 65, 'Porygon', 137, 1, 65, 'Tomoaki Imakuni', 'Black Star', 0
    UNION ALL
    SELECT 74101, 'Porygon', 137, 3, 28, 'Ken Sugimori', 'Common', 3
    UNION ALL
    SELECT 82050, 'Porygon', 137, 7, 39, 'Kagemaru Himeno', 'Common', 3
    UNION ALL
    SELECT 95033, 'Porygon', 137, 11, 48, 'Hironobu Yoshida', 'Common', 3
)
INSERT INTO Cards
SELECT * FROM New_Cards N
WHERE NOT EXISTS (
    SELECT 1 FROM Cards C
    WHERE C.set_id = N.set_id AND C.set_no = N.set_no
);

----------------------------------------------------------------------------
/*  5. Delete all but the oldest (lowest value card_id) Porygon card.    */
----------------------------------------------------------------------------
-- Select the oldest Porygon card:
SELECT *
FROM Cards C
WHERE C.card_id = (
   SELECT MIN(card_id) FROM Cards
                       WHERE poke_id = 137
)
AND poke_id = 137;

-- Delete all but the oldest Porygon card:
DELETE FROM Cards
WHERE card_id > (
   SELECT MIN(card_id) FROM Cards
                       WHERE poke_id = 137
)
AND poke_id = 137;