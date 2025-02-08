/* 1. Table setup:  */
CREATE TABLE IF NOT EXISTS continents (
  Name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS countries (
  Name VARCHAR(40) PRIMARY KEY,
  Continent VARCHAR(20),
  Population NUMERIC(10) NOT NULL DEFAULT 0,
  FOREIGN KEY (Continent) REFERENCES continents(Name)
);

CREATE TABLE IF NOT EXISTS cities (
  Name VARCHAR(30) PRIMARY KEY,
  Continent VARCHAR(20),
  Country VARCHAR(40),
  Population NUMERIC(10) NOT NULL DEFAULT 0,
  FOREIGN KEY (Continent) REFERENCES continents(Name),
  FOREIGN KEY (Country) REFERENCES countries(Name)
);

-- /* DELETE and SELECT statements:  */
DELETE FROM countries
  WHERE Name = 'EUROPE';
DELETE FROM cities
  WHERE Continent = 'EUROPE';
SELECT * FROM countries
  WHERE Continent = 'EUROPE';
SELECT * FROM cities
  WHERE Continent = 'EUROPE';

/* 2. Table data entry:   */
INSERT INTO continents (Name)
VALUES ('AFRICA'),
       ('ANTARCTICA'),
       ('ASIA'),
       ('AUSTRALIA'),
       ('EUROPE'),
       ('NORTH AMERICA'),
       ('SOUTH AMERICA');

SELECT * FROM continents;

-- Insert largest cities in Europe
WITH largestEuropeCountries (Name, Continent, Population) AS
  (SELECT 'Russia', 'EUROPE', 143447812
   UNION ALL  SELECT 'Germany', 'EUROPE', 83200000
   UNION ALL  SELECT 'United Kingdom', 'EUROPE', 67330000
   UNION ALL  SELECT 'France', 'EUROPE', 67390000
   UNION ALL  SELECT 'Italy', 'EUROPE', 60360000
)
INSERT INTO countries
SELECT * FROM largestEuropeCountries
WHERE NOT EXISTS (
  SELECT 1 FROM countries
           WHERE Name = countries.Name
);

-- Insert 3 cities per European country
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- Russia
('Moscow', 'EUROPE', 'Russia', 12506468),
('Saint Petersburg', 'EUROPE', 'Russia', 5351935),
('Novosibirsk', 'EUROPE', 'Russia', 1620162),
-- Germany
('Berlin', 'EUROPE', 'Germany', 3669495),
('Hamburg', 'EUROPE', 'Germany', 1841179),
('Munich', 'EUROPE', 'Germany', 1471508),
-- United Kingdom
('London', 'EUROPE', 'United Kingdom', 9002488),
('Birmingham', 'EUROPE', 'United Kingdom', 2607437),
('Leeds', 'EUROPE', 'United Kingdom', 1889095),
-- France
('Paris', 'EUROPE', 'France', 2148271),
('Marseille', 'EUROPE', 'France', 861635),
('Lyon', 'EUROPE', 'France', 513275),
-- Italy
('Rome', 'EUROPE', 'Italy', 4342212),
('Milan', 'EUROPE', 'Italy', 1396059),
('Naples', 'EUROPE', 'Italy', 959470);

-- Select European cities in alphabetical order:
SELECT * FROM cities
WHERE Continent = 'EUROPE'
ORDER BY Name;

/* INSERT ETC... **/

----------------------------------------------------------------

/* 3. Testing aggregate queries:  */
-- Calculate total country and average city population in USA:
SELECT Continent, Country, SUM(Population), AVG(Population)
FROM cities
WHERE Country = 'United States';

-- Alias total country population and group to sort by aggregates:
SELECT Continent, Country, SUM(Population) as TotalPop, AVG(Population)
FROM cities
GROUP BY Continent, Country
HAVING TotalPop > 0;

-- add ORDER BY clauses to SELECT query:
SELECT Continent, Country, SUM(Population), AVG(Population) AS AvgPop
FROM cities
GROUP BY Country
HAVING AvgPop >= 1000
ORDER BY 1 DESC, 2 DESC, 4 DESC;

/*  4. Full SELECT statement with sorting, filtering and aggregates.  */
 --  (use aggregate CTEs to calculate country population, city average population,)
 --  (use GROUP BY country to condense results for all cities,)
 --  (use HAVING to check conditional and filter by minimum population,)
 --  (finally, sort with ORDER BY; descending by city average population...then by Continent.)
SELECT Continent, Country,
       SUM(Population) as CountryPopulation,
       AVG(Population) as AverageCityPopulation
FROM cities
  GROUP BY Country
  HAVING AVG(Population) >= 25
ORDER BY 1, 4 DESC;

SELECT *
  FROM cities
WHERE Country = 'Russia';

UPDATE cities
  SET Country = 'Vostok'
WHERE Name LIKE '%Vostok%';

SELECT * FROM cities WHERE Country = 'Vostok';