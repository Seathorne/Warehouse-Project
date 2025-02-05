/********************************************************************/
/** Reference table:    */
CREATE TABLE IF NOT EXISTS tcgCards (
  CardId INTEGER PRIMARY KEY, -- Implied unique;
  Name TEXT(20),
  Illustrator TEXT(20), -- E.g. 'Ken Sugimori', 'AYUMI ODASHIMI'
  CardType TEXT(10), -- E.g. 'Pokemon', 'Trainer';
  CardSubType TEXT(20), -- E.g. 'Basic', 'Supporter', 'Item', 'Lv. X' ;
  SetName TEXT(20), -- E.g. 'Base Set', 'Jungle', 'Surging Sparks';
  SetId TEXT(5), -- E.g. 'PAF', 'TEF', 'BW2', 'SSP' only;
  SetNumber INTEGER, -- E.g. 171 (/191 --> JOIN with tcgSets.);
  RaritySymbol TEXT(20), -- E.g. 'Black Star', 'Diamond', 'Circle';
  Rarity TEXT(20), -- 'Holo Rare', 'Common', 'Full Art';
  CardHolo BOOLEAN,  -- True/False;
  CardEffect TEXT(100), -- Card description or text/effect in play.
  Language TEXT(20), -- E.g., English, French, Spanish, Japanese.
  PrintedYear TEXT(4), -- E.g. '2024', '2009'
  Type TEXT(10), -- E.g., 'Grass', 'Lightning', 'Metal', 'Electric'
  Type2 TEXT(10), -- E.g., 'Poison', 'Ground'
  AbilityName TEXT(20), -- E.g., 'Adverse Weather'
  AbilityText TEXT(100), -- Passive abilities for each Pokémon
  StyleText TEXT(100) -- Flavor/style text for specific cards
);
/********************************************************************/

-- Verify table exists (empty):
SELECT CardId,Name,SetName,SetId,SetNumber,RaritySymbol
FROM tcgCards;

---------------------------------------------------------------

-- Add new columns to accommodate HP and Pokémon type
ALTER TABLE tcgCards
  ADD COLUMN MaxHp INTEGER(3);
ALTER TABLE tcgCards
  ADD COLUMN Type TEXT(10);
ALTER TABLE TcgCards
  ADD COLUMN Type2 TEXT(10);

-- Update cards' new stats:
UPDATE tcgCards
  SET MaxHp = 1110, Type = 'Electric'
  WHERE Name LIKE 'Luxray%' AND SetId = 'PL2'
                        AND SetNumber = 109;

/* Select Luxray GL Lv. X  in Platinum: Rising Rivals (SP) */
SELECT Name, SetId, SetNumber FROM tcgCards
WHERE Name LIKE 'Luxray%' AND SetId = 'PL2'
                        AND SetNumber = 109;

-- Update if any errors (e.g. overwrite HP)
UPDATE tcgCards
SET MaxHp = 110
WHERE Name LIKE 'Luxray%' AND MaxHp = 1110;

-----------------------------------------------------

-- Insert electric type cards:
WITH newCards (CardType, CardSubType, Name, SetId, SetNumber, Rarity, RaritySymbol, Illustrator, CardEffect)
        AS (
  SELECT 'Pokemon', 'LEVEL-UP', 'Luxray GL Lv. X', 'PL2', 109, 'Rare', 'Star', 'Mitsuhiro Arita', 'Put this card onto your active Luxray GL. Luxray GL Lv. X can use any attack, Poké-Power, or Poké-Body from its previous levels.'
    UNION ALL
  SELECT 'Pokemon', 'Basic', 'Tynamo', 'BW3', 38, 'Common', 'Circle', 'sui', 'None' /* no special effect */
)
INSERT INTO tcgCards (CardType, CardSubType, Name, SetId, SetNumber, Rarity, RaritySymbol, Illustrator, CardEffect)
  SELECT * FROM newCards N
       WHERE NOT EXISTS (
    SELECT 1 FROM tcgCards T WHERE T.Name = N.Name
                             AND T.SetId = N.SetId
                             AND T.SetNumber = N.SetId
  );

-- (If you need to start over) ;
DELETE FROM tcgCards WHERE CardType = 'Pokemon';
SELECT Name, Type FROM tcgCards WHERE CardType = 'Pokemon';

-- Set type for Luxray and Tynamo
  UPDATE tcgCards
  SET Type = 'Lightning'
  WHERE Name LIKE 'Luxray%'
     OR Name LIKE 'Tynamo%';

-- Select all electric [Lightning] type Pokémon:
SELECT Name, SetId, SetNumber, Rarity, Type, MaxHp
  FROM tcgCards WHERE Type = 'Electric'
                   OR Type = 'Lightning';

-------------------------------------------------

-- Create sets table to store names and length of card sets:
CREATE TABLE IF NOT EXISTS sets (
  SetId TEXT(5),
  Name TEXT(20),
  Length INTEGER,
  HiddenLength INTEGER,
  Symbol TEXT(30),
  Year TEXT(4)
);

-- Populate sets table with names, length and symbol:
INSERT INTO sets
  VALUES ('PL2', 'Platinum: Rising Rivals', 111, 114, 'Black X on White', 2009);
INSERT INTO sets
  VALUES ('BW3', 'Black & White: Noble Victories', 101, 102, 'Black V', 2011);

-- View all sets by name:
SELECT SetId, Name, Length, Symbol, Year FROM sets;

--------------------------------------------------------------------------

-- Add column for PrintedYear to Pokémon cards.
ALTER TABLE tcgCards
  ADD COLUMN PrintedYear TEXT(4);

-- Show cards by name and printed year;
SELECT Name, PrintedYear
  FROM tcgCards;

