-- Reset to allow sequential file execution.
DELETE FROM tcgCards2
WHERE SetId = 172;

-- Insert cards from promotional set.
INSERT INTO tcgCards2 (SetNumber, SetId, Category, MaxHp, Type, RetreatCost, WeakType, ResistType,
                       CardName, Edition, Illustrator, CardEffect)
VALUES /* Pokémon are cool */
  (003, 172, 'BASIC Pokémon', 120, 'Lightning', 1, 'Fighting x2', NULL,
   'Miraidon', 'Holofoil', 'Kouki Saitou', NULL),
  (014, 172, 'BASIC Pokémon', 130, 'Colorless', 2, 'Lightning x2', 'Fighting -30',
   'Rayquaza', 'Normal', 'so-taro', NULL),
  (011, 172, 'BASIC Pokémon', 140, 'Darkness', 2, 'Grass x2', NULL,
   'Roaring Moon', 'Holo', 'hncl', NULL)
;

-- Update subcategory for special Pokémon classes.
UPDATE tcgCards2
SET SubCategory = 'Ancient Pokémon'
WHERE SetNumber = 011 AND SetId = 172;

-- Update common stats between McDonald's cards.
UPDATE tcgCards2
SET Rarity = 'Promo',
    Language = 'English',
    SeriesId = 18,
    PrintedYear = 2025
WHERE SetId = 172; /* McDonald's Promotional Jan–Feb 2025  */

-- Select all cards from promotional set.
SELECT * FROM tcgCards2
WHERE SetId = 172;