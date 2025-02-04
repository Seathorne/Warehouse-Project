-- Reset to run as sequential script:
DROP TABLE IF EXISTS tcgSets;

-- Create table to store info on TCG sets:
CREATE TABLE tcgSets (
   SeriesId INTEGER,
   SetId INTEGER PRIMARY KEY,  -- 1 to 172
   SetName TEXT(40),              -- e.g. 'Base Set', 'Scarlet & Violet - 151'
   SetCode TEXT(10) DEFAULT NULL, -- e.g. 'BS', 'MEW'
   Length INTEGER,        -- Total number of cards in set
   HiddenLength INTEGER,  -- Number of secret/hidden cards
   ReleaseYear INTEGER,     -- Year set was released
   FOREIGN KEY (SeriesId) REFERENCES tcgSeries(SeriesId)
);

-- Insert values for all existing sets:
INSERT INTO tcgSets (SeriesId, SetName, SetId)
VALUES
  (1, 'Base', 1),
  (1, 'Jungle', 2),
  (1, 'Wizards of the Coast Promos', 3),
  (1, 'Fossil', 4),
  (1, 'Base 2', 5),
  (1, 'Team Rocket', 6),
  (2, 'Gym Heroes', 7),
  (2, 'Gym Challenge', 8),
  (3, 'Topps Series 1', 9),
  (3, 'Topps Series 2', 10),
  (3, 'Topps Series 3', 11),
  (4, 'Neo Genesis', 12),
  (4, 'Neo Discovery', 13),
  (4, 'Southern Islands', 14),
  (4, 'Neo Revelation', 15),
  (4, 'Neo Destiny', 16),
  (5, 'Legendary Collection', 17),
  (6, 'Expedition', 18),
  (6, 'Best of Game', 19),
  (6, 'Aquapolis', 20),
  (6, 'Skyridge', 21),
  (7, 'EX Ruby & Sapphire', 22),
  (7, 'EX Sandstorm', 23),
  (7, 'EX Dragon', 24),
  (7, 'EX Team Magma vs Team Aqua', 25),
  (7, 'EX Hidden Legends', 26),
  (7, 'EX FireRed & LeafGreen', 27),
  (7, 'EX Team Rocket Returns', 28),
  (7, 'EX Deoxys', 29),
  (7, 'EX Emerald', 30),
  (7, 'EX Unseen Forces', 31),
  (7, 'EX Unseen Forces Unown Collection', 32),
  (7, 'EX Delta Species', 33),
  (7, 'EX Legend Maker', 34),
  (7, 'EX Holon Phantoms', 35),
  (7, 'EX Crystal Guardians', 36),
  (7, 'EX Dragon Frontiers', 37),
  (7, 'EX Power Keepers', 38),
  (8, 'Diamond & Pearl', 39),
  (8, 'DP Black Star Promos', 40),
  (8, 'Mysterious Treasures', 41),
  (8, 'Secret Wonders', 42),
  (8, 'Great Encounters', 43),
  (8, 'Majestic Dawn', 44),
  (8, 'Legends Awakened', 45),
  (8, 'Stormfront', 46),
  (9, 'Nintendo Promos', 47),
  (9, 'POP Series 1', 48),
  (9, 'POP Series 2', 49),
  (9, 'POP Series 3', 50),
  (9, 'POP Series 4', 51),
  (9, 'POP Series 5', 52),
  (9, 'POP Series 6', 53),
  (9, 'POP Series 7', 54),
  (9, 'POP Series 8', 55),
  (9, 'POP Series 9', 56),
  (10, 'Platinum', 57),
  (10, 'Platinum - Rising Rivals', 58),
  (10, 'Platinum - Supreme Victors', 59),
  (10, 'Platinum - Arceus', 60),
  (10, 'Pokemon Rumble', 61),
  (11, 'HeartGold SoulSilver', 62),
  (11, 'HeartGold SoulSilver Promos', 63),
  (11, 'HS Unleashed', 64),
  (11, 'HS Undaunted', 65),
  (11, 'HS Triumphant', 66),
  (12, 'Call of Legends', 67),
  (13, 'Black & White Promos', 68),
  (13, 'McDonald''s Collection (2011)', 69),
  (13, 'McDonald''s Collection (2012)', 70),
  (13, 'McDonald''s Collection (2013)', 71),
  (14, 'Black & White', 72),
  (14, 'Emerging Powers', 73),
  (14, 'Noble Victories', 74),
  (14, 'Next Destinies', 75),
  (14, 'Dark Explorers', 76),
  (14, 'Dragons Exalted', 77),
  (14, 'Dragon Vault', 78),
  (14, 'Boundaries Crossed', 79),
  (14, 'Plasma Storm', 80),
  (14, 'Plasma Freeze', 81),
  (14, 'Plasma Blast', 82),
  (14, 'Legendary Treasures', 83),
  (14, 'Radiant Collection', 84),
  (15, 'XY', 85),
  (15, 'XY Promos', 86),
  (15, 'Kalos Starter', 87),
  (15, 'XY Flashfire', 88),
  (15, 'McDonald''s Collection (2014)', 89),
  (15, 'Furious Fists', 90),
  (15, 'Phantom Forces', 91),
  (15, 'Primal Clash', 92),
  (15, 'Double Crisis', 93),
  (15, 'Roaring Skies', 94),
  (15, 'Ancient Origins', 95),
  (15, 'XY BREAKthrough', 96),
  (15, 'McDonald''s Collection (2015)', 97),
  (15, 'BREAKPoint', 98),
  (15, 'Generations', 99),
  (15, 'Fates Collide', 100),
  (15, 'Steam Siege', 101),
  (15, 'McDonald''s Collection (2016)', 102),
  (15, 'Evolutions', 103),
  (16, 'Sun & Moon', 104),
  (16, 'Sun & Moon Promos', 105),
  (16, 'Guardians Rising', 106),
  (16, 'McDonald''s Collection (2017)', 107),
  (16, 'Burning Shadows', 108),
  (16, 'Shining Legends', 109),
  (16, 'Crimson Invasion', 110),
  (16, 'Ultra Prism', 111),
  (16, 'Forbidden Light', 112),
  (16, 'Celestial Storm', 113),
  (16, 'Dragon Majesty', 114),
  (16, 'McDonald''s Collection (2018)', 115),
  (16, 'Lost Thunder', 116),
  (16, 'Team Up', 117),
  (16, 'Detective Pikachu', 118),
  (16, 'Unbroken Bonds', 119),
  (16, 'Unified Minds', 120),
  (16, 'Hidden Fates', 121),
  (16, 'McDonald''s Collection (2019)', 122),
  (16, 'McDonald''s Collection (2019 FR)', 123),
  (16, 'Cosmic Eclipse', 124),
  (17, 'Sword & Shield Promos', 125),
  (17, 'Sword & Shield', 126),
  (17, 'Rebel Clash', 127),
  (17, 'Darkness Ablaze', 128),
  (17, 'Pokemon Futsal Promos', 129),
  (17, 'Champion''s Path', 130),
  (17, 'Vivid Voltage', 131),
  (17, 'McDonald''s 25th Anniversary', 132),
  (17, 'Shining Fates', 133),
  (17, 'Battle Styles', 134),
  (17, 'Chilling Reign', 135),
  (17, 'Evolving Skies', 136),
  (17, 'Celebrations', 137),
  (17, 'Fusion Strike', 138),
  (17, 'Brilliant Stars - Trainer Gallery', 139),
  (17, 'Brilliant Stars', 140),
  (17, 'Astral Radiance - Trainer Gallery', 141),
  (17, 'Astral Radiance', 142),
  (17, 'Pokemon Go', 143),
  (17, 'McDonald''s Match Battle', 144),
  (17, 'Trick or Trade', 145),
  (17, 'Holiday Calendar 2022', 146),
  (17, 'Lost Origin - Trainer Gallery', 147),
  (17, 'Lost Origin', 148),
  (17, 'Silver Tempest', 149),
  (17, 'Silver Tempest - Trainer Gallery', 150),
  (17, 'Crown Zenith - Galarian Gallery', 151),
  (17, 'Crown Zenith', 152),
  (18, 'Scarlet & Violet Promos', 153),
  (18, 'Scarlet & Violet', 154),
  (18, 'Scarlet & Violet Energies', 155),
  (18, 'Paldea Evolved', 156),
  (18, 'Obsidian Flames', 157),
  (18, 'McDonald''s Match Battle 2023', 158),
  (18, 'Holiday Calendar 2023', 159),
  (18, 'Trick or Trade 2023', 160),
  (18, 'Scarlet & Violet - 151', 161),
  (18, 'Paradox Rift', 162),
  (18, 'Paldean Fates', 163),
  (18, 'Temporal Forces', 164),
  (18, 'Twilight Masquerade', 165),
  (18, 'Shrouded Fable', 166),
  (18, 'Trick or Trade 2024', 167),
  (18, 'Stellar Crown', 168),
  (18, 'Holiday Calendar 2024', 169),
  (18, 'Surging Sparks', 170),
  (18, 'Prismatic Evolutions', 171),
  (18, 'McDonald''s Dragon Discovery', 172);

