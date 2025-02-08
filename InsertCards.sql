-- If table "tcgSets" not created,:
CREATE TABLE IF NOT EXISTS tcgSets
(
  SeriesId     INTEGER,
  SetId        TEXT(4) NOT NULL, -- 1 to 172
  SetName      TEXT(40),         -- e.g. 'Base Set', 'Scarlet & Violet - 151'
  SetCode      TEXT(10),         -- e.g. 'BS', 'MEW'
  Length       INTEGER,          -- Total number of cards in set
  HiddenLength INTEGER,          -- Number of secret/hidden cards
  ReleaseYear  INTEGER,          -- Year set was released
  FOREIGN KEY (SeriesId) REFERENCES tcgSeries (SeriesId)
);

-- Drop table to start fresh:
DROP TABLE IF EXISTS lightningCards;

-- If table "tcgCards" not created,:
CREATE TABLE lightningCards
(
  SetCode       TEXT(10) NOT NULL,              -- e.g. 'BW', 'SV1, 'SVP, 'PAF', 'BWEP', 'EXPM'
  SetNumber     INTEGER  NOT NULL,              -- e.g. >179< /191
--------------------------------------------------------------------------------------------------------------
  CardName      TEXT(20) NOT NULL,
  Category      TEXT(10) NOT NULL,              -- e.g. Trainer, DELTA Pokemon, Pokemon EX
  SubCategory   TEXT(10) NULL,                  -- e.g. BASIC, ITEM, SUPPORTER
  CardEffect    TEXT(100)         DEFAULT NULL, -- Card description or text/effect in play.
--------------------------------------------------------------------------------------------------------------
  PokeNumber    INTEGER,                        -- 137 for Porygon
  MaxHp         INTEGER,
  Type          TEXT(10) NULL,                  -- e.g. 'Fire'
  DeltaType     TEXT(10)          DEFAULT NULL, -- e.g. 'Metal'
  WeakType      TEXT(10),
  ResistType    Text(10),
  RetreatCost   INTEGER,
--------------------------------------------------------------------------------------------------------------
  AbilityName   TEXT(30)          DEFAULT NULL,
  PokeBody      TEXT(30) NULL,                  -- e.g. 'Dragon Aura'
  PokePower     TEXT(30) NULL,                  -- e.g. 'Dragon Curse'
  Attack1Name   TEXT(30),                       -- e.g. 'Extra Flame', 'Minor Errand-Running'
  Attack2Name   TEXT(30),                       -- e.g. 'Heat Blast', 'Tumbling Attack'
  Attack1Cost   VARCHAR(40),                    -- e.g. '1x Fire, 2x Dark'
  Attack2Cost   VARCHAR(40),
  Attack1Damage TEXT(5),
  Attack2Damage TEXT(5),                        -- e.g. 30+, 80
  FlavorText    TEXT(150),                      -- e.g. "When Kingdra gather in great numbers..."
--------------------------------------------------------------------------------------------------------------
  Rarity        TEXT(20),                       -- e.g. 'Common', 'Uncommon', 'Rare';
  PrintYear     INTEGER,                        -- E.g. 2024
  Illustrator   TEXT(20),                       -- e.g. 'Ken Sugimori', 'AYUMI ODASHIMI'
  Language      TEXT(20),                       -- E.g., English, French, Spanish, Japanese.
  Edition       TEXT(20),                       -- 'Holo', 'Reverse Holo', 'Full Art';
--------------------------------------------------------------------------------------------------------------
  SerialNumber  TEXT(12),
  Quantity      INTEGER  NOT NULL DEFAULT 1,
--------------------------------------------------------------------------------------------------------------
  FOREIGN KEY (SetCode) REFERENCES tcgSets (SetCode),
  PRIMARY KEY (SetCode, SetNumber)
);

/* Add set if not existent:  */
DELETE FROM tcgSets
WHERE SeriesId = 7 AND SetId = '34b';
-- and
INSERT INTO tcgSets (SeriesId, SetId, SetName, SetCode, Length, HiddenLength, ReleaseYear)
SELECT 7, '34b', 'EX Trainer Kit 2 – Plusle & Minun', 'EXPM', 24, 24, 2006 WHERE NOT EXISTS (
SELECT SetCode FROM tcgSets WHERE SeriesId = 7 AND SetId = '34b'
);

/* Update set codes if necessary:  */
UPDATE tcgSets
SET SetCode = 'BWEP'
WHERE (SetCode != 'BWEP' OR SetCode IS NULL) /* must check both, != doesn't catch NULL */
AND SetName LIKE '%Emerging Powers%';

SELECT SetCode, SetName
FROM tcgSets
WHERE SetName LIKE '%Emerging%';

-- Fill out set info:
UPDATE tcgSets
SET SetCode = 'BW1',
    Length = 114,
    HiddenLength = 115,
    ReleaseYear = 2011
WHERE SetName = 'Black & White';

UPDATE tcgSets
SET SetCode = 'BWEP',
    Length = 98,
    HiddenLength = 98,
    ReleaseYear = 2011
WHERE SetName LIKE '%Emerging Powers%';

-- Check for any duplicate sets before continuing.
SELECT *
FROM tcgSets
ORDER BY SeriesId;

/* Insert lightning type cards in collection:  */
INSERT INTO lightningCards (SetCode, SetNumber, CardName, Category, SubCategory, CardEffect, PokeNumber, MaxHp, Type,
                            DeltaType, WeakType, ResistType, RetreatCost, AbilityName, PokeBody, PokePower, Attack1Name,
                            Attack2Name, Attack1Cost, Attack2Cost, Attack1Damage, Attack2Damage, FlavorText, Rarity,
                            PrintYear, Illustrator, Language, Edition, SerialNumber, Quantity)
VALUES

  /* EX Trainer Kit 2 - Plusle & Minun  */
  ('EXPM', 05, 'Mareep', 'Pokemon', 'BASIC', NULL, 179, 50, 'Lightning', NULL, 'Fighting', NULL, 1, NULL, NULL,
   NULL, 'Minor Errand-Running', 'Quick Attack', '1x Colorless', '1x Lightning, 1x Colorless', 0, '10+', NULL,
   'Common', 2006, 'Naoyo Kimura', 'English', 'Normal', 'NUG-178-SLA', 1),

  /* Black & White: Emerging Powers  */
  ('BWEP', 032, 'Emolga', 'Pokemon', 'BASIC', NULL, 587, 70, 'Lightning', NULL, 'Fighting', NULL, 0, NULL, NULL, NULL,
   'Thundershock', 'Acrobatics', '1x Lightning', '2x Colorless', 10, '10+',
   'The energy made in its cheeks'' electric pouches is stored inside its membrane and released while it is gliding.',
   'Common', 2011, 'Kouki Saitou', 'English', 'Normal', NULL, 1),

  /* Black and White: Base */
  ('BW1', 042, 'Zebstrika', 'Pokemon', 'STAGE 1', 'Evolves from Blitzle', 523, 90, 'Lightning', NULL, 'Fighting', NULL,
   1, NULL, NULL, NULL, 'Stomp', 'Wild Charge', '2x Colorless', '2x Lightning, 1x Colorless', '20+', 70,
   'This ill-tempered Pokemon is dangerous because when it''s angry, it shoots lightning from its mane in all directions.',
   'Uncommon', 2011, 'Kouki Saitou', 'English', 'Normal', NULL, 1);

SELECT *

FROM lightningCards lC
       LEFT JOIN tcgSets tS ON lC.SetCode = tS.SetCode;