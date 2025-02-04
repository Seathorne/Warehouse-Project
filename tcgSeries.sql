-- Reset to run script file sequentially:
DROP TABLE IF EXISTS tcgSeries;

-- Create fresh table for TCG series:
CREATE TABLE tcgSeries (
   SeriesId INTEGER PRIMARY KEY,
   SeriesName VARCHAR(50),
   SeriesCode VARCHAR(20) DEFAULT NULL
);

-- Insert values for all series:
INSERT INTO tcgSeries (SeriesId, SeriesName) VALUES
(1, 'Base Set'),
(2, 'Gym Heroes'),
(3, 'Topps Chrome'),
(4, 'Neo Genesis'),
(5, 'Legendary Collection'),
(6, 'e-Card'),
(7, 'EX Ruby & Sapphire'),
(8, 'Diamond & Pearl'),
(9, 'Nintendo Promos'),
(10, 'Platinum'),
(11, 'HeartGold SoulSilver'),
(12, 'Call of Legends'),
(13, 'Black & White Promos'),
(14, 'Black & White'),
(15, 'XY'),
(16, 'Sun & Moon'),
(17, 'Sword & Shield'),
(18, 'Scarlet & Violet');
-- Total series: 18

-- Set/update series codes:
UPDATE tcgSeries
SET SeriesCode = CASE SeriesId
  WHEN 1 THEN 'BASE'
  WHEN 2 THEN 'GYM'
  WHEN 3 THEN 'TOPPS'
  WHEN 4 THEN 'NEO'
  WHEN 5 THEN 'LEGENDARY'
  WHEN 6 THEN 'E-CARD'
  WHEN 7 THEN 'RS'
  WHEN 8 THEN 'DP'
  WHEN 9 THEN 'NINTENDO PROMO'
  WHEN 10 THEN 'PT'
  WHEN 11 THEN 'HGSS'
  WHEN 12 THEN 'LEGENDS'
  WHEN 13 THEN 'BW PROMO'
  WHEN 14 THEN 'BW'
  WHEN 15 THEN 'XY'
  WHEN 16 THEN 'SM'
  WHEN 17 THEN 'SS'
  WHEN 18 THEN 'SV'
END WHERE SeriesCode IS NULL;

-- Search all series:
SELECT SeriesId, SeriesName, SeriesCode
FROM tcgSeries;

-- Search all main game series:
SELECT SeriesId, SeriesName, SeriesCode
FROM tcgSeries WHERE SeriesCode LIKE '__';