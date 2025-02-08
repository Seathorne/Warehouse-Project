/* 3. Testing aggregate queries:  */
-- Groups cities by both continent and country (in North/South America),
-- Calculates total population and average city population for each country,
-- Orders results by continent (upper) and average city population (lower) in descending order
SELECT 'Find most populous cities in the Americas:' AS '';
SELECT Continent, Country,
       SUM(Population) as CountryPopulation,
       AVG(Population) as AverageCityPopulation
FROM cities
WHERE Continent LIKE '%AMERICA%'
GROUP BY Continent, Country
ORDER BY Continent, AverageCityPopulation DESC;

SELECT '  ' AS '';
SELECT ' Alias total country population and group to sort by aggregates:' AS '';
SELECT Continent, Country, SUM(Population) as TotalPop, AVG(Population)
FROM cities
GROUP BY Continent, Country
HAVING TotalPop > 0;

SELECT '  ' AS '';
SELECT ' add ORDER BY clauses to SELECT query:' AS '';
SELECT Continent, Country, SUM(Population), AVG(Population) AS AvgPop
FROM cities
GROUP BY Country
HAVING AvgPop >= 1000
ORDER BY 1 DESC, 2 DESC, 4 DESC;

SELECT '  ' AS '';
SELECT ' 4. Full SELECT statement with sorting, filtering and aggregates.' AS '';
SELECT '  (use aggregate CTEs to calculate country population, city average population,)' AS '';
SELECT '  (use GROUP BY country to condense results for all cities,)' AS '';
SELECT '  (use HAVING to check conditional and filter by minimum population,)' AS '';
SELECT '  (finally, sort with ORDER BY; descending by city average population...then by Continent.)' AS '';
SELECT Continent,
       Country,
       SUM(Population) as CountryPopulation,
       AVG(Population) as AverageCityPopulation
FROM cities
GROUP BY Country
HAVING AVG(Population) >= 25
ORDER BY 1, 4 DESC;