-- Copy year from sets table to cards table:
UPDATE tcgCards
SET PrintedYear = CASE SetId
  WHEN 'PL2' THEN '2009'
  WHEN 'BW3' THEN '2011'
  WHEN 'SSP' THEN '2025'
END
WHERE Type = 'Lightning';

-------------------------------

-- Selects all lightning type cards
--  and show set number out of set length:
SELECT cards.Name, sets.Name,
       cards.SetNumber || '/' || sets.Length as SetNo
  FROM tcgCards cards
    JOIN sets ON cards.SetId = sets.SetId
WHERE cards.Type = 'Lightning';

-- Select all cards whose first type is Lightning:
SELECT Name
  FROM tcgCards
WHERE Type LIKE 'Lightning%' OR Type = 'Electric%';

-----------------------------------------------------

-- Insert gen 4 cards
INSERT INTO tcgCards (Name, Type)
SELECT * FROM (
   VALUES
       ('Feraligatr', 'Water'),
       ('Scizor', 'Bug/Steel'),
       ('Magnezone', 'Electric/Steel'),
       ('Gastrodon', 'Water/Ground')
) AS new_values;

-- Select all cards
SELECT * FROM tcgCards;

-- Delete all new cards (Null Set ID)
DELETE FROM tcgCards
WHERE SetId IS NULL;

--------------------------------------------

-- First, search for second types,
UPDATE tcgCards
  SET Type2 = 'Lightning'
WHERE Type LIKE '%/Lightning' OR Type = '%/Electric';

-- Find all double-types; separate type columns:
UPDATE tcgCards
 SET Type2 = substr(Type, instr(Type, '/') + 1)
WHERE Type LIKE '%/%';

UPDATE tcgCards
 SET Type = substr(Type, 1, instr(Type, '/') - 1)
WHERE Type LIKE '%/%';

-- Show cards by name and type:
SELECT Name, Type, Type2
  FROM tcgCards;

-- Update cards to have consistent type name:
UPDATE tcgCards
  SET Type = 'Lightning'
WHERE Type LIKE 'Lightning%' OR Type LIKE 'Electric%';

-- Update those with NULL second type to "None":
UPDATE tcgCards
  SET Type2 = 'None'
WHERE Type2 IS NULL;

---------------------------------------------------------------

/** Insert Cool Lightning Cards  **/

  -- First, modify columns to add style text and abilities

-- Then update previous cards,
UPDATE tcgCards
  SET AbilityName = 'Bright Look',
      AbilityText = 'Once during your turn (before your attack), when you put Luxray GL Lv. X from your hand onto your Active Luxray GL, you may switch the Defending Pokémon with 1 of your opponent''s Benched Pokémon.',
      StyleText = ''
WHERE SetId = 'PL2' AND Name LIKE 'Luxray%';

UPDATE tcgCards
  SET AbilityName = 'None',
      AbilityText = NULL,
      StyleText = 'While one alone doesn''t have much power, a chain of many Tynamo can be as powerful as lightning.'
WHERE SetId = 'BW3' AND Name = 'Tynamo';

-- Insert new cards collected:
INSERT INTO tcgCards (
    Name, Type, Type2, MaxHp,
    CardType, CardSubType, CardEffect, StyleText,
      AbilityName,
    AbilityText,
    Language, PrintedYear,
      SetId, SetNumber, Illustrator,
      Rarity, RaritySymbol, CardHolo)
VALUES ('Zebstrika', 'Lightning', 'None', 120,
         'Pokemon', 'STAGE 1', 'Evolves from Blitzle', 'They have lightning-like movements. When Zebstrika run at full speed, the sound of thunder reverberates.',
        'None', NULL, /* No special abilities.*/
        'English', 2023,
         'PAR', 063, 'GOSSAN',
         'Uncommon Reverse Holo', 'Diamond', TRUE),
  ('Thundurus', 'Lightning', 'None', 110,
    'Pokemon', 'BASIC', 'None', 'As it flies around, it shoots lightning all over the place and causes forest fires. It is therefore disliked.',
   'Adverse Weather', 'As long as this Pokémon is in the Active Spot, prevent all damage done to your Benched Pokémon by attacks from your opponent''s Pokémon.',
   'English', 2023,
    'OBF', 070, 'GOSSAN',
    'Rare Reverse Holo', 'Star', TRUE),
  ('Vikavolt', 'Lightning', 'None', 160,
    'Pokemon', 'STAGE 2', 'Evolves from Charjabug', 'It builds up electricity in its abdomen, focuses it through its jaws, and then fires the electricity off in concentrated beams.',
   'None', NULL,
   'English', 2024,
    'TEF', 056, 'Hitoshi Ariga',
    'Uncommon Reverse Holo', 'Diamond', TRUE),
  ('Helioptile', 'Normal', 'None', 70, /*add a Normal/Colorless pokémon.*/
    'Pokemon', 'BASIC', 'None', 'When spread, the frills on its head act like solar panels, generating the power behind this Pokémon''s electric moves.',
   'None', NULL,
   'English', 2024,
    'SSP', 154, 'miki kudo',
    'Common', 'Circle', FALSE),
  ('Iron Thorns', 'Electric', 'None', 140,
    'Pokemon', 'BASIC FUTURE', 'None', 'Some of its notable features match those of an object named within a certain expedition journal as Iron Thorns.',
   'None', NULL,
   'English', 2024,
    'TEF', 062, 'Takeshi Nakamura',
    'Rare Holo', 'Star', TRUE)
 ;

-- Select main fields from cards:
SELECT Name, Type, Type2, CardEffect, AbilityName, AbilityText, SetId, SetNumber, Illustrator, StyleText
  FROM tcgCards;

-- Find all TEF cards:
SELECT *
FROM tcgCards
WHERE SetId = 'TEF';