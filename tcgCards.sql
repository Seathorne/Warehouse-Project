/**
 ** New cards acquired in Surging Sparks packs;
 **************************************************************************************
 Lisia's Appeal             TRAINER -> Supporter, Illus. En Morikura
 H-SSP 179/191 [Diamond]  =  "Switch in 1 of your opponent's Benched Basic Pokémon to
  (Reverse Holo)              the Active Spot. If you do, the new Active Pokémon is
                              now Confused."

 Dragon Elixir              TRAINER -> Item, Illus. AYUMI ODASHIMI
 H-SSP 172/191 [Diamond]  =  "Heal 60 damage from your Active [Dragon] Pokémon."

 Deduction Kit              TRAINER -> Item, Illus. AYUMI ODASHIMI
 H-SSP 171/191 [Diamond]  =  "Look at the top 3 cards of your deck and put them
                              back in any order, or shuffle them and put them
                              on the bottom of your deck."
 **************************************************************************************
 */

-----------------------------------------------------------------------
/*  1. Set up tcgCards table with a few cards. */
-----------------------------------------------------------------------

-- (To ensure table is not created):
DROP TABLE tcgCards;

 -- If table "tcgCards" not created,:
CREATE TABLE IF NOT EXISTS tcgCards (
  CardId INTEGER PRIMARY KEY, -- Implied unique;
  Name TEXT(20),
  Illustrator TEXT(20), -- e.g. 'Ken Sugimori', 'AYUMI ODASHIMI'
  CardType TEXT(10), -- e.g. 'Pokemon', 'Trainer';
  CardSubType TEXT(20), -- e.g. 'EX', 'Supporter', 'Item', 'Lv. X' ;
  CardSet TEXT(20), -- e.g. 'Base Set', 'Jungle', 'Surging Sparks';
  SetId TEXT(5), -- e.g. 'PAF', 'TEF', 'BW2', 'SSP' only;
  SetNumber INTEGER, -- e.g. 171 (/191 --> JOIN with tcgSets.);
  RaritySymbol TEXT(20), -- e.g. 'Black Star', 'Diamond', 'Circle';
  Rarity TEXT(20), -- 'Holo Rare', 'Common', 'Full Art';
  CardHolo BOOLEAN,  -- True/False;
  CardEffect TEXT(100) -- Card description or text/effect in play.
);

-- Verify table exists (empty):
SELECT CardId,Name,CardSet,SetId,SetNumber,RaritySymbol
FROM tcgCards;

-- Add column for language,:
ALTER TABLE tcgCards ADD COLUMN Language TEXT(20); -- e.g. 'English'

-- Insert 1st card into table with basic info (update later):
INSERT INTO tcgCards
VALUES (
        NULL, -- card ID null now
        /* Name: */ 'Lisia''s Appeal',
        /* Illus.: */ 'En Morikura',
        'TRAINER','Supporter',
        'Surgin'' Sparks',
        'SSP', 179,
        'Diamond',
        'Uncommon Reverse Holo', TRUE,
        'Switch in 1 of your opponent''s Benched Basic Pokémon to
 the Active Spot. If you do, the new Active Pokémon is
 now Confused.','English'
       );

-- Verify card exists;
SELECT * FROM tcgCards
  WHERE Name = 'Lisia''s Appeal';
SELECT Name,CardSubType, Illustrator, Rarity
FROM tcgCards
WHERE SetId = 'SSP' AND SetNumber = 179;

-- Rename column "CardSet" to "SetName"
/* Not allowed in SQLite ***/
-- ALTER TABLE tcgCards
-- MODIFY COLUMN CardSet
-- RENAME TO SetName;
/* Must recreate table or modify manually. */

-- Add more cards with multiples VALUES:
/* Missing: CardId(*), Illustrator, CardHolo bool, SetName, RaritySymbol, CardEffect text.  */
INSERT INTO tcgCards (Name, CardType, CardSubType, SetId, SetNumber, Rarity)
VALUES ('Dragon Elixir', 'TRAINER', 'Item', 'SSP', 172, 'Common'),
       ('Deduction Kit', 'TRAINER', 'Item', 'SSP', 171, 'Common');

-- Verify new cards (should be 3 in total):
SELECT *
FROM tcgCards
WHERE SetId = 'SSP';

-----------------------------------------------------------------------
/*  2. Update missing values from 2 newly added cards.  */
-----------------------------------------------------------------------
--.* First: update Illustrator for both added cards.

-- Select both cards needing updates...
SELECT *
FROM tcgCards
WHERE Name = 'Dragon Elixir' AND SetNumber = 172
   OR Name = 'Deduction Kit' AND SetNumber = 171;

-- Create a CTE for the two-card set.
WITH twoCards (Name, SetNumber, Illustrator) AS (
  SELECT Name, SetNumber, Illustrator
    FROM tcgCards
    WHERE Name = 'Dragon Elixir' AND SetNumber = 172
       OR Name = 'Deduction Kit' AND SetNumber = 171
  ) -- and...

SELECT * FROM twoCards;

-- Now change the query to SELECT those only where Illustrator is NULL:
WITH twoCards (Name, SetNumber, Illustrator) AS (
  SELECT Name, SetNumber, Illustrator
    FROM tcgCards
    WHERE Name = 'Dragon Elixir' AND SetNumber = 172
       OR Name = 'Deduction Kit' AND SetNumber = 171
  ) -- and...

SELECT * FROM twoCards -- Add a condition here:
WHERE twoCards.Illustrator IS NULL;
  /* Verify with this condition instead:  */
-- WHERE twoCards.Illustrator IS NOT NULL;

-- Finally, update the values.
WITH twoCards (Name, SetNumber, Illustrator) AS (
  SELECT Name, SetNumber, Illustrator
    FROM tcgCards
    WHERE Name = 'Dragon Elixir' AND SetNumber = 172
       OR Name = 'Deduction Kit' AND SetNumber = 171
  ) -- and...

UPDATE tcgCards
SET Illustrator = 'AYUMI ODASHIMI'
WHERE EXISTS ( -- Join tcgCards & twoCards on identifiers
  SELECT 1 FROM twoCards
           WHERE Name = tcgCards.Name
             AND SetNumber = tcgCards.SetNumber
             /* condition only when Illustrator null, */
           AND twoCards.Illustrator IS NULL
);

-- Verify Illustrator was updated:
WITH updatedCards (Name, Illustrator) AS (
  SELECT Name, Illustrator
    FROM tcgCards
    WHERE Name = 'Dragon Elixir' AND ILLUSTRATOR LIKE 'AYUMI%'
       OR Name = 'Deduction Kit' AND ILLUSTRATOR LIKE 'AYUMI%'
  )
SELECT * FROM tcgCards C
WHERE EXISTS (
  SELECT 1 FROM updatedCards U
           WHERE U.Name = C.Name
             AND U.Illustrator = C.Illustrator
             AND C.Illustrator = 'AYUMI ODASHIMI'
);

--.* Next step: update CardHolo boolean and RaritySymbol using CASE.
--.* Finally, update SetName and CardEffect.