-- Reset to allow sequential file execution.
DELETE FROM tcgCards2
WHERE SetId = 172;

-- Insert cards from the 2024 Dragon Discovery set.
INSERT INTO tcgCards2 (Quantity, SetNumber, SetId, CardName, Edition, Illustrator, CardEffect,
                       Category, MaxHp, Type, RetreatCost, WeakType, ResistType)
VALUES
  (1, 001, 172, 'Charizard', 'Normal', 'Ryuta Fuse', 'Evolves from Charmeleon',
    'STAGE 2 Pokémon', 170, 'Fire', 3, 'Water x2', NULL),
  (1, 003, 172, 'Miraidon', 'Holofoil', 'Kouki Saitou', NULL,
    'BASIC Pokémon', 120, 'Lightning', 1, 'Fighting x2', NULL),
  (1, 004, 172, 'Jigglypuff', 'Normal', 'Saya Tsuruta', NULL,
    'BASIC Pokémon', 60, 'Psychic', 1, 'Steel x2', NULL),
  (2, 007, 172, 'Quagsire', 'Normal', 'otumami', 'Evolves from Wooper',
    'STAGE 1 Pokémon', 120, 'Fighting', 2, 'Grass x2', NULL),
  (1, 011, 172, 'Roaring Moon', 'Holo', 'hncl', NULL,
    'BASIC Pokémon', 140, 'Darkness', 2, 'Grass x2', NULL),
  (1, 013, 172, 'Eevee', 'Normal', '0313', NULL,
    'BASIC Pokémon', 50, 'Colorless', 1, 'Fighting x2', NULL),
  (1, 014, 172, 'Rayquaza', 'Normal', 'so-taro', NULL,
    'BASIC Pokémon', 130, 'Colorless', 2, 'Lightning x2', 'Fighting -30')
;

-- Update common stats between the promotional cards.
UPDATE tcgCards2
SET Rarity = 'Common',
    Language = 'English',
    SeriesId = 18,
    PrintYear = 2024
WHERE SetId = 172; /* Dragon Discovery – McDonald's Promotional Jan/Feb 2025  */

-- Update subcategory for special Pokémon classes.
UPDATE tcgCards2
SET SubCategory = 'Ancient Pokémon'
WHERE SetNumber = 011 AND SetId = 172;

-- Add Charizard's deck-scrying ability:
UPDATE tcgCards2
SET AbilityName = 'Battle Sense'
WHERE SetNumber = 001 AND SetId = 172;

-- Select all cards from 2024 promotional set.
SELECT * FROM tcgCards2
WHERE SetId = 172;