-- Set/update set codes:
UPDATE tcgSets
SET SetCode =
  (SELECT S.SeriesCode || ' ' ||
    (tcgSets.SetId - (SELECT MIN(SetId)
                      FROM tcgSets T
                      WHERE SeriesId = tcgSets.SeriesId) + 1
    )
  FROM tcgSeries S
  WHERE S.SeriesId = tcgSets.SeriesId
  )
WHERE SeriesId <= 18     -- For all thru Scarlet & Violet:
  AND SetCode IS NULL;

-- (Delete unofficial set codes):
UPDATE tcgSets
SET SetCode = NULL
WHERE SeriesId < 18;

-- Set/update official set codes:
UPDATE tcgSets
SET SetCode = CASE SetId
  WHEN 153 THEN 'SVP'
  WHEN 154 THEN 'SV1'
  WHEN 155 THEN 'SVE'
  WHEN 156 THEN 'PAL'
  WHEN 157 THEN 'OBF'
  WHEN 158 THEN 'M23'
  WHEN 161 THEN 'MEW'
  WHEN 162 THEN 'PAR'
  WHEN 163 THEN 'PAF'
  WHEN 164 THEN 'TEF'
  WHEN 165 THEN 'TWM'
  WHEN 166 THEN 'SFA'
  WHEN 168 THEN 'SCR'
  WHEN 170 THEN 'SSP'
  WHEN 171 THEN 'PRE'
  WHEN 172 THEN 'M24'
END
WHERE SeriesId = 18;

-- Show all released sets:
SELECT SeriesId, SetName, SetId, SetCode FROM tcgSets;