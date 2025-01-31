---------------------------------------------------
/*  1. Select cards and join with Pokémon.      */
---------------------------------------------------
-- Select Pokemon that are also cards.
SELECT *
FROM Pokemon
LEFT JOIN Cards ON Pokemon.poke_id = Cards.poke_id
WHERE Pokemon.poke_id != 0
  AND (Pokemon.poke_name NOT NULL AND Pokemon.poke_name != '');
