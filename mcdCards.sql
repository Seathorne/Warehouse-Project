DELETE FROM tcgCards2
WHERE SetId = 172;

INSERT INTO tcgCards2 (SetNumber, SetId, CardName, Category, Edition, Illustrator, CardEffect)
VALUES /* Pokémon are cool */
  (003, 172, 'Miraidon', 'BASIC Pokémon', 'Holofoil', 'Kouki Saitou', NULL),
  (014, 172, 'Rayquaza', 'BASIC Pokémon', 'Normal', 'so-taro', NULL),
  (011, 172, 'Roaring Moon', 'BASIC Pokémon > Ancient', 'Holo', 'hncl', NULL)
;

UPDATE tcgCards2
SET Rarity = 'Promo',
    Language = 'English',
    SeriesId = 18,
    PrintedYear = 2025
WHERE SetId = 172; /* McDonald's Promotional Jan–Feb 2025  */

SELECT * FROM tcgCards2
WHERE SetId = 172;