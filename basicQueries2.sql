-- nested query? -- what is this called?
WITH ordered AS
(
 SELECT *, row_number() OVER (ORDER BY Number) as row_num
 FROM gen1Pokemon
)
SELECT * FROM ordered WHERE row_num >= 15;

/* Anthropic's Claude says:
   "That's a Common Table Expression (CTE).
    It creates a temporary named result set that exists only for one query."
 */

/* CALCULATED FIELDS PRACTICE:
 * Concatenating Fields
   Remove Unwanted Spaces
   Using Aliases
   Mathematical Calculations
   CASE WHEN clause
   Case Changes
 */

-- Concatenate column values:
 SELECT Name || Id
 FROM gen1Pokemon;

-- Use concatenated results in query:
WITH concatenated (nameID) AS (
  SELECT Name || ' ' || Id
  FROM gen1Pokemon
)
SELECT * FROM concatenated;

-- (Use printf to format results.)
WITH concatenated (nameID) AS (
--  SELECT Name || ' ' || printf('%03d', Id)
  SELECT printf('%03d', Id) || ' ' || Name
  || '       ' -- add empty spaces
 FROM gen1Pokemon
)
SELECT RTRIM(nameID) -- and trim them off again
FROM concatenated;

-- delete this for next query command...
DELETE FROM gen1Pokemon
  WHERE Number > 1000;

SELECT * FROM gen1Pokemon;


-- Dirty up table with extra spaces names...
WITH concatenated (nameId, Number) AS (
  SELECT '  ' || printf('%03d', Id) || ' ' || Name || '       ',
         1000 + Number
 FROM gen1Pokemon
)
INSERT INTO gen1Pokemon (Name, Number, Description)
SELECT nameId, concatenated.Number, 'spaces dupe--s'
FROM concatenated;

-- Select those with leading/trailing spaces:
SELECT *
FROM gen1Pokemon
WHERE Name LIKE ' % ';

-- Clean up leading/trailing spaces:
UPDATE gen1Pokemon
SET Name = TRIM(Name)
WHERE Name != TRIM(Name);

SELECT * FROM gen1Pokemon;

-- Delete all test database values:
WITH cleanup AS (SELECT Id,
                        Name,
                        TRIM(Name)                        as cleaned,
                        Number,
                        Description,
                        LENGTH(Name) - LENGTH(TRIM(Name)) as spaces
                 FROM gen1Pokemon
                 WHERE Description = 'spaces dupe--s')
DELETE
FROM gen1Pokemon
WHERE Description = 'spaces dupe--s'
  AND EXISTS (SELECT 1
              FROM cleanup
              WHERE cleanup.Number = Number);

-- Alternate formatting style >  (looks better; harder to read)
/* (Answer was provided by Claude.AI)  */
WITH cleanup AS (
  SELECT Id, Name, TRIM(Name) as cleaned,
         Number, Description,
         LENGTH(Name) - LENGTH(TRIM(Name)) as spacesRemoved
  FROM gen1Pokemon
  WHERE Description = 'spaces dupe--s'
)
DELETE FROM gen1Pokemon
WHERE Description = 'spaces dupe--s'
AND EXISTS (SELECT 1
            FROM cleanup
            WHERE cleanup.Number = Number);

SELECT * FROM gen1Pokemon;