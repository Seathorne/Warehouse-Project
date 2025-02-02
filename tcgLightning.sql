/********************************************************************/
/** Reference table:    */
CREATE TABLE IF NOT EXISTS tcgCards (
  CardId INTEGER PRIMARY KEY, -- Implied unique;
  Name TEXT(20),
  Illustrator TEXT(20), -- e.g. 'Ken Sugimori', 'AYUMI ODASHIMI'
  CardType TEXT(10), -- e.g. 'Pokemon', 'Trainer';
  CardSubType TEXT(20), -- e.g. 'EX', 'Supporter', 'Item', 'Lv. X' ;
  SetName TEXT(20), -- e.g. 'Base Set', 'Jungle', 'Surging Sparks';
  SetId TEXT(5), -- e.g. 'PAF', 'TEF', 'BW2', 'SSP' only;
  SetNumber INTEGER, -- e.g. 171 (/191 --> JOIN with tcgSets.);
  RaritySymbol TEXT(20), -- e.g. 'Black Star', 'Diamond', 'Circle';
  Rarity TEXT(20), -- 'Holo Rare', 'Common', 'Full Art';
  CardHolo BOOLEAN,  -- True/False;
  CardEffect TEXT(100), -- Card description or text/effect in play.
  Language TEXT(20), -- E.g., English, French, Spanish, Japanese.
  PrintedYear TEXT(4)
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
  SetName TEXT(20),
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
SELECT SetId, SetName, Length, Symbol, Year FROM sets;

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
END
WHERE Type = 'Lightning'

-------------------------------