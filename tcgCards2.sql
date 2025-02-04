-- (To ensure table is not created):
DROP TABLE IF EXISTS tcgCards2;

 -- If table "tcgCards" not created,:
CREATE TABLE IF NOT EXISTS tcgCards2 (
  SeriesId INTEGER, -- e.g. Base = 1, Jungle = 2, ...,  Scarlet & Violet = 18
  SetId INTEGER, -- e.g. PAF=163, TEF=164, BW=72, SSP=170;
  SetNumber INTEGER NOT NULL, -- e.g. >179< /191
  -------------------
  CardName TEXT(20) NOT NULL,
  Category TEXT(10) NOT NULL, -- e.g. Trainer, DELTA Pokemon, Pokemon EX
  SubCategory TEXT(10) NULL, -- e.g. BASIC, ITEM, SUPPORTER
  CardEffect TEXT(100) DEFAULT NULL, -- Card description or text/effect in play.
  --------------------
  PokeId INTEGER, -- 137 for Porygon
  MaxHp INTEGER,
  Type TEXT(10) NULL, -- e.g. 'Fire'
  DeltaType TEXT(10) DEFAULT NULL, -- e.g. 'Metal'
  WeakType TEXT(10),
  ResistType Text(10),
  RetreatCost INTEGER,
  --------------------------
  AbilityName TEXT(20) DEFAULT NULL,
  PokeBody TEXT(20) NULL, -- e.g. 'Dragon Aura'
  PokePower TEXT(20) NULL, -- e.g. 'Dragon Curse'
  Attack1Name TEXT(20), -- e.g. 'Extra Flame'
  Attack2Name TEXT(20), -- e.g. 'Heat Blast', 'Tumbling Attack'
  Attack1Cost VARCHAR(30), -- e.g. 'Fire, Water'
  Attack2Cost VARCHAR(30),
  Attack1Damage INTEGER,
  Attack2Damage INTEGER, -- e.g. 30+, 80
  FlavorText TEXT(120), -- e.g. "When Kingdra gather in great numbers..."
  ------------------------
  Rarity TEXT(20), -- e.g. 'Common', 'Uncommon', 'Rare';
  PrintYear INTEGER, -- E.g. 2024
  Illustrator TEXT(20), -- e.g. 'Ken Sugimori', 'AYUMI ODASHIMI'
  Language TEXT(20), -- E.g., English, French, Spanish, Japanese.
  Edition TEXT(20), -- 'Holo', 'Reverse Holo', 'Full Art';
  -----------------------
  SerialNumber TEXT(12),
  Quantity INTEGER NOT NULL DEFAULT 1,
  -- FOREIGN KEY (PokeId) REFERENCES tcgPokemon(PokeID),
  PRIMARY KEY (SetNumber, SetId),
  FOREIGN KEY (SeriesId) REFERENCES tcgSeries(SeriesId),
  FOREIGN KEY (SetId) REFERENCES tcgSets(SetID)
);

--------------------------------------
-- Insert default card information
--  and Pokémon-specific statistics:
---------------------------------------
/* Holo DELTA Kingdra – Holon Phantoms (2006)  */
INSERT INTO tcgCards2 (
    CardName, Category, Edition, SetNumber, SetId, SeriesId, SerialNumber,
                       Illustrator, PrintYear, Language, Rarity, CardEffect)
VALUES
('Kingdra', 'DELTA SPECIES Pokémon', 'Holo', 010, 35, 07, '6SP-RGE-DSR',
 'Masakazu Fukuda', 2006, 'English', 'Rare',
 'Evolves from Seadra. This Pokémon is both Fire/Metal type.');

/* Holo DELTA Kingdra – Holon Phantoms (2006)  */
UPDATE tcgCards2
SET Type = 'Fire', DeltaType = 'Metal', MaxHp = 110,
    PokeId = 230, ResistType = NULL, WeakType = 'Lightning', RetreatCost = 2,
    PokeBody = NULL, PokePower = 'Dragon Curse',
    Attack1Cost = 'Fire, Colorless', Attack2Cost = 'Fire, Metal, Colorless x2',
    Attack1Damage = '30+', Attack2Damage = '80',
    Attack1Name = 'Extra Flame', Attack2Name = 'Heat Blast'
WHERE SetId ||'/'|| SetNumber = '35/10';
-----------------------------------------

-- Look up cards by series and set name:
SELECT * FROM tcgSets WHERE SetName = 'Next Destinies'; -- 75//14
SELECT * FROM tcgSets WHERE SetName LIKE '%Holon Phantoms%';

SELECT T.Type, T.CardName, S.SetName, R.SeriesCode, R.SeriesName
FROM tcgCards2 AS T,
     tcgSets AS S,
     tcgSeries AS R
WHERE T.SetID = S.SetID
  AND S.SeriesID = R.SeriesID;