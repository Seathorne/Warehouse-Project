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
